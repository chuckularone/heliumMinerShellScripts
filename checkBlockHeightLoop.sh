MINER01="miner01"
MINER02="miner02"
MINER03=""
varLen01=varLen=$(echo ${#MINER01})
varLen02=varLen=$(echo ${#MINER02})
varLen03=varLen=$(echo ${#MINER03})

# Loop starts here
while true; do 

# Get miner height for miner01
if [ $varLen01 -gt 0 ]
then
    minerHeight01=$(docker exec $MINER01 miner info height | awk '{print $2}')
fi

# Get miner height for miner02
if [ $varLen02 -gt 0 ]
then
    minerHeight02=$(docker exec $MINER02 miner info height | awk '{print $2}')
fi

# Get miner height for miner03
if [ $varLen03 -gt 0 ]
then
    minerHeight03=$(docker exec $MINER03 miner info height | awk '{print $2}')
fi

bloop=$(curl https://api.helium.io/v1/blocks/height)
blah=$(echo $bloop | rev | cut -d":" -f1 | rev)
actual=$(echo $blah | rev |cut -b 3- | rev)

clear
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
datenow=$(date)
echo "\033[32m$datenow\033[m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
echo "Miner01 Height:\033[1m $miner01\033[0m"
echo "Miner02 Height:\033[1m $miner02\033[0m"
echo "Miner03 Height:\033[1m $miner03\033[0m"
echo " "
echo "Actual  Height:\033[1m $actual\033[0m" 
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
testVal01=$(expr $actual - $miner01)
testVal02=$(expr $actual - $miner02)
testVal03=$(expr $actual - $miner03)
echo "  \033[41m$testVal01\033[m   \033[41m$testVal02\033[m"
echo "MINER01, $datenow, $testVal01" >> log.out
echo "MINER02, $datenow, $testVal02" >> log.out
echo "MINER03, $datenow, $testVal02" >> log.out
docker ps
sleep 30
done
