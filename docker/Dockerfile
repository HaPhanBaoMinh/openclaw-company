FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    bash \
    git \
    curl \
    ca-certificates \
    nodejs \
    npm \
    python3 \
    python3-pip \
    jq \
    vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY claw.yaml /app/claw.yaml
COPY scripts/ /app/scripts/

RUN chmod +x /app/scripts/*.sh

VOLUME ["/app/workspace"]

CMD ["bash", "-lc", "./scripts/run.sh"]
