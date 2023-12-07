FROM alpine:3.18.5
RUN apk -v cache clean
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apk update && apk add nginx && apk add openrc
RUN apk -v cache clean
RUN adduser -D -g 'www' www \
    && rm -rf /var/www/localhost \
    && mkdir /var/www/docker_project \
    && mkdir /var/www/docker_project/img \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /var/www
# RUN CONF_PATH=$(grep -r "user nginx;" ./etc/nginx | grep -o "^[^:]*") \
#     && sed -i 's/var\/www\/html/var\/www\/docker_project/g' $CONF_PATH \
#     && sed -i 's/user nginx;/user www;/g' $CONF_PATH
RUN CONF_PATH=$(grep -r "user nginx;" ./etc/nginx | grep -o "^[^:]*") \
    && rm $CONF_PATH
COPY nginx.conf /etc/nginx
COPY index.html /var/www/docker_project
COPY /img/* /var/www/docker_project/img
EXPOSE 8082
CMD ["nginx","-g","daemon off;"]