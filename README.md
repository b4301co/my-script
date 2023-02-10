# DOTFILES

```sh
git clone https://github.com/USER/dotfiles
cd dotfiles
chmod a+x launch.sh
./launch.sh
```

## Carpetas

Para carpetas compartidas:

```sh
apt install sshfs
```

añadir en `~.zshrc`
```sh
var1=`cat ~/.synccount`
var2='True'

if [ "$var1" = "$var2" ]; then
  logger "[ psync ] Comienza la sincronizacion"
  echo False > ~/.synccount
  HOST1=8.8.8.8
  ping -c1 $HOST1 1>/dev/null 2>/dev/null #Chech ip
  SUCCESS1=$?
  if [ $SUCCESS1 -eq 0 ]
    then
      logger "[ psync ] Ping con google OK"
      HOST2={TARGET_IP}
      ping -c1 $HOST2 1>/dev/null 2>/dev/null #Chech ip
      SUCCESS2=$?
      if [ $SUCCESS2 -eq 0 ]
        then
        logger "[ psync ] Ping con rpi OK"
        sshfs -o IdentityFile=/home/USER/.ssh/id_rsa USER@{TARGET_IP}:/var/www/html/hugo/content /home/USER/rpi &
        rclone mount drive: /home/USER/drive &
        exit
      else
        logger "[ psync ] Ping con rpi FAIL"
        rclone mount drive: /home/USER/drive &
      fi
  else
    echo False > ~/.synccount
    logger "[ psync ] Ping con google FAIL"
  fi
fi
```

y en `crontab -e`

```sh
@reboot echo True > ~/.synccount
@reboot logger "[ psync ] synccount = True"
```
