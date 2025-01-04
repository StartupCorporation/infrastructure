FROM node:20.10.0-alpine as build

WORKDIR /app/src

COPY --from=src-fe-customer-app package*.json ./
RUN npm ci
COPY --from=src-fe-customer-app . ./
RUN npm run build


FROM node:20.10.0-alpine

WORKDIR /usr/app

COPY --from=build /app/src/dist/fe-customer-app ./
