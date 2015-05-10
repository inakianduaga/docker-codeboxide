# Nodejs + npm base install
# https://registry.hub.docker.com/_/node/
FROM node:0.10.38
MAINTAINER Inaki Anduaga <inaki@inakianduaga.com>

# Update npm to the latest version
RUN npm install npm -g

# Install supervisor
RUN apt-get update && apt-get upgrade -y && \
    apt-get -y install supervisor && \
    apt-get clean && apt-get autoremove -y

# Install codebox
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get -y install git python-software-properties python g++ make software-properties-common && \
    npm install -g codebox --no-bin-link --unsafe-perm

# Expose php application folder
ENV APP_ROOT /var/www
VOLUME ${APP_ROOT}
WORKDIR ${APP_ROOT}

# Expose ssh keys folder
ENV SSH_KEYS_FOLDER=/var/ssh
VOLUME ${SSH_KEYS_FOLDER}

# Codebox listening port
EXPOSE 8000

# Supervisor startup scripts
ADD conf/supervisor/ /etc/supervisor/conf.d/
ADD scripts/ /scripts/
RUN chmod 755 /scripts/*.sh

# Default command
CMD ["/scripts/start.sh"]
