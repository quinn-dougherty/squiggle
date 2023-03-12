import { Choice } from "@/types";
import { SqLambda, SqProject } from "@quri/squiggle-lang";
import { FC, Fragment, useCallback, useMemo } from "react";
import { useDashboardContext } from "../../Dashboard/DashboardProvider";
import { DropdownButton } from "../../ui/DropdownButton";
import { Cell } from "../Cell";
import { useCachedPairs, useFilteredChoices } from "../hooks";
import { AxisFilter } from "./AxisFilter";
import { GridModeControls } from "./GridModeControls";
import { useGridViewContext } from "./GridViewProvider";
import { Header } from "./Header";

export const GridView: FC<{
  project: SqProject;
  fn: SqLambda;
  choices: Choice[];
}> = ({ project, fn, choices }) => {
  const { filters, gridMode } = useGridViewContext();
  const {
    catalog: { clusters },
  } = useDashboardContext();

  const rowChoices = useFilteredChoices(choices, filters.rows);
  const columnChoices = useFilteredChoices(choices, filters.columns);

  const allPairs = useCachedPairs(fn, choices);

  const idToPosition = useMemo(() => {
    const result: { [k: string]: number } = {};
    for (let i = 0; i < choices.length; i++) {
      result[choices[i].id] = i;
    }
    return result;
  }, [choices]);

  const isHiddenPair = useCallback(
    (rowChoice: Choice, columnChoice: Choice) => {
      if (gridMode === "full") {
        return false;
      }
      return idToPosition[rowChoice.id] <= idToPosition[columnChoice.id];
    },
    [idToPosition, gridMode]
  );

  return (
    <div>
      <div className="flex gap-8 mb-4 items-center">
        <div className="flex gap-2">
          <DropdownButton text="Rows">
            {() => <AxisFilter axis="rows" />}
          </DropdownButton>
          <DropdownButton text="Columns">
            {() => <AxisFilter axis="columns" />}
          </DropdownButton>
        </div>
        <GridModeControls />
      </div>
      <div
        className="grid relative"
        style={{
          gridTemplateColumns: `repeat(${columnChoices.length + 1}, 180px)`,
        }}
      >
        <div className="sticky bg-white top-0 left-0 z-20" />
        {columnChoices.map((choice) => (
          <Header key={choice.id} choice={choice} th clusters={clusters} />
        ))}
        {rowChoices.map((rowChoice) => (
          <Fragment key={rowChoice.id}>
            <Header key={0} choice={rowChoice} clusters={clusters} />
            {columnChoices.map((columnChoice) =>
              isHiddenPair(rowChoice, columnChoice) ? (
                <div key={columnChoice.id} className="bg-gray-200" />
              ) : (
                <div
                  key={columnChoice.id}
                  className="border-t border-l border-gray-200"
                >
                  <Cell
                    id1={rowChoice.id}
                    id2={columnChoice.id}
                    cache={allPairs}
                    project={project}
                  />
                </div>
              )
            )}
          </Fragment>
        ))}
      </div>
    </div>
  );
};
