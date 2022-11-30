GIT_SHA?=$(shell git rev-parse HEAD 2>/dev/null)
TIMESTAMP?=$(shell date "+%Y-%m-%dT%H:%M:%S")

.PHONY: default
default: aws-mfa

.PHONY: aws-mfa
aws-mfa: docker-run

.PHONY: docker-build
docker-build:
	DOCKER_BUILDKIT=1 docker build \
		--tag "ghcr.io/caius/aws-mfa:${GIT_SHA}" \
		--label org.opencontainers.image.created=${TIMESTAMP} \
		--label org.opencontainers.image.version=${GIT_SHA} \
		--label org.opencontainers.image.revision=${GIT_SHA} \
		 .

.PHONY: docker-release
docker-release:
	docker tag "ghcr.io/caius/aws-mfa:${GIT_SHA}" "ghcr.io/caius/aws-mfa:latest"
	docker push "ghcr.io/caius/aws-mfa:${GIT_SHA}"
	docker push "ghcr.io/caius/aws-mfa:latest"

.PHONY: docker-run
docker-run:
	docker run --rm -it -v $$HOME/.aws:/root/.aws ghcr.io/caius/aws-mfa:latest --duration 129600
