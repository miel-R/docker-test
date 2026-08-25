FROM alpine:3.24

RUN apk add --no-cache \
    nats-server \
    bash \
    openssl \
    supervisor \
    bind-tools \
    netcat-openbsd \
    ca-certificates

# Install Janus Gateway (pre-built for Alpine)
RUN apk add --no-cache janus-gateway \
    && janus --version

COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisord.conf
COPY healthcheck.sh /healthcheck.sh

RUN chmod +x /start.sh /healthcheck.sh

EXPOSE 8080 8081 8443 3478

HEALTHCHECK CMD /healthcheck.sh

CMD ["/start.sh"]