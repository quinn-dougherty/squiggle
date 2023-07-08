import { useSession } from "next-auth/react";
import { usePathname, useRouter, useParams } from "next/navigation";
import { FC, PropsWithChildren } from "react";
import { useLazyLoadQuery } from "react-relay";
import { graphql } from "relay-runtime";

import {
  DropdownMenu,
  DropdownMenuHeader,
  DropdownMenuSeparator,
  TriangleIcon,
  EditIcon,
  ScaleIcon,
  Dropdown,
  Cog8ToothIcon,
} from "@quri/ui";

import {
  ModelLayoutQuery,
  ModelLayoutQuery$data,
} from "@/__generated__/ModelLayoutQuery.graphql";
import { EntityLayout, entityNode } from "@/components/EntityLayout";
import { DropdownMenuLinkItem } from "@/components/ui/DropdownMenuLinkItem";
import { StyledTabLink } from "@/components/ui/StyledTabLink";
import {
  modelForRelativeValuesExportRoute,
  modelRevisionsRoute,
  modelRoute,
  modelViewRoute,
  patchModelRoute,
  userRoute,
} from "@/routes";
import { DeleteModelAction } from "./DeleteModelAction";
import { UpdateModelSlugAction } from "./UpdateModelSlugAction";
import { CodeBracketIcon } from "@quri/ui";

// Doing this with a fragment would be too hard, because of how layouts work in Next.js.
// So we have to do two GraphQL queries on most model pages.
const Query = graphql`
  query ModelLayoutQuery($input: QueryModelInput!) {
    model(input: $input) {
      id
      slug
      owner {
        username
      }
      currentRevision {
        id
        # for length; TODO - "hasExports" field?
        relativeValuesExports {
          id
          variableName
          definition {
            slug
            owner {
              username
            }
          }
        }
      }
    }
  }
`;

type CommonProps = {
  username: string;
  slug: string;
};

const MenuButton: FC<CommonProps> = ({ username, slug }) => {
  return (
    <Dropdown
      render={({ close }) => (
        <DropdownMenu>
          <UpdateModelSlugAction
            username={username}
            slug={slug}
            close={close}
          />
          <DeleteModelAction username={username} slug={slug} close={close} />
        </DropdownMenu>
      )}
    >
      <div className="flex items-center rounded cursor-pointer hover:bg-white px-2 py-1 select-none text-sm">
        <Cog8ToothIcon size={16} className="text-gray-500 mr-1" />
        <span>Settings</span>
      </div>
    </Dropdown>
  );
};

function useFixModelUrlCasing(model: ModelLayoutQuery$data["model"]) {
  const router = useRouter();
  const pathname = usePathname();

  const patchedPathname = patchModelRoute({
    pathname,
    slug: model.slug,
    username: model.owner.username,
  });
  if (patchedPathname && patchedPathname !== pathname) {
    router.replace(patchedPathname);
  }
}

type Props = PropsWithChildren<CommonProps>;

export const entityNodes = (
  username: string,
  slug: string,
  variableName?: string
): entityNode[] => {
  let nodes: entityNode[] = [
    { slug: username, href: userRoute({ username }) },
    { slug, href: modelRoute({ username, slug }), icon: CodeBracketIcon },
  ];
  if (variableName) {
    nodes.push({
      slug: variableName,
      href: modelForRelativeValuesExportRoute({
        username: username,
        slug: slug,
        variableName: variableName,
      }),
      icon: ScaleIcon,
    });
  }
  return nodes;
};

export const ModelLayout: FC<Props> = ({ username, slug, children }) => {
  const { data: session } = useSession();
  const { variableName } = useParams();

  const { model } = useLazyLoadQuery<ModelLayoutQuery>(Query, {
    input: { ownerUsername: username, slug },
  });

  useFixModelUrlCasing(model);

  const dropDown = (close: () => void) => (
    <DropdownMenu>
      <DropdownMenuHeader> Relative Value Functions </DropdownMenuHeader>
      <DropdownMenuSeparator />
      {model.currentRevision.relativeValuesExports.map((exportItem) => (
        <DropdownMenuLinkItem
          key={exportItem.variableName}
          href={modelForRelativeValuesExportRoute({
            username: model.owner.username,
            slug: model.slug,
            variableName: exportItem.variableName,
          })}
          title={`${exportItem.variableName}: ${exportItem.definition.slug}`}
          close={close}
        />
      ))}
    </DropdownMenu>
  );

  return (
    <EntityLayout
      nodes={entityNodes(username, slug, variableName)}
      isFluid={true}
      headerChildren={
        <>
          {Boolean(model.currentRevision.relativeValuesExports.length) && (
            <Dropdown render={({ close }) => dropDown(close)}>
              <div className="flex items-center rounded cursor-pointer hover:bg-white px-2 py-1 select-none text-sm">
                <ScaleIcon size={16} className="text-gray-500" />
                <TriangleIcon
                  size={7}
                  className="rotate-180 ml-2 text-slate-400"
                />
              </div>
            </Dropdown>
          )}
          <StyledTabLink.List>
            <StyledTabLink name="Code" href={modelRoute({ username, slug })} />
            {model.currentRevision.relativeValuesExports.length ? (
              <StyledTabLink
                name="Viewer"
                href={modelViewRoute({ username, slug })}
                selected={(pathname, href) =>
                  pathname === href ||
                  pathname.startsWith(
                    modelRoute({ username, slug }) + "/relative-values"
                  )
                }
              />
            ) : null}
            <StyledTabLink
              name="Revisions"
              href={modelRevisionsRoute({ username, slug })}
            />
          </StyledTabLink.List>
          {session?.user.username === username ? (
            <MenuButton username={username} slug={slug} />
          ) : null}
        </>
      }
    >
      {children}
    </EntityLayout>
  );
};
