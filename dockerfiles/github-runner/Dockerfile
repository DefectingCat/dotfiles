FROM ubuntu

# build with arg token
# docker build --build-arg TOKEN=AF67WFIVLJYD7ZYQVZ6CQKTGJP5GG -t candy-runner .
ARG RUNNER_VERSION=2.316.1
ARG TOKEN
ARG DEBIAN_FRONTEND=nointeractive

WORKDIR /runner
RUN apt update -y && apt upgrade -y && useradd -m docker
RUN apt install -y --no-install-recommends \
  curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip \
  libdigest-sha-perl dotnet-sdk-8.0 aspnetcore-runtime-8.0 build-essential

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
  && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
  && ./config.sh --url https://github.com/DefectingCat/candy --token ${TOKEN} \
  && ./run.sh

ENTRYPOINT ["/runner/run.sh"]
