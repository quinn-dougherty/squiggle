import type { TypedDocumentNode } from "@graphql-typed-document-node/core";
import { ExecutionResult, print } from "graphql";
import { createYoga } from "graphql-yoga";
import { Session } from "next-auth";

import { schema } from "@/graphql/schema";
import { prisma } from "@/prisma";

let currentUser: Session["user"] | null;

export async function setCurrentUser(user: {
  email: string;
  username?: string;
}) {
  await prisma.user.upsert({
    where: {
      email: user.email,
    },
    create: {
      email: user.email,
      username: user.username, // deprecated
      ...(user.username
        ? {
            asOwner: {
              create: {
                slug: user.username,
              },
            },
          }
        : {}),
    },
    update: {},
  });
  currentUser = user;
}

export async function unsetCurrentUser() {
  currentUser = null;
}

beforeEach(unsetCurrentUser);

const yoga = createYoga({
  schema,
  context: async () => {
    const session: Session | null = currentUser
      ? {
          user: currentUser,
          expires: "mock",
        }
      : null;
    return { session };
  },
});

// Note: buildHTTPExecutor from @graphql-tools/executor-http, as described in
// https://the-guild.dev/graphql/yoga-server/docs/features/testing, might be more flexible,
// but its executor returns an MaybeAsyncIterable that's hard to unpack.
export async function executeOperation<TResult, TVariables>(
  operation: TypedDocumentNode<TResult, TVariables>,
  variables?: TVariables
): Promise<NonNullable<ExecutionResult<TResult>["data"]>> {
  const response = await Promise.resolve(
    yoga.fetch("http://yoga/graphql", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({
        query: print(operation),
        variables: variables ?? undefined,
      }),
    })
  );
  const yogaResponse = await response.json();

  if (!yogaResponse.data) {
    throw new Error("No data");
  }
  return yogaResponse.data;
}

export async function executeCommonOperation<
  TResult extends {
    // see also: `useAsyncMutation` hook
    readonly result: {
      readonly __typename: TTypename;
    };
  },
  TTypename,
  const TExpectedTypename extends TTypename,
  TVariables
>(
  operation: TypedDocumentNode<TResult, TVariables>,
  options: {
    variables?: TVariables;
    expectedTypename: TExpectedTypename;
  }
): Promise<
  Extract<TResult["result"], { readonly __typename: TExpectedTypename }>
> {
  const { result } = await executeOperation<TResult, TVariables>(
    operation,
    options.variables
  );

  if (result.__typename === options.expectedTypename) {
    // we want to return a result before "BaseError" check, because it's valid for the test to expect an error
    return result as Extract<
      TResult["result"],
      { readonly __typename: TExpectedTypename }
    >;
  }

  if (result.__typename === "BaseError") {
    throw new Error(
      (result as { message?: string })?.message ??
        `Typename mismatch: ${result.__typename}`
    );
  }

  throw new Error(`Unexpected result: ${result.__typename}`);
}
