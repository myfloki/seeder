# Flokicoin seeder

## Prevent `systemd-resolved` from Listening on 127.0.0.53:53

```sh
nano /etc/systemd/resolved.conf
```
```ini
DNSStubListener=no
```
```sh
systemctl restart systemd-resolved
```