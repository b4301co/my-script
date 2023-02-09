# DOTFILES

```sh
git clone https://github.com/b4391co/dotfiles
cd dotfiles
chmod a+x launch.sh
./launch.sh
```

## Carpetas

Para carpetas compartidas:

```sh
apt install sshfs
```

crear `/home/USER/.sync.sh`

```sh
#!/bin/bash

sshfs -o IdentityFile=/home/USER/.ssh/id_rsa USER@{TARGET_IP}:/var/www/html/hugo/content /home/USER/rpi

rclone mount drive: /home/USER/drive

#EOF
```
