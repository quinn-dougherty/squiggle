import { prisma } from "@/prisma";
import { builder } from "@/graphql/builder";

import { Model, getWriteableModel } from "../types/Model";

builder.mutationField("updateModelSlug", (t) =>
  t.withAuth({ user: true }).fieldWithInput({
    type: builder.simpleObject("UpdateModelSlugResult", {
      fields: (t) => ({
        model: t.field({ type: Model }),
      }),
    }),
    errors: {},
    input: {
      owner: t.input.string({ required: true }),
      oldSlug: t.input.string({ required: true }),
      newSlug: t.input.string({
        required: true,
        validate: {
          regex: /^\w[\w\-]*$/,
        },
      }),
    },
    resolve: async (_, { input }, { session }) => {
      let model = await getWriteableModel({
        slug: input.oldSlug,
        owner: input.owner,
        session,
      });

      model = await prisma.model.update({
        where: { id: model.id },
        data: { slug: input.newSlug },
      });

      return { model };
    },
  })
);
