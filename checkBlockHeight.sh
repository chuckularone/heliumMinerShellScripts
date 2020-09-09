#while true; do 
miner01=$(docker exec miner01 miner info height | awk '{print $2}')
#miner02=$(docker exec miner02 miner info height | awk '{print $2}')
bloop=$(curl https://api.helium.io/v1/blocks/height)
blah=$(echo $bloop | rev | cut -d":" -f1 | rev)
actual=$(echo $blah | rev |cut -b 3- | rev)
#cpuPer=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{print ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5) "%"}')
clear
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
datenow=$(date)
echo "\033[32m$datenow\033[m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
echo "Miner01 Height:\033[1m $miner01\033[0m"
#echo "Miner02 Height:\033[1m $miner02\033[0m"
echo "   unstarted is 455760"
echo " "
echo "Actual  Height:\033[1m $actual\033[0m" 
#echo "CPU Percentage: $cpuPer "
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
#sleep 30
#done
