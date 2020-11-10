FROM node:15.1.0-alpine3.12
# Lint config to be used
ENV LINT_CONFIG="/opt/commitlint.config.js"

WORKDIR /opt

# Suppress NPM ERR when returning error exit code
RUN echo "loglevel=silent" > .npmrc

# Install commitlint
RUN npm init -y
RUN npm install --save @commitlint/cli

# Install default rule set
RUN npm install --save @commitlint/config-conventional
RUN echo "module.exports = {extends: ['@commitlint/config-conventional']}" > $LINT_CONFIG

# Follow CI setup for CircleCI on https://commitlint.js.org/#/guides-ci-setup
ENTRYPOINT [ "/bin/sh" ]
CMD [ "-c", "echo $DRONE_COMMIT_MESSAGE | npx commitlint -g $LINT_CONFIG" ]