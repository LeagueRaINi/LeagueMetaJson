FROM alpine:20210212

# Set the workdir
WORKDIR /usr/dumper

# Copy our files to the new working directory
COPY . /usr/dumper

# Make the binaries we copied executable
RUN chmod -R 755 /usr/dumper

# Install dependencies
RUN apk add --update && \
    apk add --no-cache curl python3 qemu-system-i386

# Copy crontab
COPY crontab /etc/cron/crontab

# Initialize cron
RUN crontab /etc/cron/crontab

# Expose file server port
EXPOSE 1337

# Small container health check
HEALTHCHECK CMD curl --fail localhost:1337 || exit 1

# Run the http server
CMD ["sh", "-c", "crond -f & python3 -m http.server --directory /usr/dumper/meta/ 1337"]