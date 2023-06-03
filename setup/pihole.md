# Pi-hole

Pi-hole is a network-wide ad blocking service. Read more [here](https://pi-hole.net).

## `systemd-resolved` already uses port 53

To fix the issue with port 53 already being used, follow the steps below.

```bash
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
systemctl restart systemd-resolved
```

## NGiNX configuration

Since NGiNX is already used to proxy to several different apps, it already controls
port 80. Therefore, Pi-hole needs to use a different port and then NGiNX needs to be
configured to reverse proxy to Pi-hole.

```bash
server {
    listen 80;
    server_name pihole.rolandkajatin.lan;

    location / {
        proxy_pass http://localhost:8053;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

**NOTE:** The `default` NGiNX site served on port 80 should be removed (remove
`/etc/nginx/sites-enabled/default`).

## Configure Pi-hole as the only DNS server on the router

All trafic should go through Pi-hole to have network-wide ad blocking. Follow the
guide [from here](https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245).

## `WEBPASSWORD` for admin page

Remember to set `WEBPASSWORD` for pihole service in `docker-compose.yml`. This is
the password used to access the admin page of Pi-hole.
