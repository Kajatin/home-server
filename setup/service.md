# `systemd` to start `docker compose` automatically

To set up a service that will automatically run the docker compose, follow the steps below.

```bash
sudo ln -s /home/home-server/home-server/home-server.service /etc/systemd/system/home-server.service
sudo systemctl daemon-reload
sudo systemctl enable home-server
sudo systemctl start home-server
```
