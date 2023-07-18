import { FC } from "react";

import { SqValue, SqTable, SqError, result } from "@quri/squiggle-lang";
import { Env } from "@quri/squiggle-lang";

import { clsx } from "clsx";
import { PlaygroundSettings } from "../PlaygroundSettings.js";
import { SqValueWithContext, valueHasContext } from "../../lib/utility.js";

import { VariableBoxProps } from "../SquiggleViewer/VariableBox.js";

type Props = {
  value: SqTable;
  environment: Env;
  settings: PlaygroundSettings;
  getBoxProps: (value: SqValueWithContext) => Omit<VariableBoxProps, "value">;
};

export const Table: FC<Props> = ({
  value,
  environment,
  settings,
  getBoxProps,
}) => {
  const rowsAndColumns = value.items(environment);
  const columnNames = value.columnNames;
  const hasColumnNames = columnNames.filter((name) => !!name).length > 0;
  const columnLength = Math.max(
    columnNames ? columnNames.length : 0,
    rowsAndColumns[0].length
  );

  const chartHeight = 40;
  const distributionChartSettings = {
    ...settings.distributionChartSettings,
    showSummary: false,
  };
  const adjustedSettings = {
    ...settings,
    distributionChartSettings,
    chartHeight,
  };

  const showItem = (item: result<SqValue, SqError>, settings) => {
    if (item.ok) {
      const value = item.value;
      if (valueHasContext(value)) {
        return getBoxProps(value).children(settings);
      } else {
        return value.toString();
      }
    } else {
      return item.toString();
    }
  };

  return (
    <div className="relative rounded-sm overflow-hidden border border-slate-200">
      <table
        className="table-fixed w-full"
        style={{ minWidth: `${columnLength * 100}px` }}
      >
        {hasColumnNames && (
          <thead className="text-xs text-gray-700 bg-gray-50 border-b border-slate-200">
            <tr>
              {Array.from({ length: columnLength }, (_, i) => (
                <th
                  key={i}
                  scope="col"
                  className={clsx(
                    "px-2 py-2",
                    i !== 0 && "border-slate-200 border-l"
                  )}
                >
                  {columnNames[i] || ""}
                </th>
              ))}
            </tr>
          </thead>
        )}
        <tbody>
          {rowsAndColumns.map((row, i) => (
            <tr key={i} className="border-b border-slate-100">
              {row.map((item, k) => (
                <td
                  key={k}
                  className={clsx(
                    "px-1 overflow-hidden",
                    k !== 0 && "border-slate-100 border-l"
                  )}
                >
                  {showItem(item, adjustedSettings)}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};
