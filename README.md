# Seeder Operator

Flokicoin Seeder operator.

## 🚀 Onboarding Steps

Follow these steps to set up your operator from scratch:

### 1. Initial Setup
Run the `setup.sh` script. This script will:
- Check for and install the `just` command runner if it's missing.
- Create necessary directories.
- Generate `.env`.

```bash
./setup.sh
```

### 2. Configuration (Optional)
Before starting the services, you can customize your installation:
- **`.env`**: Modify the docker image versions.
- **Config Files**: Adjust settings in `./config/`.

> [!CAUTION]
> **IMPORTANT**: Review your configuration files (e.g., `.env`, `flnd.conf`, `lokid.conf`) and replace any placeholder credentials (like `YOUR_RPC_PASSWORD`) with secure, custom passwords before starting the services.

### 3. Start the Operator
Now that everything is configured, start the services:

```bash
just up
```

## 🛠️ Service Management

The operator uses `just` for common tasks:

| Command         | Description                                     |
| --------------- | ----------------------------------------------- |
| `just setup`    | Re-run the onboarding/setup script.             |
| `just up`       | Start the operator with DNS stub management.    |
| `just down`     | Stop and remove the containers.                 |
| `just restart`  | Restart the services.                           |
| `just logs`     | Follow the service logs.                        |
| `just status`   | Check the status of the containers.             |
| `just dns-enable` | Enable DNS stub.                                |
| `just dns-disable`| Disable DNS stub.                               |

## 🔍 Troubleshooting

- **Logs**: If a service fails to start, check the logs: `just logs`.
- **Data Persistence**: Data is stored in the `./log` and `./config` directories.
