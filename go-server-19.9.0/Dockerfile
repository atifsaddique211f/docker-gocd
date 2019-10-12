FROM gocd/gocd-server:v19.9.0
LABEL authors="Atif Saddique <atif.saddique4@gmail.com>"

# allow mounting ssh keys, dotfiles, and the go server config and data
VOLUME /home/go /godata

ARG PLUGIN_DIR=/godata/plugins/external

ADD https://github.com/tomzo/gocd-yaml-config-plugin/releases/download/0.11.2/yaml-config-plugin-0.11.2.jar ${PLUGIN_DIR}/yaml-config-plugin-0.11.2.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/gerrit-cs-poller-1.3.5.jar ${PLUGIN_DIR}/gerrit-cs-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/git-fb-poller-1.3.5.jar ${PLUGIN_DIR}/git-fb-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/github-pr-poller-1.3.5.jar ${PLUGIN_DIR}/github-pr-poller-1.3.5.jar
ADD https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.5/stash-pr-poller-1.3.5.jar ${PLUGIN_DIR}/stash-pr-poller-1.3.5.jar

# Simulate cmd behavior via environment variable
# So that users are able to provide command line arguments to gocd-server
ENV 	COMMAND ""