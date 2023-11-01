FROM debian:12.2

# install rdfind and other required tools
RUN apt-get update && apt-get install -y \
    rdfind \
    wget \
    && rm -rf /var/lib/apt/lists/*

# install fclones
RUN wget -q -O /tmp/fclones.deb "https://github.com/pkolaczk/fclones/releases/download/v0.34.0/fclones_0.34.0-1_amd64.deb" \
    && dpkg -i /tmp/fclones.deb \
    && rm /tmp/fclones.deb

# run continuously
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
