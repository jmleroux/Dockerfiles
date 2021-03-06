FROM jmleroux/php:7.2
MAINTAINER JM Leroux <jmleroux.pro@gmail.com>

# Define "root" as current user
USER root

# Install Apache + mod_php and some PHP extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install apache2 libapache2-mod-php7.2 && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP Apache
RUN sed -i "s/;date.timezone =/date.timezone = Etc\/UTC/" /etc/php/7.2/apache2/php.ini

# Configure Apache
RUN a2enmod rewrite && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=docker/" /etc/apache2/envvars && \
    sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=docker/" /etc/apache2/envvars && \
    chown -R docker: /var/lock/apache2

# Expose Apache
EXPOSE 80 443

COPY files/apache-foreground /usr/local/bin
RUN  chmod +x /usr/local/bin/apache-foreground

# Define "docker" as current user
USER docker

# Run apache in foreground
CMD ["sudo", "/usr/local/bin/apache-foreground"]
