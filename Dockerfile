FROM node:alpine AS builder
WORKDIR /web-app
COPY . .
RUN npm install parcel
RUN npx parcel build "source/index.html" --dist-dir "dist" --public-url "/"


FROM nginx:alpine
COPY --from=builder "/web-app/dist" "/usr/share/nginx/html"
EXPOSE 80

