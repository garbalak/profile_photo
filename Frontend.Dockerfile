### STAGE 1: Build ###
FROM node:16.10-alpine AS build
WORKDIR /web
COPY web/package.json ./web/package-lock.json ./
RUN npm install
COPY web .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /web/dist /usr/share/nginx/html