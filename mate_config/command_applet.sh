
usage=$(nvidia-smi -i 0 -q -d UTILIZATION)
gtemp=$(nvidia-smi -i 0 -q -d Temperature)


gpu_usage=$(echo "$usage" | awk '/Gpu/{print $3}')
mem_usage=$(echo "$usage" | awk '/Memory/{print $3; exit}')
gpu_temp=$(echo "$gtemp" | awk '/GPU Current Temp/{print $5}')

cpu_temp=$(sensors | awk '/Package/{print $4}')


# echo $cpu_temp
echo GPU: $gpu_usage % ' | ' VRAM: $mem_usage % ' | ' GTemp: $gpu_temp°C ' | ' CTemp: "$cpu_temp"
