import { FC } from "react";
import { StyledTab } from "../ui/StyledTab";
import { View } from "../View";
import {
  DashboardProvider,
  useDashboardContext,
  useDashboardDispatch,
} from "./DashboardProvider";

// TODO - move to a separate file
const Estimate: FC<{ code: string; setCode: (code: string) => void }> = ({
  code,
  setCode,
}) => {
  // TODO - autosize
  // TODO - syntax highlight
  return (
    <textarea
      value={code}
      onChange={(e) => setCode(e.currentTarget.value)}
      className="text-xs w-full border p-2 min-h-[400px]"
    />
  );
};

const InnerDashboard: FC = () => {
  const { code } = useDashboardContext();
  const dispatch = useDashboardDispatch();

  return (
    <StyledTab.Group>
      <div className="mb-4">
        <StyledTab.List>
          <StyledTab name="Estimate" icon={() => <div />} />
          <StyledTab name="View" icon={() => <div />} />
        </StyledTab.List>
      </div>
      <StyledTab.Panels>
        <StyledTab.Panel>
          <Estimate
            code={code}
            setCode={(value) => dispatch({ type: "setCode", payload: value })}
          />
        </StyledTab.Panel>
        <StyledTab.Panel>
          <View code={code} />
        </StyledTab.Panel>
      </StyledTab.Panels>
    </StyledTab.Group>
  );
};

export const Dashboard: FC = () => {
  return (
    <DashboardProvider>
      <InnerDashboard />
    </DashboardProvider>
  );
};
