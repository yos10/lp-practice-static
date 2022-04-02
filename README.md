# 概要
レベルアッププログラミングの静的サイト公開の練習リポジトリです。

# プロジェクト管理

このリポジトリのタスクはプロジェクトにて管理されています。
タスクの追加・進行・完了時は、プロジェクトの更新も忘れないようにしてください。

https://github.com/yos10/lp-practice-static/projects/1

# サイトのURL
https://yos10.shop/

# 必要な情報
「XREA.COM NEW SIGNUP」というメールに書かれています。

# ssh 接続
公開鍵認証でSSH接続できるようになりました。
```
ssh yos10@s223.xrea.com -i ~/.ssh/id_rsa_github
```
もし家のルータ再起動などでグローバルIPアドレスが変わった場合は、以下のコントロールパネルより、もう一度許可し直してください。
https://cp.xrea.com/site/tools/

# リリース手順

プロジェクトディレクトリで以下のコマンドを実行してください

```
sh deploy.sh
```

# Windows 11 でコンテナ内で rsync コマンドを使う

参考  
https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container

vscode に Remote - Containers 拡張機能をインストール  
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

1. `ssh-keygen` で `id_rsa_github` というファイル名でキーを作ります

1. powershell を管理者として実行し、以下のコマンドを入力します
    ```
    Set-Service ssh-agent -StartupType Automatic
    Start-Service ssh-agent
    Get-Service ssh-agent
    ```

1. SSH キーをエージェントに登録します
    ```
    ssh-add $HOME/.ssh/id_rsa_github
    ```

1. 登録されたか確認します
    ```
    ssh-add -L
    ```

1. vscode の左下の `><` をクリックし、`Reopen in Container` をクリックします。

1. vscode server のインストールと、コンテナが起動するまでしばらく待ちます。

1. ターミナルを表示します。`Ctrl` + `j` でターミナルの表示/非表示ができます。

1. ファイルを同期するコマンドを実行します  
    ```
    sh deploy.sh
    ```

1. コンテナを終了するには、vscode の左下の `><` をクリックし、`Reopen Folder Locally` をクリックします。

1. コンテナを削除するには、画面左の`リモートエクスプローラー`をクリックし、CONTAINERS の下の Dev Containers にカーソルを合わせて `x` をクリックします。
