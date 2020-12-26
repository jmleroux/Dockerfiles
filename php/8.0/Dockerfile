FROM debian:buster-slim
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https bash-completion ca-certificates curl git gnupg imagemagick \
        less default-mysql-client perceptualdiff procps ssh-client sudo unzip vim wget && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Add Sury PHP repository
RUN wget -O sury.gpg https://packages.sury.org/php/apt.gpg && apt-key add sury.gpg && rm sury.gpg
COPY files/sury.list /etc/apt/sources.list.d/sury.list

# Install PHP with some extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php8.0-cli php8.0-apcu php8.0-mbstring php8.0-curl php8.0-gd php8.0-imagick php8.0-intl php8.0-bcmath \
        php8.0-mysql php8.0-sqlite3 php8.0-soap php8.0-xdebug php8.0-xml php8.0-zip && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP CLI
COPY files/jmleroux.ini /etc/php/8.0/mods-available/jmleroux.ini
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

ENV PATH=bin:vendor/bin:$PATH

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
