# Flokicoin seeder

## Prevent `systemd-resolved` from Listening on 127.0.0.53:53

```sh
sudo nano /etc/systemd/resolved.conf
```
```ini
DNSStubListener=no
```
```sh
sudo systemctl restart systemd-resolved
```