FROM node:22-alpine AS deps
WORKDIR /workspace

COPY package.json package-lock.json nx.json tsconfig.base.json jest.preset.js ./
COPY apps/api ./apps/api
COPY libs/contracts ./libs/contracts

RUN npm ci

FROM deps AS build
RUN npx nx build api --configuration=production
RUN npm prune --omit=dev

FROM node:22-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production

COPY --from=build /workspace/node_modules ./node_modules
COPY --from=build /workspace/dist/apps/api ./

EXPOSE 3000
CMD ["node", "main.js"]
