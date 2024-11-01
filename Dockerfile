# Use a lightweight base image
FROM alpine:latest

# Install curl and cron
RUN apk add --no-cache curl busybox-suid

# Copy the request script
COPY make_request.sh /usr/local/bin/make_request.sh

# Give execute permissions to the script
RUN chmod +x /usr/local/bin/make_request.sh

# Set up the hourly cron job
RUN echo "0 * * * * /usr/local/bin/make_request.sh" > /etc/crontabs/root

# Start cron in foreground to keep the container running
CMD ["crond", "-f"]
