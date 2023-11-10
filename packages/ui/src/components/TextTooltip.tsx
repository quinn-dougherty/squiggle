"use client";
import { FC, cloneElement, useState } from "react";
import { AnimatePresence, motion } from "framer-motion";
import {
  flip,
  shift,
  offset,
  useDismiss,
  useFloating,
  useHover,
  useInteractions,
  useRole,
  Placement,
  FloatingPortal,
} from "@floating-ui/react";

type Props = {
  text: string;
  children: JSX.Element;
  placement?: Placement;
  offset?: number;
};

export const TextTooltip: FC<Props> = ({
  text,
  placement,
  offset: offsetAmount,
  children,
}) => {
  const [isOpen, setIsOpen] = useState(false);

  const { x, y, refs, strategy, context } = useFloating({
    placement: placement ?? "top",
    open: isOpen,
    onOpenChange: setIsOpen,
    middleware: [shift(), offset(offsetAmount ?? 2), flip()],
  });

  const { getReferenceProps, getFloatingProps } = useInteractions([
    useHover(context, { delay: 50 }),
    useRole(context, { role: "tooltip" }),
    useDismiss(context),
  ]);

  return (
    <>
      {cloneElement(
        children,
        getReferenceProps({ ref: refs.setReference, ...children.props })
      )}
      <AnimatePresence>
        {isOpen && (
          <FloatingPortal>
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.07 }}
              {...getFloatingProps({
                ref: refs.setFloating,
                className: "text-sm px-2 py-1 rounded bg-gray-800 z-10",
                style: {
                  position: strategy,
                  top: y ?? 0,
                  left: x ?? 0,
                },
              })}
            >
              <div className="text-white max-w-sm">{text}</div>
            </motion.div>
          </FloatingPortal>
        )}
      </AnimatePresence>
    </>
  );
};
