# DOTFILES

```sh
git clone https://github.com/USER/dotfiles
cd dotfiles
chmod a+x launch.sh
./launch.sh
```

## Carpetas

Para carpetas compartidas / vpn:

```sh
sudo visudo 

!!!USER!!! ALL = (ALL) NOPASSWD: /usr/bin/wg
!!!USER!!! ALL = (ALL) NOPASSWD: /usr/bin/wg-quick
```

añadir en `~.zshrc`
```sh
startvar=`cat ~/.startcounter`

if [ $startvar -eq 0 ]
then
  logger "[ psync ] Comienza la sincronizacion"
  echo "1" > ~/.startcounter
  HOST1=8.8.8.8
  ping -c1 $HOST1 1>/dev/null 2>/dev/null #Chech ip
  SUCCESS1=$?
  if [ $SUCCESS1 -eq 0 ]
    then
      logger "[ psync ] Ping con google OK"
      HOST2=10.81.9.1
      ping -c1 $HOST2 1>/dev/null 2>/dev/null #Chech ip
      SUCCESS2=$?
      if [ $SUCCESS2 -eq 0 ]
        then
        logger "[ psync ] Ping con rpi OK"
        sshfs -o IdentityFile=/home/!!!USER!!!/.ssh/id_rsa !!!USER!!!@10.81.9.1:/var/www/html/hugo/content /home/!!!USER!!!/rpi &
        rclone mount drive: /home/!!!USER!!!/drive &
      else
        logger "[ psync ] Ping con rpi FAIL"
        rclone mount drive: /home/!!!USER!!!/drive &
      fi
  else
    logger "[ psync ] Ping con google FAIL"
  fi
fi

pkill kwalletd5
nitrogen --restore
```

```sh
crontab -e 

@reboot echo "0" > ~/.startcounter
```

Substituir `!!!USER!!!`

```sj
sed -i 's/!!!USER!!!/$USER/g' .profile
```

## VSSCODE

```sh
"pasteImage.insertPattern": "<div align='center'><img src='./.assets/$imageFileName}'/></div>",
```

Si repso de kali no funcionan:

```
sudo su
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
```
