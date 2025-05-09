SCRIPT=./scripts/dns_stub_control.sh

stop:
	docker compose down -t 0
start:
	$(MAKE) enable_dns_stub
	docker compose pull
	$(MAKE) disable_dns_stub
	docker compose up -d
	docker logs -f flokicoin-seeder
restart: stop start


enable_dns_stub:
	@$(SCRIPT) enable

disable_dns_stub:
	@$(SCRIPT) disable

check_status:
	@$(SCRIPT) status

backup_config:
	@$(SCRIPT) backup

restore_config:
	@$(SCRIPT) restore

restart_resolver:
	@$(SCRIPT) restart

upgrade:
	-docker compose pull
	docker compose up -d