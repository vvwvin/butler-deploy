FROM ubuntu:latest
RUN apt-get update -y && apt-get install -y unzip curl
RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
RUN unzip butler.zip
RUN chmod +x butler
RUN mv butler bin/butler
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]