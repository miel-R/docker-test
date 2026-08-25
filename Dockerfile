FROM ghcr.io/nextcloud-releases/all-in-one:latest

# Enable Talk container (optional - included in AIO)
# Set environment variables to configure the AIO instance

# Domain configuration - required for HTTPS/TLS
ENV NEXTCLOUD_DOMAIN=localhost
ENV NEXTCLOUD_ADMIN_USER=admin
ENV NEXTCLOUD_ADMIN_PASSWORD=admin123

# Talk configuration
ENV TALK_ENABLED=true
ENV TALK_PORT=3478
ENV TURN_SECRET=turn12345
ENV SIGNALING_SECRET=signal12345
ENV INTERNAL_SECRET=internal12345

# Port mappings (AIO default ports)
EXPOSE 80 8080 8443 443

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/index.php/apps/status/ || exit 1

# Start AIO (handled by entrypoint of base image)
CMD ["--foreground"]