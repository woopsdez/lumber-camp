# きこりキャンプ (Lumber Camp)

ブラウザで動く「アーケードアイドル」系の小さなゲーム。伐採→販売→雇用で自動化していく。
単一HTMLファイル完結。日本語/英語UI対応。

- **遊ぶ**: `lumber-camp.html` をブラウザで開くだけ。公開先 itch: https://migy-craft.itch.io/ano-lumber-camp
- **バージョン**: コード内の `const VERSION` を参照。リリースは Git タグで管理。
- **ランキング**: 全員共通のオンラインランキング。バックエンドは Cloudflare Worker + KV
  （ゲーム内 `LEADERBOARD_URL` がエンドポイント）。Worker のコードは `leaderboard-worker.js`。
- **デバッグ**: URLに `?debug=1` を付与、またはタイトルを5回タップ。デバッグ中はランキング非保存。

## 運用メモ
- ファイルは `lumber-camp.html` 一本。変更のたびにコミットし、リリースにタグ(vNN)を打つ。
- 変更内容は CHANGELOG.md に追記する。
