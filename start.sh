#!/bin/sh

env

set -x

set_val() {
    value="$1"
    tag="$2"

    if [ -n "$tag" ] && [ -n "$value" ]; then
        echo "set '$tag' to '$value'"
        sed -i "s|<${tag}>[^<]*</${tag}>|<${tag}>${value}</${tag}>|g" /etc/icecast2/icecast.xml
    else
        echo "Setting for '$value' is missing, skipping." >&2
    fi
}

set_val "$ICECAST_SOURCE_PASSWORD" source-password
set_val "$ICECAST_RELAY_PASSWORD"  relay-password
set_val "$ICECAST_ADMIN_PASSWORD"  admin-password
set_val "$ICECAST_PASSWORD"        password
set_val "$ICECAST_HOSTNAME"        hostname
set_val "$ICECAST_LOCATION"        location
set_val "$ICECAST_ADMIN_EMAIL"     admin
set_val "$ICECAST_MAX_CLIENTS"     clients
set_val "$ICECAST_MAX_SOURCES"     sources

set -e

sudo -Eu icecast2 icecast2 -n -c /etc/icecast2/icecast.xml
