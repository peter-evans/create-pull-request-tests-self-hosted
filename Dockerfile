FROM ubuntu

ENV RUNNER_VERSION=2.267.1

RUN useradd -m actions \
 && apt-get update \
 && apt-get install -y \
    software-properties-common \
    wget \
    curl \
    jq \
 && add-apt-repository -y ppa:git-core/ppa \
 && apt-get install -y git

RUN cd /home/actions && mkdir actions-runner && cd actions-runner \
 && wget https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
 && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

WORKDIR /home/actions/actions-runner

RUN chown -R actions ~actions && /home/actions/actions-runner/bin/installdependencies.sh 

USER actions

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
