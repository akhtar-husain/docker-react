# Production Dockerfile
# `as` keyword defines stage, here we're declaring builder stage that will be used in another stage.
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install --omit=dev
COPY . .
RUN npm run build


# RUN stage
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html