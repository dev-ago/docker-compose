# Docker, docker-compose and git

This docker image installs `docker-compose` and `git` on top of the `docker` image.
This is very useful for CI/CD pipelines, this ist a nested docker image, to run docker on docker container.

## Versions / ARGS
- **latest**

Include the current versions version of `docker` and `docker-compose`:
- docker 18.09.6
- docker-compose

## Usage examples for Gitlab CI/CD

You can use this image in you `.gitlab-ci.yml` file:

```` yml
image: devago/docker-compose

before_script:
  - docker info
  - docker-compose --version
  
build-your-images:
  stage: build
  script:
    - docker-compose build
    - docker tag myimage myregistry/myimage:$version
    - docker-compose push
    
deploy-your-image:
  stage: deploy
  script:
    - docker-compose up
    
test-my-app
  stage: test
  script:
    - docker logs -f my-docker-compose-app
````