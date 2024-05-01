FROM ubuntu:latest

# Install python3
RUN apt-get update && apt-get install -y python3 python3-pip

RUN python3 -m pip install croniter

WORKDIR /etc/docker-cron/

# Add all scripts
ADD *.sh .
ADD *.py .

# Make the scripts executable
RUN chmod +x *.sh
RUN chmod +x *.py

# Set the entrypoint
ENTRYPOINT ["/etc/docker-cron/entrypoint.sh"]
