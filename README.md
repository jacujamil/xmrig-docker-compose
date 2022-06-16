xmrig-docker-compose
============

Credits:
https://github.com/khell/xmrig-docker

Docker-compose files for the `xmrig` Monero CPU miner. `xmrig` is built directly from master branch on its public Github repository with all defaults, except devfee which will now default to 0%.

### Usage
Please update Dockerfile and change your pool address and wallet address, maybe it is good for you to change cpu usage from 100% in case if you have anything else on your server.

```
apt-get update && apt-get upgrade -y && apt-get install docker-compose -y
mkdir /docker && cd /docker
git clone https://github.com/jacujamil/xmrig-docker-compose.git
cd ./xmrig-docker-compose/
docker-compose up -d --build
```
https://github.com/jacujamil/xmrig-docker-compose.git
### Host server configuration for better hashrate
You need to load msr module:

```
modprobe msr allow_writes=on
```

If it doesn't help, check this manual:
https://xmrig.com/docs/miner/randomx-optimization-guide/msr


