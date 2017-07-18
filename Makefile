IMAGE = "thrivetrm/pg-to-s3"
TAG = $(shell git rev-parse --short HEAD)

build:
	docker-compose build

test: build
	docker-compose run test

release:
	echo "-----> Building $(IMAGE)..."
	docker build --no-cache -t "$(IMAGE)" .

	echo "-----> Tagging $(IMAGE)..."
	docker tag "$(IMAGE)" "$(IMAGE):$(TAG)"
	docker tag "$(IMAGE)" "$(IMAGE):latest"

	echo "-----> Pushing $(IMAGE)..."
	docker push "$(IMAGE):latest"
	docker push "$(IMAGE):$(TAG)"

.PHONY: test
