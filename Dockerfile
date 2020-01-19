FROM ubuntu:19.04

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 8356

RUN apt-get update && apt-get install -y wget python
RUN wget https://download.bitcoinsv.io/bitcoinsv/1.0.0/bitcoin-sv-1.0.0-x86_64-linux-gnu.tar.gz -O - | tar -xzf - --strip-components 1

# cleanup
RUN apt remove -y wget && apt autoremove -y && apt autoclean
RUN rm -rf /var/lib/apt/lists/* /opt/coin/bin/{bitcoin-tx,test_bitcoin,bitcoin-seeder,bitcoin-miner}

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/bin/bitcoind"]
CMD ["-conf=/opt/coin/coin.conf"]
