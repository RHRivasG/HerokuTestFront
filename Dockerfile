FROM node:latest as node
WORKDIR /d_client
COPY . /d_client
RUN npm config set registry https://registry.npmjs.org/
RUN yes | npm install
RUN npm run build -- --prod

FROM nginx:alpine
COPY --from=node /d_client/dist/example /usr/share/nginx/html
COPY ./nginx-conf.conf /etc/nginx/conf.d/default.conf
