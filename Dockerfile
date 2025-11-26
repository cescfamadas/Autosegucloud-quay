FROM debian:11

LABEL org.opencontainers.image.description="Imatge corregida per proves amb Trivy"

RUN apt-get update && \
    apt-get install -y curl openssl apache2 python3 ca-certificates && \
    rm -f /etc/ssl/private/ssl-cert-snakeoil.key \
          /etc/ssl/certs/ssl-cert-snakeoil.pem && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD echo "✅ Imatge corregida i neta segons Trivy" && apache2 -v && openssl version
