FROM php:5.6-apache
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    apt-utils ca-certificates bash-completion curl git vim wget sudo software-properties-common

RUN apt-add-repository 'http://httpredir.debian.org/debian jessie contrib non-free' && apt-get update && \
    apt-get install -y \
    php5-apcu php5-json php5-curl php5-gd php5-intl php5-mcrypt php5-mysql php5-sqlite php5-xdebug

RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

RUN apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*
