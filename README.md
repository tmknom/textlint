# textlint

[![CircleCI](https://circleci.com/gh/tmknom/textlint.svg?style=svg)](https://circleci.com/gh/tmknom/textlint)
[![Docker Build Status](https://img.shields.io/docker/build/tmknom/textlint.svg)](https://hub.docker.com/r/tmknom/textlint/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/tmknom/textlint.svg)](https://hub.docker.com/r/tmknom/textlint/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/tmknom/textlint.svg)](https://microbadger.com/images/tmknom/textlint)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/tmknom/textlint.svg)](https://microbadger.com/images/tmknom/textlint)
[![License](https://img.shields.io/github/license/tmknom/textlint.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile template.

## Requirements

- [Docker](https://www.docker.com/)

## Usage

```sh
curl -fsSL https://raw.githubusercontent.com/tmknom/textlint/master/install | sh -s example
cd example
```

## Makefile targets

```text
build                          Build docker image
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
```

## Development

### Installation

```shell
git clone git@github.com:tmknom/textlint.git
cd textlint
make install
```

### Deployment

Automatically deployed by "[DockerHub Automated Build](https://docs.docker.com/docker-hub/builds/)" after merge.

## Continuous Deployment

### Prepare

1. Create repository on GitHub
   - <https://help.github.com/articles/create-a-repo/>
2. Setting up your build on CircleCI
   - <https://circleci.com/docs/2.0/getting-started/#setting-up-your-build-on-circleci>
3. Configure automated builds on Docker Hub
   - <https://docs.docker.com/docker-hub/builds/#create-an-automated-build>
4. Configure webhook on MicroBadger
   - <https://medium.com/microscaling-systems/microbadger-keep-your-metadata-fresh-with-a-webhook-651ee26cd4a6>

### Deployment Pipeline

1. GitHub - Version Control System
   - <https://github.com/tmknom/textlint>
2. CircleCI - Continuous Integration
   - <https://circleci.com/gh/tmknom/textlint>
3. Docker Hub - Docker Registry
   - <https://hub.docker.com/r/tmknom/textlint/>
4. MicroBadger - Docker Inspection
   - <https://microbadger.com/images/tmknom/textlint>

## License

Apache 2 Licensed. See LICENSE for full details.
