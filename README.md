# Home server

This repo contains information about the services I'm running at home. These include
some simple websites and other cool stuff that I use myself for home automation and other
generic use cases.

I'm using a small form factor Lenovo ThinkCentre M910q with i5-7500T and 16GB RAM and 256GB storage.

## Public

These are the apps that are publicly available.

* Walkie Talkie ([Link](https://walkie.rolandkajatin.com), [GitHub](https://github.com/Kajatin/walkie-talkie))
* Fleet Globe ([Link](https://globe.rolandkajatin.com), [GitHub](https://github.com/Kajatin/fleet-globe))

## Services

The services I'm running are all Dockerized.

Launching the compose file can be done with:

```bash
sudo docker compose up --build --remove-orphans
```

There is also a `home-server.service` file that can be installed and enabled using
`systemd`. This way the services will launch automatically as the system boots.

```bash
sudo ln -s /home/home-server/home-server/home-server.service /etc/systemd/system/home-server.service
sudo systemctl daemon-reload
sudo systemctl enable home-server
sudo systemctl start home-server
```

### `services/hue-gpt`

This service is needs a `.env.local` file with credentials in `services/hue-gpt/`
folder for `docker compose` to work.

### `services/fleet-globe`

This service is needs a `.env` file with credentials in `services/fleet-globe/backend/`
folder for `docker compose` to work.
