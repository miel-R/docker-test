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

# Health check - skip to avoid conflict with base image
HEALTHCHECK NONE

# No CMD - let base image handle startup with its ENTRYPOINT
# Environment variables will be used by the base image's startup scripts