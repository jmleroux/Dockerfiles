FROM debian:buster-slim
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive \
    PHP_CONF_DATE_TIMEZONE=UTC \
    PHP_CONF_MAX_EXECUTION_TIME=60 \
    PHP_CONF_MEMORY_LIMIT=512M \
    PHP_CONF_OPCACHE_VALIDATE_TIMESTAMP=0 \
    PHP_CONF_MAX_INPUT_VARS=1000 \
    PHP_CONF_UPLOAD_LIMIT=40M \
    PHP_CONF_MAX_POST_SIZE=40M \
    PHP_CONF_DISPLAY_ERRORS=0 \
    PHP_CONF_DISPLAY_STARTUP_ERRORS=0

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
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/sury.list && \
    apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php8.0-apcu \
        php8.0-bcmath \
        php8.0-cli \
        php8.0-curl \
        php8.0-fpm \
        php8.0-gd \
        php8.0-imagick \
        php8.0-intl \
        php8.0-mbstring \
        php8.0-mysql \
        php8.0-soap \
        php8.0-sqlite3 \
        php8.0-xdebug \
        php8.0-xml \
        php8.0-zip && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/sbin/php-fpm8.0 /usr/local/sbin/php-fpm && \
    usermod --uid 1000 www-data && groupmod --gid 1000 www-data && \
    mkdir /srv/app && \
    usermod -d /srv/app www-data && \
    mkdir -p /run/php

COPY jmleroux-php.ini /etc/php/8.0/mods-available/jmleroux.ini
COPY jmleroux-fpm.conf /etc/php/8.0/fpm/pool.d/zzz-jmleroux.conf
RUN phpenmod jmleroux

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN mkdir -p /var/www/.composer && chown www-data:www-data /var/www/.composer
