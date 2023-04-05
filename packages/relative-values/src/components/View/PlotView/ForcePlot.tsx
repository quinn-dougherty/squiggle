import { FC, useCallback, useEffect, useMemo, useState } from "react";

import { useSelectedInterface } from "@/components/Interface/InterfaceProvider";
import { ModelEvaluator } from "@/values/ModelEvaluator";
import {
  MouseTooltip,
  useCanvas,
  useCanvasCursor,
} from "@quri/squiggle-components";
import * as d3 from "d3";
import { useViewContext } from "../ViewProvider";
import { useFilteredItems } from "../hooks";
import { DrawContext } from "@quri/squiggle-components/dist/types/src/lib/hooks/useCanvas";

const distance = (
  p1: { x: number; y: number },
  p2: { x: number; y: number }
) => {
  return Math.sqrt((p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2);
};

export const ForcePlot: FC<{
  model: ModelEvaluator;
}> = ({ model }) => {
  const height = 450;

  const { cursor, initCursor } = useCanvasCursor();

  const {
    catalog: { items, clusters },
  } = useSelectedInterface();

  const {
    axisConfig: { rows },
  } = useViewContext();

  const filteredItems = useFilteredItems({ items, config: rows });

  const [hoveredId, setHoveredId] = useState<number | undefined>(undefined);

  type Node = {
    id: string;
    x: number;
    y: number;
    clusterId?: string;
    name: string;
  };

  const nodes: Node[] = useMemo(
    () =>
      filteredItems.map((item) => ({
        id: item.id,
        x: 100,
        y: 100,
        clusterId: item.clusterId,
        name: item.name,
      })),
    [filteredItems]
  );

  const draw = useCallback(
    ({ context, width }: DrawContext) => {
      console.log(width);
      context.clearRect(0, 0, width, height);
      context.save();

      context.translate(width / 2, height / 2);
      const r = 5;
      let newHoveredId: typeof hoveredId;
      for (let i = 0; i < nodes.length; i++) {
        const d = nodes[i];

        context.beginPath();
        context.moveTo(d.x + r, d.y);
        context.arc(d.x, d.y, r, 0, 2 * Math.PI);

        const isHovered =
          cursor &&
          distance(d, {
            x: cursor[0] - width / 2,
            y: cursor[1] - height / 2,
          }) <
            r * 1.5;

        if (isHovered) {
          newHoveredId = i; // last one wins
        }
        context.fillStyle =
          d.clusterId && !isHovered ? clusters[d.clusterId].color : "black";
        context.fill();
      }
      // TODO - force render only if id has changed

      context.canvas.style.cursor =
        hoveredId === undefined ? "auto" : "pointer";

      if (hoveredId !== newHoveredId) {
        setHoveredId(newHoveredId);
      }

      context.restore();
    },
    [clusters, nodes, cursor, hoveredId]
  );

  const { ref, redraw } = useCanvas({
    height,
    draw,
    init: initCursor,
  });

  const simulation = useMemo(() => {
    const simulation = d3.forceSimulation(nodes);

    simulation.alphaTarget(0.5);

    simulation.force("center", d3.forceCenter());

    const force = d3
      .forceLink<Node, d3.SimulationLinkDatum<Node>>()
      .distance((d) => {
        const relativeValueResult = model.compare(
          (d.source as Node).id,
          (d.target as Node).id
        );
        if (!relativeValueResult.ok) {
          return 450; // 30 decibels; is this a good default?
        }
        return relativeValueResult.value.db * 15;
      });

    simulation.force("link", force);

    simulation.force("weak", d3.forceManyBody().strength(1));

    const links: { source: Node; target: Node }[] = [];
    for (let i = 0; i < filteredItems.length; i++) {
      for (let j = i + 1; j < filteredItems.length; j++) {
        links.push({
          source: nodes[i],
          target: nodes[j],
        });
      }
    }
    force.links(links);
    simulation.nodes(nodes);

    return simulation;
  }, [model, nodes, filteredItems.length]);

  useEffect(() => {
    return () => {
      simulation.stop();
    };
  }, [simulation]);

  useEffect(() => {
    simulation.on("tick", redraw);
    simulation.restart();
  }, [simulation, redraw]);

  const renderTooltip = useCallback(() => {
    if (hoveredId === undefined) {
      return;
    }
    return (
      <div className="px-1 py-0.5 text-xs bg-white border border-slate-200 rounded">
        {nodes[hoveredId].name}
      </div>
    );
  }, [nodes, hoveredId]);

  return (
    <MouseTooltip isOpen={hoveredId !== undefined} render={renderTooltip}>
      <canvas ref={ref} />
    </MouseTooltip>
  );
};
