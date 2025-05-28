# SSH Client

Impowered by https://github.com/kroniak/alpine-ssh-client

## Build

```shell
docker build -t brighterly/ssh-client .
docker run -it brighterly/ssh-client bash
```

## using from GitLab CI

```yml
deploy_staging:
  stage: deploy
  image: brighterly/ssh-client
  environment:
    name: staging
    url: https://sample-app.net
  script:
    - scp -r deploy/app_staging/. $DEPLOY_STAGING_SSH_HOST:~/app
    - scp -r src/project/conf/. $DEPLOY_STAGING_SSH_HOST:~/app/conf
    - ssh $DEPLOY_STAGING_SSH_HOST 'chmod 700 ~/app/app.sh'
    - ssh $DEPLOY_STAGING_SSH_HOST 'cd ~/app && ./app.sh --file docker-compose-staging.yml up'
    - ssh $DEPLOY_STAGING_SSH_HOST 'cd ~/app && ./app.sh --file docker-compose-staging.yml update'
  only:
    - dev
```

## using from docker

```shell
docker run -it --rm brighterly/ssh-client bash
```
