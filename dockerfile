FROM node:15.1.0-alpine3.12

WORKDIR /opt

# Install commitlint
RUN npm install --global @commitlint/cli

# Install default rule set
RUN npm install --global @commitlint/config-conventional

# Setup default configs
RUN mkdir -p /usr/local/etc

# Suppress NPM ERR when returning error exit code
RUN echo "loglevel=silent" > /usr/local/etc/npmrc

# Lint config to be used
ENV LINT_CONFIG="/usr/local/etc/commitlint.config.js"
RUN echo "module.exports = {extends: ['@commitlint/config-conventional']}" > $LINT_CONFIG

# Add entrypoint
COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh

# Follow CI setup for CircleCI on https://commitlint.js.org/#/guides-ci-setup
ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]

# CMD exec form not supporting ENV
# https://stackoverflow.com/questions/52789177/docker-env-in-cmd
CMD [ "--config", "/usr/local/etc/commitlint.config.js" ]