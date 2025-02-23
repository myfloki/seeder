
stop:
	docker compose down -t 0
start:
	docker compose up -d
restart: stop start