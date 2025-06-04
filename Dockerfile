FROM debian:stable-slim

# Install tmate dan dependensi lain yang diperlukan
RUN apt-get update && \
    apt-get install -y tmate openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Copy script/start.sh ke dalam image
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
