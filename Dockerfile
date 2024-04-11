FROM ubuntu:latest

# Install cron and basic utilities
RUN apt-get update && apt-get install -y cron

WORKDIR /etc/docker-cron/

# Add all scripts
ADD *.sh .

# Make the scripts executable
RUN chmod +x *.sh

# Set the entrypoint
ENTRYPOINT ["/etc/docker-cron/entrypoint.sh"]
