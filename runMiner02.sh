docker run -d\
      	--env REGION_OVERRIDE=US915\
      	--restart always\
       	--publish 1681:1680/udp\
       	--publish 44159:44158/tcp\
       	--name miner02\
       	--mount type=bind,source=/home/chuck/miner/miner_data_02,target=/var/log\
       	quay.io/team-helium/miner:miner-amd64_2020.09.04.0_GA
