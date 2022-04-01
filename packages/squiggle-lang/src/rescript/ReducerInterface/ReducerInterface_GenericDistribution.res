module ExpressionValue = ReducerInterface_ExpressionValue
type expressionValue = ReducerInterface_ExpressionValue.expressionValue

let env: GenericDist_GenericOperation.env = {
  sampleCount: 1000,
  xyPointLength: 1000,
}

let runGenericOperation = GenericDist_GenericOperation.run(~env)

let arithmeticMap = r =>
  switch r {
  | "add" => #Add
  | "dotAdd" => #Add
  | "subtract" => #Subtract
  | "dotSubtract" => #Subtract
  | "divide" => #Divide
  | "logarithm" => #Divide
  | "dotDivide" => #Divide
  | "exponentiate" => #Exponentiate
  | "dotExponentiate" => #Exponentiate
  | "multiply" => #Multiply
  | "dotMultiply" => #Multiply
  | "dotLogarithm" => #Divide
  | _ => #Multiply
  }

let catchAndConvertTwoArgsToDists = (args: array<expressionValue>): option<(
  GenericDist_Types.genericDist,
  GenericDist_Types.genericDist,
)> => {
  switch args {
  | [EvDist(a), EvDist(b)] => Some((a, b))
  | [EvNumber(a), EvDist(b)] => Some((GenericDist.fromFloat(a), b))
  | [EvDist(a), EvNumber(b)] => Some((a, GenericDist.fromFloat(b)))
  | _ => None
  }
}

let toFloatFn = (
  fnCall: GenericDist_Types.Operation.toFloat,
  dist: GenericDist_Types.genericDist,
) => {
  FromDist(GenericDist_Types.Operation.ToFloat(fnCall), dist)->runGenericOperation->Some
}

let toDistFn = (fnCall: GenericDist_Types.Operation.toDist, dist) => {
  FromDist(GenericDist_Types.Operation.ToDist(fnCall), dist)->runGenericOperation->Some
}

let twoDiststoDistFn = (direction, arithmetic, dist1, dist2) => {
  FromDist(
    GenericDist_Types.Operation.ToDistCombination(
      direction,
      arithmeticMap(arithmetic),
      #Dist(dist2),
    ),
    dist1,
  )->runGenericOperation
}

let genericOutputToReducerValue = (o: GenericDist_GenericOperation.outputType): result<
  expressionValue,
  Reducer_ErrorValue.errorValue,
> =>
  switch o {
  | Dist(d) => Ok(ReducerInterface_ExpressionValue.EvDist(d))
  | Float(d) => Ok(EvNumber(d))
  | String(d) => Ok(EvString(d))
  | GenDistError(NotYetImplemented) => Error(RETodo("Function not yet implemented"))
  | GenDistError(Unreachable) => Error(RETodo("Unreachable"))
  | GenDistError(DistributionVerticalShiftIsInvalid) =>
    Error(RETodo("Distribution Vertical Shift is Invalid"))
  | GenDistError(Other(s)) => Error(RETodo(s))
  }

let dispatchToGenericOutput = (call: ExpressionValue.functionCall): option<
  GenericDist_GenericOperation.outputType,
> => {
  let (fnName, args) = call
  switch (fnName, args) {
  | ("sample", [EvDist(dist)]) => toFloatFn(#Sample, dist)
  | ("mean", [EvDist(dist)]) => toFloatFn(#Mean, dist)
  | ("normalize", [EvDist(dist)]) => toDistFn(Normalize, dist)
  | ("toPointSet", [EvDist(dist)]) => toDistFn(ToPointSet, dist)
  | ("cdf", [EvDist(dist), EvNumber(float)]) => toFloatFn(#Cdf(float), dist)
  | ("pdf", [EvDist(dist), EvNumber(float)]) => toFloatFn(#Pdf(float), dist)
  | ("inv", [EvDist(dist), EvNumber(float)]) => toFloatFn(#Inv(float), dist)
  | ("toSampleSet", [EvDist(dist), EvNumber(float)]) =>
    toDistFn(ToSampleSet(Belt.Int.fromFloat(float)), dist)
  | ("truncateLeft", [EvDist(dist), EvNumber(float)]) => toDistFn(Truncate(Some(float), None), dist)
  | ("truncateRight", [EvDist(dist), EvNumber(float)]) =>
    toDistFn(Truncate(None, Some(float)), dist)
  | ("truncate", [EvDist(dist), EvNumber(float1), EvNumber(float2)]) =>
    toDistFn(Truncate(Some(float1), Some(float2)), dist)
  | (("add" | "multiply" | "subtract" | "divide" | "exponentiate") as arithmetic, [a, b] as args) =>
    catchAndConvertTwoArgsToDists(args) -> E.O2.fmap(((fst, snd)) =>
      twoDiststoDistFn(Algebraic, arithmetic, fst, snd)
    )
  | (
      ("dotAdd" | "dotMultiply" | "dotSubtract" | "dotDivide" | "dotExponentiate") as arithmetic,
      [a, b] as args,
    ) =>
    catchAndConvertTwoArgsToDists(args) -> E.O2.fmap(((fst, snd)) =>
      twoDiststoDistFn(Pointwise, arithmetic, fst, snd)
    )
  | _ => None
  }
}

let dispatch = call => {
  dispatchToGenericOutput(call) -> E.O2.fmap(genericOutputToReducerValue)
}
