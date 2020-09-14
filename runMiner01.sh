docker run -d\
      	--env REGION_OVERRIDE=US915\
      	--restart always\
       	--publish 1680:1680/udp\
       	--publish 44158:44158/tcp\
       	--name miner01\
       	--mount type=bind,source=/home/chuck/miner/miner_data_01,target=/var/log\
       	quay.io/team-helium/miner:miner-amd64_2020.09.01.0_GA
