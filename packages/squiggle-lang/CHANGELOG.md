# @quri/squiggle-lang

## 0.8.6

### Patch Changes

- Added [Calculators](https://www.squiggle-language.com/docs/Api/Calculator), useful for presenting functions to end-users ([#2265](https://github.com/quantified-uncertainty/squiggle/pull/2265), [#2343](https://github.com/quantified-uncertainty/squiggle/pull/2343))

- Added `title` to all [plots](https://www.squiggle-language.com/docs/Api/Plot), and to scales for labeling x and y axes. Added validation for `tickFormat`. ([#2337](https://github.com/quantified-uncertainty/squiggle/pull/2337))

- Improved [mixture()](https://www.squiggle-language.com/docs/Api/Dist#mixture) typing, but limited to 5 parameters maximum ([#2334](https://github.com/quantified-uncertainty/squiggle/pull/2334))

- Added [Dict.pick](https://www.squiggle-language.com/docs/Api/Dictionary#pick), [Dict.omit](https://www.squiggle-language.com/docs/Api/Dictionary#omit) ([#2376](https://github.com/quantified-uncertainty/squiggle/pull/2376))

- [sum](https://www.squiggle-language.com/docs/Api/Number#sum), [product](https://www.squiggle-language.com/docs/Api/Number#product), [sort](https://www.squiggle-language.com/docs/Api/Number#sort), [cumsum](https://www.squiggle-language.com/docs/Api/Number#cumulative-sum), [cumprod](https://www.squiggle-language.com/docs/Api/Number#cumulative-product) all accept lists with 0 elements ([#2351](https://github.com/quantified-uncertainty/squiggle/pull/2351))

- Added [Dist.sum](https://www.squiggle-language.com/docs/Api/Dist#sum), [Dist.product](https://www.squiggle-language.com/docs/Api/Dist#product), [Dist.cumsum](https://www.squiggle-language.com/docs/Api/Dist#cumulative-sum), [Dist.cumprod](https://www.squiggle-language.com/docs/Api/Dist#cumulative-product), [Dist.diff](https://www.squiggle-language.com/docs/Api/Dist#diff) ([#2356](https://github.com/quantified-uncertainty/squiggle/pull/2356))

- Added [List.slice](https://www.squiggle-language.com/docs/Api/List#slice), [Danger.combinations](https://www.squiggle-language.com/docs/Api/Danger#combinations), [Danger.allCombinations](https://www.squiggle-language.com/docs/Api/Danger#allcombinations) ([#2347](https://github.com/quantified-uncertainty/squiggle/pull/2347))

- Added more standard library functions: [typeOf](https://www.squiggle-language.com/docs/Api/Builtin#typeof), [List.every](https://www.squiggle-language.com/docs/Api/List#every), [List.some](https://www.squiggle-language.com/docs/Api/List#some), [List.find](https://www.squiggle-language.com/docs/Api/List#find), [List.findIndex](https://www.squiggle-language.com/docs/Api/List#findindex), [List.zip](https://www.squiggle-language.com/docs/Api/List#zip), [List.unzip](https://www.squiggle-language.com/docs/Api/List#unzip), [List.shuffle](https://www.squiggle-language.com/docs/Api/List#shuffle), [List.uniq](https://www.squiggle-language.com/docs/Api/List#uniq) (works with more types now), [List.uniqBy](https://www.squiggle-language.com/docs/Api/List#uniqby), [Dist.make](https://www.squiggle-language.com/docs/Api/Dist#make), [PointSet.fromNumber](https://www.squiggle-language.com/docs/Api/DistPointSet#fromnumber), [PointSet.make](https://www.squiggle-language.com/docs/Api/DistPointSet#make), [SampleSet.fromNumber](https://www.squiggle-language.com/docs/Api/DistSampleSet#fromnumber), [SampleSet.make](https://www.squiggle-language.com/docs/Api/DistSampleSet#make), [String.make](https://www.squiggle-language.com/docs/Api/String#make), [String.split](https://www.squiggle-language.com/docs/Api/String#split) ([#2290](https://github.com/quantified-uncertainty/squiggle/pull/2290))

- Expanded equality comparisons to include all distributions, dates, time durations, scales, domains, arrays, and dictionaries.

## 0.8.5

### Patch Changes

- Downgrade Typescript target to ES2021. This should help with loading Squiggle components on Observable through unpkg.com. ([#2269](https://github.com/quantified-uncertainty/squiggle/pull/2269))

- Added support for `%` as a number suffix ([#2239](https://github.com/quantified-uncertainty/squiggle/pull/2239))

- Support `pow(dist, integer)` on distributions with negative samples ([#2235](https://github.com/quantified-uncertainty/squiggle/pull/2235))
