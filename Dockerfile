FROM node:22 AS build
COPY . src
WORKDIR src
RUN   npm install && \
      npm run build

FROM nginx AS release
COPY --from=build src/ /usr/share/nginx/html/
