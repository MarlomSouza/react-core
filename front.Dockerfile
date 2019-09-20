FROM node:alpine as build

WORKDIR /app
COPY /my-app /app

RUN yarn install;

ARG REACT_APP_API_URL=localhost:5000
ENV REACT_APP_API_URL=${REACT_APP_API_URL}


CMD ["yarn","start"]

# production environment
# FROM nginx:alpine
# COPY --from=build /app/build /usr/share/nginx/html
# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/conf.d
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]