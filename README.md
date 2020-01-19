# bitcoinsv-docker
Dockerfile for bitcoinsv (<https://github.com/bitcoin-sv/bitcoin-sv>)


# Building

```bash
docker build -t bitcoinsv .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -itd --name cloak -p 8356:8356 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf bitcoinsv
```

# Using pre-built docker image

```bash
docker run --rm -itd --name cloak -p 8356:8356 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/bitcoinsv
```
