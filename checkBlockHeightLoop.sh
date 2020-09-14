MINER01="miner01"
MINER02="miner02"
MINER03=""
varLen01=$(echo ${#MINER01})
varLen02=$(echo ${#MINER02})
varLen03=$(echo ${#MINER03})

# Loop starts here
while true; do 

# Get miner height for miner01
if [ $varLen01 -gt 0 ]
then
    echo "VarLen = $varLen01"
    minerHeight01=$(docker exec $MINER01 miner info height | awk '{print $2}')
fi

# Get miner height for miner02
if [ $varLen02 -gt 0 ]
then
    echo "VarLen = $varLen02"
    minerHeight02=$(docker exec $MINER02 miner info height | awk '{print $2}')
fi

# Get miner height for miner03
if [ $varLen03 -gt 0 ]
then
    echo "VarLen = $varLen03"
    minerHeight03=$(docker exec $MINER03 miner info height | awk '{print $2}')
fi

bloop=$(curl https://api.helium.io/v1/blocks/height)
blah=$(echo $bloop | rev | cut -d":" -f1 | rev)
actual=$(echo $blah | rev |cut -b 3- | rev)

#clear
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
datenow=$(date)
echo "\033[32m$datenow\033[m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
echo "Miner01 Height:\033[1m $minerHeight01\033[0m"
echo "Miner02 Height:\033[1m $minerHeight02\033[0m"
echo "Miner03 Height:\033[1m $minerHeight03\033[0m"
echo " "
echo "Actual  Height:\033[1m $actual\033[0m" 
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-= "
echo " "
testVal01=$(expr $actual - $minerHeight01)
testVal02=$(expr $actual - $minerHeight02)
testVal03=$(expr $actual - $minerHeight03)
echo "  \033[41m$testVal01\033[m   \033[41m$testVal02\033[m"
echo "MINER01, $datenow, $testVal01" >> log.out
echo "MINER02, $datenow, $testVal02" >> log.out
echo "MINER03, $datenow, $testVal02" >> log.out
docker ps
sleep 30
done
