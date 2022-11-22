FROM projectserum/build:v0.25.0

WORKDIR /soteria
RUN sh -c "$(curl -k https://supercompiler.xyz/install)" && rm soteria-linux-develop.tar.gz
ENV PATH="/soteria/soteria-linux-develop/bin/:${PATH}"

WORKDIR /workdir
RUN cargo install cargo-audit

ENV NODE_PATH=/root/.nvm/versions/node/v17.1.0/lib/node_modules
RUN npm i -g mocha

RUN mkdir tmp && cd tmp && anchor init dummy && cd dummy && anchor build && cd /workdir && rm tmp -rf
