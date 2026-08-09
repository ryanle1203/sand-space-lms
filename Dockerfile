FROM node:20-alpine
RUN corepack enable

WORKDIR /app
COPY . .

ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pnpm install --no-frozen-lockfile
RUN pnpm --filter @cio/dashboard... build

EXPOSE 5173
CMD ["pnpm", "--filter", "@cio/dashboard", "start"]
