# BUILD PHASE

FROM node:current-alpine3.12 AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html





