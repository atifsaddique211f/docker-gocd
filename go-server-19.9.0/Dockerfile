FROM gocd/gocd-server:v19.9.0
LABEL authors="Atif Saddique <atif.saddique4@gmail.com>"

ARG GID=1001
ARG UID=1001

# allow mounting ssh keys, dotfiles, and the go server config and data
VOLUME /home/go /godata

RUN \
# add our user and group first to make sure their IDs get assigned consistently,
# regardless of whatever dependencies get added
  addgroup -g ${GID} go && \
  adduser -D -u ${UID} -G go go && \

ADD https://github.com/tomzo/gocd-yaml-config-plugin/releases/download/0.11.2/yaml-config-plugin-${YAML_PLUGIN_VERSION}.jar /gocd-plugins-download/yaml-config-plugin-0.11.2.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/gerrit-cs-poller-1.3.5.jar /gocd-plugins-download/gerrit-cs-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/git-fb-poller-1.3.5.jar /gocd-plugins-download/git-fb-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/github-pr-poller-1.3.5.jar /gocd-plugins-download/github-pr-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/stash-pr-poller-1.3.5.jar /gocd-plugins-download/stash-pr-poller-1.3.5.jar

# Simulate cmd behavior via environment variable
# So that users are able to provide command line arguments to gocd-server
ENV 	COMMAND ""