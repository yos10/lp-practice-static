FROM --platform=linux/x86_64 ubuntu:18.04
RUN yes | unminimize

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

# apt-get install コマンドが失敗しないように
# http://docs.docker.jp/develop/develop-images/dockerfile_best-practices.html#apt-get
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /linux-study
