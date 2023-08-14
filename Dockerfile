FROM ubuntu:latest
# Install necessary dependencies
RUN apt-get update && apt-get install -y wget

# Download and run the script
RUN wget -N --no-check-certificate s.redc.eu.org/s.sh
RUN bash s.sh
