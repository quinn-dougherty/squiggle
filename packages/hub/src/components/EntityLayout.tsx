import { FC, ReactNode } from "react";
import { clsx } from "clsx";

import { EntityInfo, entityNode } from "./EntityInfo";

export type { entityNode };

type Props = {
  nodes?: entityNode[];
  headerChildren?: ReactNode;
  children?: ReactNode;
  isFluid?: boolean;
};

export const EntityLayout: FC<Props> = ({
  nodes = [],
  headerChildren,
  children,
  isFluid = false,
}) => {
  return (
    <div>
      <div
        className="border-gray-300 border-b"
        style={{ backgroundColor: "#eceef0" }}
      >
        <div
          className={clsx(
            "flex items-center justify-between gap-4 pt-2",
            !isFluid ? "max-w-4xl mx-auto" : "px-8"
          )}
        >
          <EntityInfo nodes={nodes} />
          <div className="flex-1 justify-end flex items-center gap-4">
            {headerChildren}
          </div>
        </div>
      </div>
      <div className={clsx(!isFluid && "max-w-4xl mx-auto my-4")}>
        {children}
      </div>
    </div>
  );
};
