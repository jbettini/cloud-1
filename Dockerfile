FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
        build-essential \
        vim \
        curl \
        git \
        fish \
        net-tools \
        inetutils-ping \
        pipx \
        tree \
        openssl

ENV PATH="/root/.local/bin:${PATH}"

RUN pipx install --include-deps ansible && \
    pipx upgrade --include-injected ansible && \
    pipx inject --include-apps ansible argcomplete

COPY .ssh /root/.ssh/
COPY .ssh/.gitconfig /root/.gitconfig

WORKDIR /root/DataSource/Ansible

ENTRYPOINT ["/bin/bash", "/root/DataSource/startup.sh"]
