FROM gitpod/workspace-full

# as ROOT

RUN apt-get update \
    && apt-get install -y nasm

# as user gitpod
