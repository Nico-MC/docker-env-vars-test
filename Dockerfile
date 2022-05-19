FROM node:14.17.6 AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build




FROM nginx:latest

WORKDIR /usr/share/nginx/html

ARG NGINX_HOST
ENV NGINX_HOST=$NGINX_HOST
ARG NGINX_PORT
ENV NGINX_PORT=$NGINX_PORT

COPY nginx/templates /etc/nginx/templates/

COPY --from=builder /app/dist .