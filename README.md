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

```sh
#!/bin/bash

wg-quick up rpi0
#systemctl start wg-quick@rpi0.service 

sleep 2

HOST={TARGET_IP}

ping -c1 $HOST 1>/dev/null 2>/dev/null #Chech ip
SUCCESS=$?

if [ $SUCCESS -eq 0 ]
  then
  sshfs -o IdentityFile=/home/USER/.ssh/id_rsa USER@{TARGET_IP}:/var/www/html/hugo/content /home/USER/rpi
else
  echo "$HOST didn't reply"
fi

rclone mount drive: /home/USER/drive

#EOF
```

`/lib/systemd/system/sync.service`

```sh
[Unit]
Description=Start script

[Service]
User=USER
ExecStart=/home/USER/.sync.sh

[Install]
WantedBy=multi-user.target
```

```sh
sudo systemctl daemon-reload
sudo systemctl start sync.service
```