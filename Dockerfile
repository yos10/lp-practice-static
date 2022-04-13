FROM --platform=linux/x86_64 ubuntu:20.04
RUN yes | unminimize

# コマンド入力履歴をボリュームに保存
# https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history?WT.mc_id=devcloud-0000-buhollan
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> "/root/.bashrc"

# apt-get install コマンドが失敗しないように
# http://docs.docker.jp/develop/develop-images/dockerfile_best-practices.html#apt-get
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    locales \
    openssh-client \
    ca-certificates \
    rsync \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /linux-study
