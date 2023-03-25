import { Env, result, SqError, SqLambda, SqValue } from "@quri/squiggle-lang";
import _ from "lodash";
import * as React from "react";
import { FC, useEffect, useMemo, useRef, useState } from "react";
import { useMeasure, useUpdate } from "react-use";

import * as d3 from "d3";
import { useCanvas } from "../../lib/hooks";
import { ErrorAlert } from "../Alert";
import {
  DistributionChart,
  DistributionChartSettings,
} from "../DistributionChart";
import { NumberShower } from "../NumberShower";
import { FunctionChartSettings } from "./index";
import { drawAxes, getFunctionImage, Padding } from "./utils";

function unwrap<a, b>(x: result<a, b>): a {
  if (x.ok) {
    return x.value;
  } else {
    throw Error("FAILURE TO UNWRAP");
  }
}
type FunctionChart1DistProps = {
  fn: SqLambda;
  settings: FunctionChartSettings;
  distributionChartSettings: DistributionChartSettings;
  environment: Env;
  height: number;
};

type Percentiles = {
  x: number;
  areas: {
    1: [number, number];
    5: [number, number];
    10: [number, number];
    20: [number, number];
    30: [number, number];
    40: [number, number];
  };
  50: number;
};

type Errors = _.Dictionary<
  {
    x: number;
    value: string;
  }[]
>;

const getPercentiles = ({
  settings,
  fn,
  environment,
}: {
  settings: FunctionChartSettings;
  fn: SqLambda;
  environment: Env;
}) => {
  const { functionImage, errors } = getFunctionImage({
    settings,
    fn,
    valueType: "Dist",
  });

  const groupedErrors: Errors = _.groupBy(errors, (x) => x.value);

  const percentiles: Percentiles[] = functionImage.map(({ x, y: dist }) => {
    const res = {
      x: x,
      areas: {
        1: [
          unwrap(dist.inv(environment, 0.01)),
          unwrap(dist.inv(environment, 0.99)),
        ],
        5: [
          unwrap(dist.inv(environment, 0.05)),
          unwrap(dist.inv(environment, 0.95)),
        ],
        10: [
          unwrap(dist.inv(environment, 0.1)),
          unwrap(dist.inv(environment, 0.9)),
        ],
        20: [
          unwrap(dist.inv(environment, 0.2)),
          unwrap(dist.inv(environment, 0.8)),
        ],
        30: [
          unwrap(dist.inv(environment, 0.3)),
          unwrap(dist.inv(environment, 0.7)),
        ],
        40: [
          unwrap(dist.inv(environment, 0.4)),
          unwrap(dist.inv(environment, 0.6)),
        ],
      },
      50: unwrap(dist.inv(environment, 0.5)),
    } satisfies Percentiles;

    return res;
  });

  return { percentiles, errors: groupedErrors };
};

const InnerDistFunctionChart: FC<
  FunctionChart1DistProps & { width: number }
> = ({
  fn,
  settings,
  environment,
  distributionChartSettings,
  width,
  height,
}) => {
  const { ref, refChanged, context } = useCanvas();

  const update = useUpdate();
  const cursorRef = useRef<[number, number]>();

  if (refChanged && context) {
    d3.select(context.canvas)
      .on("touchmove", (event) => event.preventDefault())
      .on("pointermove", (e) => {
        cursorRef.current = d3.pointer(e);
        update(); // TODO - debounce?
      })
      .on("pointerout", (e) => {
        cursorRef.current = undefined;
        update();
      });
  }

  const d3ref = useRef<{
    padding: Padding;
    xScale: d3.ScaleLinear<number, number, never>;
  }>();

  //TODO: This custom error handling is a bit hacky and should be improved.
  const mouseItem: result<SqValue, SqError> | undefined = useMemo(() => {
    if (!d3ref.current || !cursorRef.current) {
      return;
    }
    const x = d3ref.current.xScale.invert(
      cursorRef.current[0] - d3ref.current.padding.left
    );
    return x
      ? fn.call([x])
      : {
          ok: false,
          value: SqError.createOtherError(
            "Hover x-coordinate returned NaN. Expected a number."
          ),
        };
  }, [fn, cursorRef.current]);

  const showChart =
    mouseItem && mouseItem.ok && mouseItem.value.tag === "Dist" ? (
      <DistributionChart
        distribution={mouseItem.value.value}
        environment={environment}
        chartHeight={50}
        settings={distributionChartSettings}
      />
    ) : null;

  const { percentiles: data, errors } = useMemo(
    () => getPercentiles({ settings, fn, environment }),
    [environment, fn, settings]
  );

  useEffect(() => {
    if (!context) {
      return;
    }
    context.clearRect(0, 0, width, height);

    const { xScale, yScale, padding, chartHeight } = drawAxes({
      suggestedPadding: { left: 20, right: 10, top: 10, bottom: 20 },
      xDomain: d3.extent(data, (d) => d.x) as [number, number],
      yDomain: [
        Math.min(
          ...data.map((d) =>
            Math.min(...Object.values(d.areas).map((p) => p[0]), d[50])
          )
        ),
        Math.max(
          ...data.map((d) =>
            Math.max(...Object.values(d.areas).map((p) => p[1]), d[50])
          )
        ),
      ],
      width,
      height,
      context,
    });
    d3ref.current = {
      padding,
      xScale,
    };

    // areas
    context.translate(padding.left, chartHeight + padding.top);
    context.scale(1, -1);

    const color = "#4C78A8";
    context.fillStyle = color;

    for (const [key, alpha] of [
      [40, 0.2],
      [30, 0.2],
      [20, 0.2],
      [10, 0.15],
      [5, 0.1],
      [1, 0.05],
    ]) {
      context.globalAlpha = alpha;
      d3
        .area<Percentiles>()
        .x((d) => xScale(d.x))
        .y1((d) => yScale(d.areas[key][0]))
        .y0((d) => yScale(d.areas[key][1]))
        .context(context)(data);
      context.fill();
    }

    context.beginPath();
    context.globalAlpha = 1;
    context.strokeStyle = color;
    context.lineWidth = 2;
    context.imageSmoothingEnabled = true;

    d3
      .line<Percentiles>()
      .x((d) => xScale(d.x))
      .y((d) => yScale(d[50]))
      .context(context)(data);

    context.stroke();
  }, [context, width, height, data]);

  return (
    <div>
      <canvas width={width} height={height} ref={ref}>
        Chart for {fn.toString()}
      </canvas>
      {showChart}
      {_.entries(errors).map(([errorName, errorPoints]) => (
        <ErrorAlert key={errorName} heading={errorName}>
          Values:{" "}
          {errorPoints
            .map((r, i) => <NumberShower key={i} number={r.x} />)
            .reduce((a, b) => (
              <>
                {a}, {b}
              </>
            ))}
        </ErrorAlert>
      ))}
    </div>
  );
};

export const FunctionChart1Dist: FC<FunctionChart1DistProps> = (props) => {
  const [containerRef, containerMeasure] = useMeasure<HTMLDivElement>();

  return (
    <div ref={containerRef}>
      {containerMeasure.width ? (
        <InnerDistFunctionChart {...props} width={containerMeasure.width} />
      ) : null}
    </div>
  );
};
