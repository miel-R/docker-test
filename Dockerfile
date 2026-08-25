FROM ghcr.io/nextcloud-releases/all-in-one:latest

# Enable Talk container (optional - included in AIO)
# Set environment variables to configure the AIO instance

# Domain configuration - for local testing use localhost
ENV NEXTCLOUD_DOMAIN=localhost
ENV NEXTCLOUD_ADMIN_USER=admin
ENV NEXTCLOUD_ADMIN_PASSWORD=admin

# Talk configuration
ENV TALK_ENABLED=true
ENV TALK_PORT=3478
ENV TURN_SECRET=turntest
ENV SIGNALING_SECRET=signaltest
ENV INTERNAL_SECRET=internaltest

# Port mappings (AIO default ports)
EXPOSE 80 8080 8443 443

# Health check - give AIO time to initialize (it can take a few minutes)
# Port 8080 is the AIO interface port
HEALTHCHECK --interval=120s --timeout=30s --start-period=60s --retries=2 \
    CMD curl -f http://localhost:8080/index.php/apps/status/ || exit 1

# No CMD - let base image handle startup with its ENTRYPOINT
# Environment variables will be used by the base image's startup scripts
# The extended start-period gives services time to initialize