# 概要
レベルアッププログラミングの静的サイト公開の練習リポジトリです。

# プロジェクト管理

このリポジトリのタスクはプロジェクトにて管理されています。
タスクの追加・進行・完了時は、プロジェクトの更新も忘れないようにしてください。

https://github.com/yos10/lp-practice-static/projects/1

# サイトのURL
http://yos10.s223.xrea.com/

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
