#!/bin/bash

RESOLVED_CONF="/etc/systemd/resolved.conf"
BACKUP_CONF="/etc/systemd/resolved.conf.bak"

# Function to check current status
status() {
    echo "📌 Checking current DNSStubListener status..."
    if grep -q '^DNSStubListener=no' "$RESOLVED_CONF"; then
        echo "🚫 DNSStubListener is currently DISABLED."
    elif grep -q '^DNSStubListener=yes' "$RESOLVED_CONF"; then
        echo "✅ DNSStubListener is currently ENABLED."
    else
        echo "⚠️  DNSStubListener setting is not explicitly set."
    fi
}

# Function to backup configuration
backup() {
    if [ ! -f "$BACKUP_CONF" ]; then
        sudo cp "$RESOLVED_CONF" "$BACKUP_CONF"
        echo "✅ Backup created: $BACKUP_CONF"
    else
        echo "⚠️  Backup already exists."
    fi
}

# Function to restore configuration from backup
restore() {
    if [ -f "$BACKUP_CONF" ]; then
        sudo cp "$BACKUP_CONF" "$RESOLVED_CONF"
        echo "🔄 Configuration restored from backup."
        restart
    else
        echo "❌ No backup found. Run './dns_stub_control.sh backup' first."
    fi
}

# Function to disable DNSStubListener
disable() {
    backup
    if grep -q '^DNSStubListener=no' "$RESOLVED_CONF"; then
        echo "✅ DNSStubListener is already disabled."
    else
        sudo sed -i 's/^#DNSStubListener=.*/DNSStubListener=no/' "$RESOLVED_CONF"
        sudo sed -i 's/^DNSStubListener=yes/DNSStubListener=no/' "$RESOLVED_CONF"
        echo "🚫 DNSStubListener disabled."
        restart
    fi
}

# Function to enable DNSStubListener
enable() {
    backup
    if grep -q '^DNSStubListener=yes' "$RESOLVED_CONF"; then
        echo "✅ DNSStubListener is already enabled."
    else
        sudo sed -i 's/^DNSStubListener=no/DNSStubListener=yes/' "$RESOLVED_CONF"
        echo "🔄 DNSStubListener enabled."
        restart
    fi
}

# Function to restart systemd-resolved
restart() {
    sudo systemctl restart systemd-resolved
    echo "🔄 systemd-resolved restarted."
}

# Handle script arguments
case "$1" in
    enable) enable ;;
    disable) disable ;;
    status) status ;;
    backup) backup ;;
    restore) restore ;;
    restart) restart ;;
    *)
        echo "Usage: $0 {enable|disable|status|backup|restore|restart}"
        exit 1
        ;;
esac