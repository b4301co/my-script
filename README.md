# DOTFILES

```
git clone https://github.com/b4391co/dotfiles
cd dotfiles
chmod a+x launch.sh
./launch.sh
```

## Carpetas

Para carpetas compartidas:

```
apt install sshfs
```


crear `/home/USER/.sync.sh`

```
#!/bin/bash

wg-quick up rpi0
#systemctl start wg-quick@rpi0.service 
sleep 2
sshfs -o IdentityFile=/home/b4391co/.ssh/id_rsa b4391co@10.81.9.1:/var/www/html/hugo/content /home/b4391co/rpi
rclone mount drive: /home/b4391co/drive 
```

`/lib/systemd/system/sync.service`

```
[Unit]
Description=Start script

[Service]
User=USER
ExecStart=/home/USER/.sync.sh

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl daemon-reload
sudo systemctl start sync.service
```