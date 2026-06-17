# Changelog

このゲームのバージョンごとの変更履歴。新しいものを上に追記する。
バージョンはコード内の `const VERSION` と一致させる。

## [v38] - 2026-06-17

### 追加
- スタート画面下部に更新日・バージョン表示を追加

### その他
- incrementaldb所有権確認コードをHTMLコメントとして埋め込み

[v38]: https://github.com/woopsdez/lumber-camp/releases/tag/v38

## [v37] - 2026-06-17

### 変更
- クリア画面CTA: メール登録ボタン → itchフォロー＆感想コメント導線に差し替え（PII不保持）

[v37]: https://github.com/woopsdez/lumber-camp/releases/tag/v37

## [v36] - 2026-06-17
前回の公開ビルド(v25)からの変更をまとめたリリース。

### 追加
- 誘導矢印（ナビ）。次の目的地をプレイヤー周囲の矢印で常時表示。画面外は距離(◯m)も表示。
- 全員共通のオンラインランキング（Cloudflare Worker + KV）。クリアタイムを全プレイヤーで共有。通信失敗時はローカル記録にフォールバック。
- 森制覇時に、カメラが引いて川エリアの全景を見せる演出。
- 川エリアを森制覇と同時に表示（開拓パッド出現と同タイミング）。これから開放する要素をロック状態で予告表示。
- 川エリア未開拓時の境界フェンス＋当たり判定（開拓するまで入れない）。

### 変更
- お金（札束）の回収を、触れた瞬間に全額即クレジット（数字は待ち時間ゼロ）。カウンター上の山は0.8秒かけて減る演出に。
- サウンドON/OFFなど設定まわりを整備。 ※v25時点の状態によっては既存

## [v25] - (last public build)
itchで公開していたベースライン。

[v36]: https://github.com/woopsdez/lumber-camp/releases/tag/v36
[v25]: https://github.com/woopsdez/lumber-camp/releases/tag/v25
