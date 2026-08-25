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

# Health check - skip for local testing, AIO handles its own health
HEALTHCHECK NONE

# Start AIO (handled by entrypoint of base image)
CMD ["--foreground"]