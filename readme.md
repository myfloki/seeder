# Flokicoin seeder

## Prevent `systemd-resolved` from Listening on 127.0.0.53:53

```sh
# Enable DNSStubListener
make enable_dns_stub

# Disable DNSStubListener
make disable_dns_stub
```