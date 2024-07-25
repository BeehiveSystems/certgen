# Use a lightweight base image
FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache openssl

# Copy the certificate generation script into the container
COPY generate_certs.sh /usr/local/bin/generate_certs.sh

# Make the script executable
RUN chmod +x /usr/local/bin/generate_certs.sh

# Set the entry point to the script
ENTRYPOINT ["/usr/local/bin/generate_certs.sh"]
