FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build
RUN chmod -R 777 /app
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html