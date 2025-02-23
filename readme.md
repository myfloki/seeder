# Flokicoin seeder

## Prevent `systemd-resolved` from Listening on 127.0.0.53:53

```sh
# Enable DNSStubListener
make enable_dns_stub

# Disable DNSStubListener
make disable_dns_stub

# Show current DNSStubListener status
make check_status

# Backup the configuration
make backup_config

# Restore the original configuration
make restore_config

# Restart systemd-resolved
make restart_resolver
```