FROM gocd/gocd-agent-alpine-3.10:v19.9.0
LABEL authors="Atif Saddique <atif.saddique4@gmail.com>"

# allow mounting ssh keys, dotfiles, and the go server config and data
VOLUME /godata
RUN echo ${USER}

USER root

RUN set -ex && apk --no-cache add sudo

RUN \
  sudo apk --update-cache upgrade && \
  sudo apk add --update-cache git  openssh-client jq libuuid wget py-pip python3 && \
  sudo apk add docker && \
  sudo pip install --upgrade pip && \
  sudo pip install --upgrade awscli && \
  sudo pip3 install ruamel.yaml

# Add go user to list of sudoers
ADD sudoers/go /etc/sudoers.d/
RUN chmod 755 /etc/sudoers.d/go

# Install terraform
ARG TERRAFORM_VERSION="0.12.10"
RUN mkdir -p /opt/terraform && \
    wget -nc -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -P /opt/terraform && \
    unzip -q /opt/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt/terraform && \
    rm -rf /opt/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV PATH /opt/terraform:$PATH

ENV LANG=C.UTF-8

# Simulate cmd behavior via environment variable``
# So that users are able to provide command line arguments to gocd-server
ENV 	COMMAND ""