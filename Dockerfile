FROM node:22-apline AS build-stage

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

ARG BUILD_MODE=production
RUN npm run build -- --mode ${BUILD_MODE}

FROM nginx:apline AS productio-stage

COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]