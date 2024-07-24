FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        git \
        fish \
        pipx

ENV PATH="/root/.local/bin:${PATH}"

RUN pipx install --include-deps ansible && \
    pipx upgrade --include-injected ansible && \
    pipx inject --include-apps ansible argcomplete

WORKDIR /DataSource

ENTRYPOINT ["fish"]
