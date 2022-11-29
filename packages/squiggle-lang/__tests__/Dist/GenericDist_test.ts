import { BaseDist } from "../../src/Dist/BaseDist";
import { DistError } from "../../src/Dist/DistError";
import { SampleSetDist } from "../../src/Dist/SampleSetDist/SampleSetDist";
import { Env } from "../../src";
import * as Result from "../../src/utility/result";
import { Ok } from "../../src/utility/result";
import { unpackResult } from "./distTestHelpers";

const env: Env = {
  sampleCount: 100,
  xyPointLength: 100,
};

import {
  normalDist5,
  normalDist,
  uniformDist,
  betaDist,
  lognormalDist,
  cauchyDist,
  triangularDist,
  exponentialDist,
} from "./fixtures";

describe("toPointSet", () => {
  test("on symbolic normal distribution", () => {
    const result = Result.fmap(normalDist5.toPointSetDist(env), (p) =>
      p.mean()
    );

    expect(unpackResult(result)).toBeCloseTo(5, 0);
  });

  const pointSet = unpackResult(
    Result.bind(
      Result.bind(normalDist5.toPointSetDist(env), (pointSet) =>
        SampleSetDist.fromDist(pointSet, env)
      ),
      (sampleSet) => sampleSet.toPointSetDist(env)
    )
  );

  test("mean from sample set", () => {
    const mean = pointSet.mean();

    expect(mean).toBeCloseTo(5, -1);
  });

  test("isNormalized from sample set", () => {
    const isNormalized = pointSet.isNormalized();
    expect(isNormalized).toBe(true);
  });
});

describe("sparkline", () => {
  let runTest = (
    name: string,
    dist: BaseDist,
    expected: Result.result<string, DistError>
  ) => {
    test(name, () => {
      const result = dist.toSparkline(20, env);
      expect(result).toEqual(expected);
    });
  };

  runTest("normal", normalDist, Ok(`▁▁▁▁▁▂▄▆▇██▇▆▄▂▁▁▁▁▁`));

  runTest("uniform", uniformDist, Ok(`████████████████████`));

  runTest("beta", betaDist, Ok(`▁▄▇████▇▆▅▄▃▃▂▁▁▁▁▁▁`));

  runTest("lognormal", lognormalDist, Ok(`▁█▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁`));

  runTest("cauchy", cauchyDist, Ok(`▁▁▁▁▁▁▁▁▁██▁▁▁▁▁▁▁▁▁`));

  runTest("triangular", triangularDist, Ok(`▁▁▂▃▄▅▆▇████▇▆▅▄▃▂▁▁`));

  runTest("exponential", exponentialDist, Ok(`█▅▄▂▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁`));
});
