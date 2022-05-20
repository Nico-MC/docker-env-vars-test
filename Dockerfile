FROM node:14.17.6 AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build




FROM nginx:latest

WORKDIR /usr/share/nginx/html

ARG NGINX_HOST
ARG NGINX_PORT
ENV NGINX_HOST=$NGINX_HOST NGINX_PORT=$NGINX_PORT

COPY nginx/default.conf.template /etc/nginx/templates/

COPY --from=builder /app/dist .