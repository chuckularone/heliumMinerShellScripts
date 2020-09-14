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
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
datenow=$(date)
echo "\033[32m$datenow\033[m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo " "
 
if [ $varLen01 -gt 0 ]
then
    testVal01=$(expr $actual - $minerHeight01)   
    echo "Miner01 Height:\033[1m $minerHeight01\033[0m    \033[41m$testVal01\033[m"
fi

if [ $varLen02 -gt 0 ]
then
    testVal02=$(expr $actual - $minerHeight02)   
    echo "Miner02 Height:\033[1m $minerHeight02\033[0m    \033[41m$testVal02\033[m"
fi

if [ $varLen03 -gt 0 ]
then
    testVal03=$(expr $actual - $minerHeight03)   
    echo "Miner03 Height:\033[1m $minerHeight03\033[0m    \033[41m$testVal03\033[m"
fi    
echo " "
echo "Actual  Height:\033[1m $actual\033[0m" 
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo " "

if [ $varLen01 -gt 0 ]
then
    testVal01=$(expr $actual - $minerHeight01)
    echo "MINER01, $datenow, $testVal01" >> log.out
fi

if [ $varLen02 -gt 0 ]
then
    testVal02=$(expr $actual - $minerHeight02)
    echo "MINER02, $datenow, $testVal02" >> log.out
fi

if [ $varLen03 -gt 0 ]
then
    echo "MINER03, $datenow, $testVal02" >> log.out
fi

echo " "
docker ps
sleep 30
done
