
usage=$(nvidia-smi -i 0 -q -d UTILIZATION)
gtemp=$(nvidia-smi -i 0 -q -d Temperature)

gpu_usage=$(echo "$usage" | awk '/Gpu/{print $3}')
mem_usage=$(echo "$usage" | awk '/Memory/{print $3; exit}')
gpu_temp=$(echo "$gtemp" | awk '/GPU Current Temp/{print $5}')

bar0='::::::::::'
bar10='/:::::::::'
bar20='//::::::::'
bar30='///:::::::'
bar40='////::::::'
bar50='/////:::::'
bar60='//////::::'
bar70='///////:::'
bar80='////////::'
bar90='/////////:'
bar100='//////////'

if [ 5 -gt $gpu_usage ]; then
    bar=$bar0
elif [ 15 -gt $gpu_usage ]; then
    bar=$bar10
elif [ 25 -gt $gpu_usage ]; then
    bar=$bar20
elif [ 35 -gt $gpu_usage ]; then
    bar=$bar30
elif [ 45 -gt $gpu_usage ]; then
    bar=$bar40
elif [ 55 -gt $gpu_usage ]; then
    bar=$bar50
elif [ 65 -gt $gpu_usage ]; then
    bar=$bar60
elif [ 75 -gt $gpu_usage ]; then
    bar=$bar70
elif [ 85 -gt $gpu_usage ]; then
    bar=$bar80
elif [ 95 -gt $gpu_usage ]; then
    bar=$bar90
else
    bar=$bar100
fi

if [ $gpu_usage ]; then
    gpu=$(echo  gpu: $gpu_usage % $bar' | '   vRam: $mem_usage % ' | '  gTemp: $gpu_temp°C ' | ')
fi

cpu_temp=$(sensors | awk '/Package/{print $4}')

echo $gpu  cTemp: "$cpu_temp"
