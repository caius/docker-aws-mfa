.PHONY: default
default: aws-mfa

.PHONY: aws-mfa
aws-mfa: docker-run

.PHONY: docker-build
docker-build:
	DOCKER_BUILDKIT=1 docker build -t caius/aws-mfa:latest .

.PHONY: docker-run
docker-run:
	docker run --rm -it -v $$HOME/.aws:/root/.aws caius/aws-mfa:latest --duration 129600
