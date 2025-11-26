FROM debian:12

LABEL org.opencontainers.image.description="Imatge corregida i segura per proves amb Trivy"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        openssl \
        apache2 \
        python3 \
        ca-certificates \
        libc6 \
        libc-bin && \
    rm -f /etc/ssl/private/ssl-cert-snakeoil.key \
          /etc/ssl/certs/ssl-cert-snakeoil.pem && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD echo "✅ Imatge segura i revisada" && apache2 -v && openssl version
