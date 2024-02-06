FROM node:18.13.0 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
FROM nginx:alpine
COPY --from=node /app/dist/dockerized-angular-app/browser /usr/share/nginx/html