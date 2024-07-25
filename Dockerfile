FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
        build-essential \
        vim \
        curl \
        git \
        fish \
        net-tools \
        inetutils-ping \
        pipx

ENV PATH="/root/.local/bin:${PATH}"

RUN pipx install --include-deps ansible && \
    pipx upgrade --include-injected ansible && \
    pipx inject --include-apps ansible argcomplete

COPY startup.sh /root/startup.sh
COPY .ssh /root/.ssh/
COPY .ssh/.gitconfig /root/.gitconfig
COPY .ansible.cfg /root/.ansible.cfg

RUN chmod +rwx /root/startup.sh

WORKDIR /root/DataSource

ENTRYPOINT ["bash", "/root/startup.sh"]
