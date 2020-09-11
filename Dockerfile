FROM ubuntu:18.04 as download
WORKDIR /dl
RUN apt-get update -y && apt-get install -y --no-install-recommends unzip curl ca-certificates
RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
RUN unzip butler.zip && rm butler.zip
RUN chmod +x butler

FROM ubuntu:18.04
COPY --from=download /etc/ssl/certs /etc/ssl/certs
COPY --from=download /dl /butler-cli
ENV PATH $PATH:/butler-cli
CMD butler -V