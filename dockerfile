FROM node:15.1.0-alpine3.12

WORKDIR /opt

# Suppress NPM ERR when returning error exit code
RUN mkdir -p /usr/local/etc
RUN echo "loglevel=silent" > /usr/local/etc/npmrc

# Install commitlint
RUN npm install --global @commitlint/cli

# Install default rule set
RUN npm install --global @commitlint/config-conventional

# Lint config to be used
ENV LINT_CONFIG="/opt/commitlint.config.js"
RUN echo "module.exports = {extends: ['@commitlint/config-conventional']}" > $LINT_CONFIG

# Follow CI setup for CircleCI on https://commitlint.js.org/#/guides-ci-setup
ENTRYPOINT [ "/bin/sh" ]
CMD [ "-c", "echo $DRONE_COMMIT_MESSAGE | npx --no-install commitlint -g $LINT_CONFIG" ]