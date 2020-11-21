# drone-commitlint

[Drone plugin](https://docs.drone.io/pipeline/docker/syntax/plugins/) to run commitlint with [Conventional Commits](https://www.conventionalcommits.org/) rules against the commit message.

# Usage
Add below step to your Drone pipeline to lint `DRONE_COMMIT_MESSAGE`:
```
- name: lint
  image: [REPO NAME]/drone-commitlint
```

# Customizations
To change the rules to be used during lint, put `commitlint.config.js` in root of the project. Change the command of the step:
```
- name: lint
  image: [REPO NAME]/drone-commitlint
  command: [ "--config", "commitlint.config.js" ]
```
