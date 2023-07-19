import { PointMass } from "../dist/SymbolicDist.js";
import { makeDefinition } from "../library/registry/fnDefinition.js";
import {
  frArray,
  frAny,
  frBool,
  frDist,
  frDistOrNumber,
  frLambda,
  frNumber,
  frOptional,
  frRecord,
  frScale,
  frString,
} from "../library/registry/frTypes.js";
import { FnFactory } from "../library/registry/helpers.js";
import { REOther } from "../errors/messages.js";
import * as Result from "../utility/result.js";
import { LabeledDistribution, vPlot } from "../value/index.js";

const maker = new FnFactory({
  nameSpace: "Table",
  requiresNamespace: true,
});

export const library = [
  maker.make({
    name: "make",
    output: "Plot",
    examples: [],
    definitions: [
      makeDefinition(
        [
          frRecord(
            ["elements", frArray(frAny)],
            [
              "columns",
              frArray(
                frRecord(["fn", frLambda], ["name", frOptional(frString)])
              ),
            ]
          ),
        ],
        ([{ elements, columns }]) => {
          return vPlot({
            type: "table",
            elements,
            columns: columns.map(({ fn, name }) => ({
              fn,
              name: name ?? undefined,
            })),
          });
        }
      ),
    ],
  }),
];
