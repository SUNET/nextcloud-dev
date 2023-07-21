.PHONY: garage

docker:
	docker-compose up -d

garage:
	scripts/garage_cluster.sh
