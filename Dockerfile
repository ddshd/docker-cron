FROM ubuntu:latest

# Install python3
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Install croniter
RUN python3 -m venv /local/usr/venv/
ENV PATH "/local/usr/venv/bin/:$PATH"
RUN pip3 install croniter

WORKDIR /etc/docker-cron/

# Add all scripts
ADD *.sh .
ADD *.py .

# Make the scripts executable
RUN chmod +x *.sh
RUN chmod +x *.py

# Set the entrypoint
ENTRYPOINT ["/etc/docker-cron/entrypoint.sh"]
