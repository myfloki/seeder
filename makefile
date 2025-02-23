
stop:
	docker compose down -t 0
start:
	docker compose up -d
	docker logs -f flokicoin-seeder
restart: stop start