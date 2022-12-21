# PHASE 1) Build project to generate a build folder
FROM node:18-alpine AS build
WORKDIR /app
COPY ./package.json .
RUN npm i
COPY . .
RUN npm run build
# PHASE 2) Deploy using NGNIX
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html