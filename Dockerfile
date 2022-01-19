FROM debian

ENV VERSION 1.6.0

RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir -p /hs && \
    wget -O /tmp/install.zip https://scpri.me/releases/ScPrime-v${VERSION}-linux-amd64.zip && \
    unzip -d /tmp/install/ /tmp/install.zip && \
    mv /tmp/install/ScPrime-v${VERSION}-linux-amd64/spc /usr/local/bin/ && \
    mv /tmp/install/ScPrime-v${VERSION}-linux-amd64/spd /usr/local/bin/ && \
    rm -rf /tmp/install/ /tmp/install.zip /var/lib/apt/lists

WORKDIR /sp
EXPOSE 4281 4282 4283 4284 4285

# bind api port to all interfaces in case we want to use it, we don't expose it by default.
CMD ["/usr/local/bin/spd", "--scprime-directory", "./", "--api-addr=0.0.0.0:4280", "--disable-api-security"]
