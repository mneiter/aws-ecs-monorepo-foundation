FROM node:22-alpine AS deps
WORKDIR /workspace

COPY package.json package-lock.json nx.json tsconfig.base.json jest.preset.js ./
COPY apps/web ./apps/web
COPY libs/contracts ./libs/contracts

RUN npm ci

FROM deps AS build
RUN npx nx build web

FROM nginx:1.27-alpine AS runtime
COPY apps/web/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /workspace/apps/web/out /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
