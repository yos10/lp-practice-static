# 概要
レベルアッププログラミングの静的サイト公開の練習リポジトリです。

## プロジェクト管理

このリポジトリのタスクはプロジェクトにて管理されています。
タスクの追加・進行・完了時は、プロジェクトの更新も忘れないようにしてください。

https://github.com/yos10/lp-practice-static/projects/1

## サイトのURL
https://yos10.shop/

## 必要な情報
「XREA.COM NEW SIGNUP」というメールに書かれています。

## ssh 接続
公開鍵認証でSSH接続できるようになりました。
```
ssh yos10@s223.xrea.com -i ~/.ssh/id_rsa_github
```
もし家のルータ再起動などでグローバルIPアドレスが変わった場合は、以下のコントロールパネルより、もう一度許可し直してください。  
https://cp.xrea.com/site/tools/

## リリース手順

プロジェクトディレクトリで以下のコマンドを実行してください

```
sh deploy.sh
```

## Windows 11 でコンテナ内で rsync コマンドを使う

参考にしたページ  
https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container

vscode に Remote - Containers 拡張機能をインストール  
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

1. powershell を管理者として実行し、以下のコマンドを入力して ssh-agent をスタートします。
    ```
    Set-Service ssh-agent -StartupType Automatic
    Start-Service ssh-agent
    Get-Service ssh-agent
    ```

1. キーを ssh-agent に登録します。
    ```
    ssh-add $HOME/.ssh/id_rsa
    ```

    もしくは[授業動画](https://www.nnn.ed.nico/lessons/482532067)の 00:36:47 辺りを参考に ssh-keygen でファイル名を指定した場合
    ```
    ssh-add $HOME/.ssh/指定したファイル名
    ```

1. 登録されたか確認します。
    ```
    ssh-add -L
    ```

1. [devcontainer 用のファイル](https://github.com/yos10/lp-practice-static/commit/b93cfe82f082feb30fd709d1e7d5399d9a0abb22)を追加します。

1. vscode の左下の `><` をクリックし、`Reopen in Container` をクリックします。

1. vscode server のインストールと、コンテナが起動するまでしばらく待ちます。

1. vscode のターミナルを表示します。`Ctrl` + `j` でターミナルの表示/非表示ができます。

1. グローバル IP を許可してから SSH 接続するには、以下のコマンドを実行します。
    ```
    ssh [ユーザ名]@[サーバのアドレス]
    ```

1. ファイルを同期するには、以下のコマンドを実行します。
    ```
    sh deploy.sh
    ```

1. コンテナを終了するには、vscode の左下の `><` をクリックし、`Reopen Folder Locally` をクリックします。

1. コンテナを削除するには、画面左の`リモートエクスプローラー`アイコンをクリックし、CONTAINERS の下の Dev Containers にカーソルを合わせて `x` をクリックします。

## ssh-agent の設定を元に戻すには

1. ssh-agent に登録したキーを削除するには、以下のコマンドを実行します。
    ```
    ssh-agent -D
    ```

1. 削除されたか確認します。
    ```
    ssh-add -L
    ```

1. ssh-agent を停止するには、powershell を管理者として実行し、以下のコマンドを入力します。
    ```
    Stop-Service ssh-agent
    ```

1. ssh-agent のスタートアップの種類を無効にするには、powershell を管理者として実行し、以下のコマンドを入力します。
    ```
    Set-Service ssh-agent -StartupType Disabled
    ```

## Tips: 秘密鍵をクリップボードへコピーするコマンド

```
cat ~/.ssh/id_rsa | clip
```
