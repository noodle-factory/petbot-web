# build environment
FROM node:14.16.0-alpine as build

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
RUN npm install --silent
RUN npm install react-scripts@4.0.2 -g --silent
COPY . /app
RUN npm run build

# production environment
FROM nginx:1.19.8-alpine

RUN mkdir -p /app

COPY --from=build /app/build /var/www
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx","-g","daemon off;"]
