FROM debian:stretch-slim
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'APT::Install-Recommends "0" ; APT::Install-Suggests "0" ;' > /etc/apt/apt.conf.d/01-no-recommended && \
    echo 'path-exclude=/usr/share/man/*' > /etc/dpkg/dpkg.cfg.d/path_exclusions && \
    echo 'path-exclude=/usr/share/doc/*' >> /etc/dpkg/dpkg.cfg.d/path_exclusions && \
    apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https \
        bash-completion \
        ca-certificates \
        curl \
        git \
        gnupg \
        less \
        perceptualdiff \
        procps \
        ssh-client \
        sudo \
        unzip \
        vim \
        wget && \
    wget -O sury.gpg https://packages.sury.org/php/apt.gpg && apt-key add sury.gpg && rm sury.gpg && \
    echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/sury.list && \
    apt-get update && \
    apt-get --no-install-suggests --yes --quiet install \
        php7.2-apcu \
        php7.2-bcmath \
        php7.2-cli \
        php7.2-curl \
        php7.2-fpm \
        php7.2-gd \
        php7.2-imagick \
        php7.2-intl \
        php7.2-mbstring \
        php7.2-mysql \
        php7.2-soap \
        php7.2-sqlite3 \
        php7.2-xdebug \
        php7.2-xml \
        php7.2-zip && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/sbin/php-fpm7.2 /usr/local/sbin/php-fpm && \
    usermod --uid 1000 www-data && groupmod --gid 1000 www-data && \
    mkdir /srv/app && \
    usermod -d /srv/app www-data && \
    mkdir -p /run/php

COPY jmleroux-php.ini /etc/php/7.2/mods-available/jmleroux.ini
COPY jmleroux-fpm.conf /etc/php/7.2/fpm/pool.d/zzz-jmleroux.conf
RUN phpenmod jmleroux

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN mkdir -p /var/www/.composer && chown www-data:www-data /var/www/.composer
