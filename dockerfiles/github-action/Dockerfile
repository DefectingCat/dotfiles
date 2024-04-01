FROM ubuntu

WORKDIR /runner
RUN apt-get update \
  && apt-get install curl libdigest-sha-perl dotnet-sdk-7.0 \
  aspnetcore-runtime-6.0 tmux build-essential -y \
  && useradd --create-home xfy \
  && mkdir actions-runner \
  && chown -R xfy actions-runner

USER xfy

ENTRYPOINT ["/usr/bin/bash"]
