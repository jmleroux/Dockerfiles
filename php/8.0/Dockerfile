FROM debian:buster-slim
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
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
        procps \
        ssh-client \
        sudo \
        unzip \
        vim \
        wget \
        && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && rm -rf  /var/lib/apt/lists/*

# Add Sury PHP repository
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg &&\
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php8.0-apcu \
        php8.0-bcmath \
        php8.0-cli \
        php8.0-curl \
        php8.0-intl \
        php8.0-mbstring \
        php8.0-xdebug \
        php8.0-xml \
        php8.0-zip \
        && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && rm -rf  /var/lib/apt/lists/*

# Configure PHP CLI
RUN echo "display_errors = On" > /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "error_reporting = E_ALL" >> /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "date.timezone = Etc/UTC" >> /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "apc.enabled=1" >> /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "apc.enable_cli=1" >> /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "xdebug.discover_client_host = 1" >> /etc/php/8.0/mods-available/jmleroux.ini \
    && echo "; priority=99" >> /etc/php/8.0/mods-available/jmleroux.ini
RUN phpenmod jmleroux

# Add a "docker" user
RUN useradd docker --shell /bin/bash --create-home \
  && usermod --append --groups sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Define "docker" as current user
USER docker
WORKDIR /home/docker/
