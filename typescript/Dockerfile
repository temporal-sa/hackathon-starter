FROM node:lts AS builder
USER node
WORKDIR /home/node/app
COPY --chown=node:node . .
RUN npm ci \
  && npm run build
CMD [ "npm", "run", "worker:watch" ]

FROM node:lts-slim
WORKDIR /home/node/app
COPY --from=builder /home/node/app/lib lib
COPY --from=builder /home/node/app/package.json package.json
COPY --from=builder /home/node/app/package-lock.json package-lock.json
RUN npm ci --include=prod \
  && apt-get update \
  && apt-get install -y ca-certificates
USER node
CMD [ "node", "lib/worker" ]
