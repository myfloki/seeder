set shell := ["bash", "-c"]

DOCKER_COMPOSE := "docker compose"
DNS_SCRIPT := "./scripts/dns_stub_control.sh"

# Onboard a new operator
setup:
    ./setup.sh

# Start the operator services
up:
    {{DNS_SCRIPT}} enable
    {{DOCKER_COMPOSE}} pull
    {{DNS_SCRIPT}} disable
    {{DOCKER_COMPOSE}} up -d
    {{DOCKER_COMPOSE}} logs -f flokicoin-seeder

# Stop the operator services
down:
    {{DOCKER_COMPOSE}} down

# Restart the operator services
restart: down up

# View logs
logs:
    {{DOCKER_COMPOSE}} logs -f

# Show status
status:
    {{DOCKER_COMPOSE}} ps

# DNS Stub Management
dns-enable:
    {{DNS_SCRIPT}} enable

dns-disable:
    {{DNS_SCRIPT}} disable

dns-status:
    {{DNS_SCRIPT}} status

# Backup/Restore Config
backup:
    {{DNS_SCRIPT}} backup

restore:
    {{DNS_SCRIPT}} restore
