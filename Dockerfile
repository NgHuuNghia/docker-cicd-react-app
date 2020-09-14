FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM nginx:lastest
COPY --from=build /app/build /usr/share/nginx/html