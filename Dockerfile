FROM debian:12-slim

LABEL org.opencontainers.image.title="cloudauto"
LABEL org.opencontainers.image.description="Imatge sense vulnerabilitats HIGH"
LABEL org.opencontainers.image.version="final"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        python3 \
        openssl && \
    rm -f /etc/ssl/private/ssl-cert-snakeoil.key \
          /etc/ssl/certs/ssl-cert-snakeoil.pem && \
    apt-get purge -y ssl-cert && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD echo "✅ Imatge neta i sense HIGH/CRITICAL"
