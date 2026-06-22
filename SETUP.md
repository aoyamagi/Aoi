# GitHub Pages へのデプロイ手順

ここまでで PWA 化と Git 初期化は完了済みです。
以下の手順で GitHub Pages に公開して、スマホからアクセスできるようにします。

---

## ① GitHub アカウントの準備

- GitHub アカウントがない場合は https://github.com/signup から作成（無料）。
- アカウント名（例：`yourname`）はあとで URL に使われます。

## ② GitHub に空のリポジトリを作る

1. ブラウザで https://github.com/new を開く
2. 設定:
   - **Repository name**: `todo-app`（自由）
   - **Public** を選択（GitHub Pages 無料公開のため）
   - "Add a README" などのチェックは **すべて外す**
3. 「Create repository」をクリック
4. 表示される URL を控えておく（例：`https://github.com/yourname/todo-app.git`）

## ③ ローカルから GitHub にプッシュ

このフォルダ（`C:\Users\aoyamagi\Desktop\TodoApp`）でターミナルを開き、以下を実行：

```cmd
git remote add origin https://github.com/yourname/todo-app.git
git branch -M main
git push -u origin main
```

途中で GitHub のログイン画面が表示されたら、ブラウザでサインインしてください。

## ④ GitHub Pages を有効化

1. GitHub のリポジトリページを開く
2. 上部メニューの **Settings** → 左メニューの **Pages**
3. **Source** を `Deploy from a branch` に
4. **Branch** を `main` ／ `/ (root)` にして **Save**
5. 1〜2分ほど待つと、ページ上部に公開 URL が表示されます
   - 例：`https://yourname.github.io/todo-app/`

## ⑤ スマホで開いてホーム画面に追加

### iPhone (Safari)

1. Safari で公開 URL を開く
2. 下部の共有ボタン（□↑）をタップ
3. 「ホーム画面に追加」を選択
4. 名前を確認して「追加」

### Android (Chrome)

1. Chrome で公開 URL を開く
2. 右上の「︙」メニュー
3. 「ホーム画面に追加」または「アプリをインストール」を選択

---

## 更新の反映

`index.html` などを編集した後は、ターミナルで以下を実行：

```cmd
git add .
git commit -m "Update"
git push
```

数十秒〜数分で GitHub Pages に反映されます。

## トラブルシューティング

- **公開 URL を開いても 404**: GitHub Pages の有効化から数分かかります。Settings→Pages を再確認。
- **HTTPS でない**: `https://*.github.io` は最初から HTTPS。Service Worker / PWA も問題なく動きます。
- **更新が反映されない**: スマホ側でブラウザのキャッシュを更新。インストール済みPWAの場合、一度長押し→アンインストールして再追加すると確実です。
- **複数人で同じデータを共有したい**:
  - 共有🔗ボタン → 「共有URLを作成」で URL を発行（LINE で送信）
  - 受け取った側がその URL を開くと自動で取り込み確認が出ます
  - もしくは「JSONをコピー」してメッセージで送信、受け取る側は「JSONを貼り付けて取り込む」を使用
