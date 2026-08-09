FROM node:20-alpine
RUN corepack enable

WORKDIR /app
COPY . .

ENV NODE_OPTIONS="--max-old-space-size=4096"
ENV PUBLIC_IS_SELFHOSTED="true"
ENV PUBLIC_SERVER_URL="http://localhost:3002"

RUN pnpm install --no-frozen-lockfile
RUN pnpm --filter @cio/dashboard... build

EXPOSE 5173
CMD ["pnpm", "--filter", "@cio/dashboard", "start"]
