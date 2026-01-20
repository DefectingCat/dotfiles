FROM nginx:alpine AS final

RUN rm -rf /usr/share/nginx/html/index.html
COPY ./docs /usr/share/nginx/html
COPY ./conf.d /etc/nginx/conf.d

EXPOSE 80
EXPOSE 443
