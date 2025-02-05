# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Set non-interactive mode to avoid interactive prompts during the installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    curl \
    gnupg2 \

    lsb-release \
    && add-apt-repository --yes ppa:ansible/ansible \
    && apt-get update && \

    apt-get install -y ansible

# Verify Ansible installation
RUN ansible --version

# Set the working directory
WORKDIR /root

# Default command to run
CMD ["bash"]


