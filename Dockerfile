FROM alpine:3.3

MAINTAINER Orih

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk --no-cache add apache2 php7-apache2@testing \
    php7@testing php7-gd@testing php7-xml@testing php7-xsl@testing php7-pdo_mysql@testing \
    php7-mbstring@testing php7-mcrypt@testing php7-curl@testing php7-json@testing php7-fpm@testing \
    php7-phar@testing php7-openssl@testing php7-xml \
    php7-mysqlnd@testing php7-ctype@testing php7-zlib@testing php7-zip@testing && \
    rm -fr /var/cache/apk/* && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    mkdir -p /run/apache2

WORKDIR /var/www/localhost/htdocs

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]