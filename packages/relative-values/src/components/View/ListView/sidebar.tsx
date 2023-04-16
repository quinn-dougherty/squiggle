import { deflate } from "pako";
import { ModelEvaluator } from "@/values/ModelEvaluator";
import { Item } from "@/types";
import { fromByteArray } from "base64-js";
import { getModelCode } from "@/model/utils";
import { FC, Fragment } from "react";
import { NumberShower } from "@quri/squiggle-components";
import { SquiggleChart } from "@quri/squiggle-components";

function codeToPlaygroundUrl(code: string) {
  const text = JSON.stringify({ initialSquiggleString: code });
  const HASH_PREFIX = "https://www.squiggle-language.com/playground#code=";
  const compressed = deflate(text, { level: 9 });
  return HASH_PREFIX + encodeURIComponent(fromByteArray(compressed));
}

interface TableRowProps {
  label: string;
  number: number;
}

const TableRow: React.FC<TableRowProps> = ({ label, number }) => (
  <Fragment key={label}>
    <div className="text-slate-400 py-1 mt-1 font-normal text-left text-xs col-span-1">
      {label}
    </div>
    <div className="py-1 pl-2 text-left text-slate-600 text-md col-span-2">
      <NumberShower number={number} precision={2} />
    </div>
  </Fragment>
);

let buildurl = (
  model: ModelEvaluator,
  numeratorItem: Item,
  denominatorItem: Item
) => {
  const toVarName = (id: string) => id.replace(/-/g, "_");
  const numeratorItemName = toVarName(numeratorItem.id);
  const denominatorItemName = toVarName(denominatorItem.id);
  return `${getModelCode(model.model)}
// ------- AUTOGENERATED CODE -------
dists = fn("${numeratorItem.id}", "${denominatorItem.id}")
value_${numeratorItemName} = dists[0]
value_${denominatorItemName} = dists[1]
relativeValue = value_${numeratorItemName} / value_${denominatorItemName}
median = mean(dists[1])
[Plot.joint({xDist:dists[1] / median, yDist: dists[0]/median}), dists[0] / dists[1]]`;
};

type Props = {
  model: ModelEvaluator;
  numeratorItem: Item;
  denominatorItem: Item;
};

export const ItemSideBar: FC<Props> = ({
  model,
  numeratorItem,
  denominatorItem,
}) => {
  const result = model.compare(numeratorItem.id, denominatorItem.id);
  if (!result.ok) {
    return <div>Result not found</div>;
  } else {
    let item = result.value;
    const squggleCode = buildurl(model, numeratorItem, denominatorItem);

    // It would be better to not load SquiggleChart, but rather, a lower-level compontent. That can be refactored later.
    return (
      <div>
        <div className="mt-2 mb-6 flex overflow-x-auto items-center p-1">
          <span className="text-slate-500 text-md whitespace-nowrap mr-1">
            value
          </span>
          <span className="text-slate-300 text-xl whitespace-nowrap">(</span>
          <span className="text-sm bg-slate-200 font-semibold bg-opacity-80 rounded-sm text-slate-900 px-1 text-center whitespace-pre-wrap mr-2 ml-2">
            {numeratorItem.name}
          </span>
          <span className="text-slate-300 px-1 text-xl whitespace-nowrap">
            /
          </span>

          <span className="text-sm bg-slate-200  font-semibold rounded-sm text-slate-900 px-1 text-center whitespace-pre-wrap mr-2 ml-2">
            <span className="inline-block">{denominatorItem.name}</span>
          </span>
          <span className="text-slate-300 text-xl whitespace-nowrap">)</span>
        </div>

        <div className="mb-4 text-slate-500 xs">
          An estimate of the value of{" "}
          <span className="font-semibold text-slate-700">
            {numeratorItem.name}
          </span>{" "}
          in terms of{" "}
          <span className="text-slate-700 font-semibold">
            {denominatorItem.name}
          </span>
        </div>

        <SquiggleChart code={squggleCode} />

        <div className="grid grid-cols-6 gap-1 w-full mt-10 mb-10">
          <TableRow label="median" number={item.median} />
          <TableRow label="mean" number={item.mean} />
          <TableRow label="p5" number={item.min} />
          <TableRow label="p95" number={item.max} />
          <TableRow label="uncertainty" number={item.uncertainty} />
        </div>

        <a
          href={codeToPlaygroundUrl(squggleCode)}
          className="text-slate-400 underline"
        >
          Open in Playground
        </a>
      </div>
    );
  }
};
