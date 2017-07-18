IMAGE = "thrivetrm/pg-to-s3"
TAG = $(shell git rev-parse --short HEAD)

build:
	docker-compose build

test: build
	docker-compose run test_signed
	docker-compose run test_unsigned

release:
	docker build --no-cache -t "$(IMAGE)" .
	docker tag "$(IMAGE)" "$(IMAGE):$(TAG)"
	docker tag "$(IMAGE)" "$(IMAGE):latest"
	docker push "$(IMAGE):latest"
	docker push "$(IMAGE):$(TAG)"

.PHONY: test
