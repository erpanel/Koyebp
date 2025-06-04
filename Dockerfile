FROM debian:stable-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y tmate openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
