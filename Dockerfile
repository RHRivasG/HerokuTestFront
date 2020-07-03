FROM node:latest as node
WORKDIR /d_client
COPY ./angular_one /d_client
RUN npm install yes
RUN npm run build -- --prod

#Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget zip unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Run flutter doctor and set path
RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /usr/local/flutter_one
COPY ./flutter_one /usr/local/flutter_one
WORKDIR /usr/local/flutter_one
RUN /usr/local/flutter/bin/flutter pub get
RUN /usr/local/flutter/bin/flutter build web

FROM nginx:alpine
COPY --from=node /d_client/dist/example /usr/share/nginx/html
COPY --from=build-env /usr/local/flutter_one/build/web /usr/share/nginx/html/flutter_one
COPY ./nginx-conf.conf /etc/nginx/conf.d/default.conf
ENV PORT=80
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
