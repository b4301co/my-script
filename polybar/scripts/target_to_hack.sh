ip_address=$(cat /home/b4391co/.config/polybar/scripts/target | awk '{print $1}')
machine_name=$(cat /home/b4391co/.config/polybar/scripts/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#ffffff}${F#ffffff}$ip_address%{u-} - $machine_name"
else
    echo "${F#ffffff}%{u-}%{F#ffffff} No target"
fi