FROM alpine:3.18

# Install necessary tools
RUN apk add --no-cache curl busybox-suid

# Copy the request script, give execute permissions, and set up cron job
COPY make_request.sh /usr/local/bin/make_request.sh
RUN chmod +x /usr/local/bin/make_request.sh && \
    echo "0 * * * * /usr/local/bin/make_request.sh > /dev/stdout 2>&1" > /etc/crontabs/root

# Run the script once on container startup and then start cron in foreground to keep the container running
CMD /usr/local/bin/make_request.sh && crond -f