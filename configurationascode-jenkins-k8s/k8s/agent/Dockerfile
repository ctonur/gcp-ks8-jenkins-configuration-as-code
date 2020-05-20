FROM jenkins/inbound-agent:4.3-4

# Using the Google Cloud SDK from Shell in some jobs
## Must install as root
USER root

# Google Cloud SDK Installing with apt-get (Debian and Ubuntu only), translated to Dockerfile
# See: https://cloud.google.com/sdk/docs/downloads-apt-get
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get install -y \
    google-cloud-sdk \
    && rm -rf /var/lib/apt/lists/*

RUN gcloud version

RUN wget "https://storage.googleapis.com/kubernetes-release/release/$(wget -qO- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common  
    

RUN set -x \
&& curl -fSL "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz" -o docker.tgz \
&& tar -xzvf docker.tgz \
&& mv docker/* /usr/local/bin/ \
&& rmdir docker \
&& rm docker.tgz \
&& docker -v

RUN apt-get update 

## Descalate privileges after installs
