FROM ubuntu

WORKDIR /runner
RUN apt-get update -y \
  && apt-get install -y curl libdigest-sha-perl dotnet-sdk-8.0 \
  aspnetcore-runtime-8.0 tmux build-essential \
  && useradd --create-home xfy \
  && mkdir actions-runner \
  && chown -R xfy actions-runner

USER xfy

ENTRYPOINT ["/usr/bin/bash"]
