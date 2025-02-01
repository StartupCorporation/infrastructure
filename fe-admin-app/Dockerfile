FROM node:lts-alpine

WORKDIR /app

COPY --from=src-fe-admin-app package.json ./
RUN npm i

COPY --from=src-fe-admin-app . .
RUN npm run build
