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

WORKDIR /root

ENTRYPOINT ["fish", "cd /root/DataSource"]
