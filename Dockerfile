FROM debian:12.2

# update and install dependencies
RUN apt-get update && apt-get install -y \
    rdfind \
    && rm -rf /var/lib/apt/lists/*

# run continuously
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
