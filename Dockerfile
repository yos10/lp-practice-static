FROM --platform=linux/x86_64 ubuntu:18.04
RUN yes | unminimize

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

# コマンド入力履歴をボリュームに保存
# https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history?WT.mc_id=devcloud-0000-buhollan
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> "/root/.bashrc"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /linux-study
