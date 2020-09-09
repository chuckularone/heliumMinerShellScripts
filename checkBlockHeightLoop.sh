while true; do 
miner01=$(docker exec miner01 miner info height | awk '{print $2}')
#miner02=$(docker exec miner02 miner info height | awk '{print $2}')
bloop=$(curl https://api.helium.io/v1/blocks/height)
blah=$(echo $bloop | rev | cut -d":" -f1 | rev)
actual=$(echo $blah | rev |cut -b 3- | rev)

clear
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
datenow=$(date)
echo "\033[32m$datenow\033[m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
echo "Miner01 Height:\033[1m $miner01\033[0m"
#echo "Miner02 Height:\033[1m $miner02\033[0m"
#echo " "
echo "Actual  Height:\033[1m $actual\033[0m" 
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
testVal01=$(expr $actual - $miner01)
#testVal02=$(expr $actual - $miner02)
echo "  \033[41m$testVal01\033[m   \033[41m$testVal02\033[m"
echo "MINER01, $datenow, $testVal01" >> log.out
# echo "MINER02, $datenow, $testVal02" >> log.out
sleep 30
done

