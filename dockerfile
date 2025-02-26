FROM node:alpine AS development
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest AS production
COPY --from=Development /app/build /usr/share/nginx/html/