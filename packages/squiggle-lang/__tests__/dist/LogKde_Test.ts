import { operationDistError } from "../../src/dist/DistError.js";
import * as distOperations from "../../src/dist/distOperations/index.js";
import {
  DivisionByZeroError,
  NegativeInfinityError,
} from "../../src/operationError.js";
import * as Result from "../../src/utility/result.js";
import { env, mkExponential, mkUniform } from "../helpers/distHelpers.js";
import { kde } from "../../src/dist/SampleSetDist/kde.js";
import { logKde } from "../../src/dist/SampleSetDist/logKde.js";
import * as XYShape from "../../src/XYShape.js";
import * as E_A_Floats from "../../src/utility/E_A_Floats.js";
import * as fc from "fast-check";

import sum from "lodash/sum.js";

const exampleSets = [
  [
    1, 2, 3, 3, 10, 5, 4, 3, 3, 24, 2, 34, 234, 23, 423, 42, 42, 34, 23, 42,
    342, 34, -234, -234, 234, -234234, -23423, -234, -234234234, -234234,
  ].sort((a, b) => a - b),
  [
    9.999999999999913, 6.240608076948177e-103, -9.999999999999892,
    1.9994014806266345e-214, 0.0002136008066252708, 5.338627735731214e-217,
    1.280993062384912e-273, -5.341810088677615e-141, -5.16743119727708e-91,
    -9.999999999999998, 7.156412753173525e-69, -9.999999999999892,
  ].sort((a, b) => a - b),
  [
    9.999999999999913, 6.240608076948177, -9.999999999999892,
    1.9994014806266345e-3, 0.0002136008066252708, 5.338627735731214e-2,
    1.280993062384912e-2, -5.341810088677615e-1, -5.16743119727708e-9, -9.998,
    7.156412753173525e-6, -9.2,
  ].sort((a, b) => a - b),
  [
    9.999999999999911 - 1.3632457703166074e-27 - 9.999999999999943,
    -9.4e-3,
    3.332218827512389e-85,
    1.1935972557142008e-131,
    -9.999999999999927,
    4.515765563731498e-139,
    1.5027846628562643e-105,
    9.999999999999998,
    1.2180312986732202e-8,
    9.99999999999998,
    2.4e-3,
    2.5e-33,
    3.1002048324181595e-32,
  ]
    .sort((a, b) => a - b)
    .filter((r) => r < 0),
  [
    9.999999999999897, 9.999999999999908, -9.999999999999895,
    -0.47897567803695595, -9.999999999999975, -9.999999999999899,
    9.999999999999917, -9.999999999999973, 1.4256701028060695e-8,
    9.999999999999902, -9.99999999999998, 9.999999999999952, -9.999999999999947,
    7.429316900977465, 9.999999999999904, 9.999999999999915, -9.999999999999957,
    -9.99999999999989, 9.999999999999915,
  ].sort((a, b) => a - b),
  [
    -9.999999999999941, -9.999999999999941, -9.999999999999934,
    -9.999999999999929, -9.999999999999924, -9.999999999999918,
    -9.999999999999915, -9.999999999999902, -9.9999999999999,
    -9.999999999999899, -0.6613401978172702, 0.0000036109773508749995,
    9.999999999999892, 9.999999999999922, 9.999999999999936, 9.999999999999986,
  ].sort((a, b) => a - b),
];

const propertyTests = () => {
  fc.assert(
    fc.property(
      fc.array(
        fc
          .double({ min: -10, max: 10, noNaN: true, noDefaultInfinity: true })
          .filter((x) => Math.abs(x) >= 1e-50),
        {
          minLength: 20, // 5 samples or below filtered out in SampleSetDist.toPointSetDist
        }
      ),
      fc.integer({ min: 100, max: 100 }), // 4 is the minimum allowed length
      (samples, outputLength) => {
        // if (samples.find((v) => v === 0 || Math.abs(v) < 1e-300)) return true;
        const sortedSamples = samples
          .filter((v) => v !== 0)
          .sort((a, b) => a - b);
        const len = sortedSamples.length;
        const weight = 1 / len;
        // The bandwidth recommendations always return a width less than the
        // range, so it doesn't make sense to test very large widths.
        // But fast-check might make the range of the samples arbitrarily
        // small, so we test here.
        if (sortedSamples[len - 1] - sortedSamples[0] < 2 * 5) return true;
        if (sortedSamples.length < 5) return true;
        const { xs, ys } = logKde({
          samples: sortedSamples,
          outputLength,
          weight: 1,
        });
        describe(`WIth ${outputLength}, ${sortedSamples.length}`, () => {
          test("No invalid numbers", () => {
            const invalid = [
              ...xs.filter((x) => !Number.isFinite(x)),
              ...ys.filter((y) => !Number.isFinite(y)),
            ];
            if (invalid.length > 0)
              console.log("invalid", invalid, sortedSamples);
            expect(invalid.length).toEqual(0);
          });
          test("lengths of xs and ys should match", () => {
            expect(xs.length).toEqual(ys.length);
          });
          test("lengths of xs should almost match outputLength", () => {
            expect(Math.abs(xs.length - outputLength)).toBeLessThan(2);
          });
          test("should have y value 0 on both sides to indicate no tails", () => {
            expect(ys[0]).toBeCloseTo(0);
            expect(ys[outputLength - 1]).toBeCloseTo(0);
          });
          test("should be sorted", () => {
            if (!E_A_Floats.isSorted(xs))
              console.log("NOT SORTED!!!. xs", xs, sortedSamples);
            expect(E_A_Floats.isSorted(xs)).toBe(true);
          });
          test("Integral is right", () => {
            const integral = XYShape.Range.integrateWithTriangles({ xs, ys });
            expect(integral.ys[0]).toBeCloseTo(0);
            console.log(integral);
            // expect(integral.ys[integral.ys.length - 1]).toBeCloseTo(1);
          });
        });
        // test("Similar to KDE", () => {
        //   const integral = XYShape.Range.integrateWithTriangles({ xs, ys });
        //   const integral2 = XYShape.Range.integrateWithTriangles({
        //     xs: xsKde,
        //     ys: ysKde,
        //   });
        //   console.log({ integral, integral2 });
        //   expect(ys[0]).toBeCloseTo(0);
        //   expect(ys[outputLength - 1]).toBeCloseTo(0);
        // });
      }
    )
  );

  //
};
const block = (samples: number[], outputLength: number) => {
  const params = {
    samples: samples.sort((a, b) => a - b),
    outputLength: outputLength,
    weight: 1,
    kernelWidth: 1,
  };
  const { xs, ys } = logKde(params);
  test("No invalid numbers", () => {
    const invalid = [
      ...xs.filter((x) => !Number.isFinite(x)),
      ...ys.filter((y) => !Number.isFinite(y)),
    ];
    if (invalid.length > 0) console.log("invalid", invalid);
    expect(invalid.length).toEqual(0);
  });
  test("lengths of xs and ys should match outputLength", () => {
    expect(xs.length).toEqual(outputLength);
    expect(ys.length).toEqual(outputLength);
  });
  test("should have y value 0 on both sides to indicate no tails", () => {
    expect(ys[0]).toBeCloseTo(0);
    expect(ys[outputLength - 1]).toBeCloseTo(0);
  });
  test("should be sorted", () => {
    if (!E_A_Floats.isSorted(xs)) console.log("NOT SORTED!!!. xs", xs);
    expect(E_A_Floats.isSorted(xs)).toBe(true);
  });
  test("Integral is right", () => {
    const firstKde = kde(params);
    const integral2 = XYShape.Range.integrateWithTriangles(kde(params));
    const integral = XYShape.Range.integrateWithTriangles({ xs, ys });
    /* The line `console.log("FIrst", firstKde, { xs, ys }, integral2, integral);` is printing the
    values of `firstKde`, `{ xs, ys }`, `integral2`, and `integral` to the console. This is useful
    for debugging and understanding the values and calculations involved in the code. */
    // console.log("FIrst", firstKde, { xs, ys }, integral2, integral);
    expect(integral.ys[0]).toBeCloseTo(0);
    expect(integral.ys[integral.ys.length - 1]).toBeCloseTo(1);
  });
  //   propertyTests();
};

describe("LogKDE", () => {
  //   block(exampleSets[0], 20);
  block(exampleSets[0], 50);
  //   propertyTests();
});
