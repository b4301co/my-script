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

# sync.sh
sshfs -o IdentityFile=/home/USER/.ssh/id_rsa USER@{IP}:/var/www/html/hugo/content /home/USER/rpi
rclone mount drive: ~/drive &
```

añadir a `crontab -e`

```
@reboot /home/USER/.sync.sh
```