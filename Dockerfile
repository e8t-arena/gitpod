FROM gcc:10

# as ROOT

RUN apt-get update \
    && apt-get install -y sudo vim man zsh less gdb \
    nasm build-essential

RUN groupadd --gid 5000 dev \
    && useradd --home-dir /home/dev --create-home --uid 5000 \
        --gid 5000 --shell /usr/bin/zsh --skel /dev/null dev \
    && echo "dev ALL=(ALL) NOPASSWORD:ALL" >> /etc/sudoers \
    && mkdir /home/extra \
    && chown dev:dev /home/extra
WORKDIR /home/dev/codes

# as dev

USER dev

# keep container running
# COPY ./docker-entrypoint.sh /home/dev/.
# ENTRYPOINT ["/home/dev/docker-entrypoint.sh"]
