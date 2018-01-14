FROM nvidia/cuda:9.1-devel

ENV NHEQ_VERSION=5c

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl ca-certificates unzip \
  && curl -fSL https://github.com/nicehash/nheqminer/releases/download/0.${NHEQ_VERSION}/Ubuntu_16_04_x64_cuda_djezo_avx_nheqminer-${NHEQ_VERSION}.zip -o miner.zip \
  && unzip miner.zip -d miner \
  && mv miner/nheqminer_16_04 /usr/local/bin/nheqminer \
  && chmod +x /usr/local/bin/nheqminer \
  && apt-get remove -y curl unzip \
  && apt autoremove -y \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["nheqminer"]

CMD ["-h"]