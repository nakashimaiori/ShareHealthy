# Share Healthy

![49a2d75594b6820d6d9ade1f5fd4b5b5](https://user-images.githubusercontent.com/67674103/98493927-08dfae80-227f-11eb-8c3a-a63e2f2d2bc5.gif)




## サイト概要
日々の運動、体重、食事を記録するサイトです。また、ダイエット法や日記をみんなにシェアできます。

### URL
http://sharehealthy.work/

[ゲストログイン]ボタンからゲストユーザーとしてログインできます。

### サイトテーマ
- ダイエット
- 体調管理
- 運動

### テーマを選んだ理由
体調管理や体型維持は生きていく上で永遠の課題です。健康第一という言葉の通り、勉学・遊び・恋愛・就職・仕事等何においても、健康で無ければ意味がありません。
そこで、日々の食事、運動、ダイエット方法を記録・シェアすることによって、モチベーションアップだけでなく仲間と楽しくみんなで理想の体型、健康状態になることを目指したいと考えました。

### ターゲットユーザ
- 老若男女問わず、健康を日々意識し記録したい方
- 体調管理、ダイエット法、健康法をみんなで共有して頑張りたい方

### 主な利用シーン
- 日々の運動、体重変化の把握の為の利用
- どんな運動、食事、ダイエットが自分に効果的であったかの記録・共有のための利用

## 設計書

### 機能一覧
- ログイン機能(devise)
- 投稿、編集、削除
- ページネーション機能　（kaminari）
- いいね、コメント、フォロー、DM機能(ajax処理)
- 検索機能(ransack)
- タグ機能
- お問い合わせ機能(action mailer)
- カレンダー表示　（シンプルカレンダー）
- グラフ表示(chartkick)
- Ruby構文規約チェックツール(rubocop)
- テスト(RSpec)
- レスポンシブデザイン

![E14AC37B-2594-4EF0-B06A-7FBA2BD6D5B2_1_105_c](https://user-images.githubusercontent.com/67674103/98458678-a4691480-21d6-11eb-8fb0-c39f761e8700.jpeg)

詳細は下記よりご確認ください。


https://docs.google.com/spreadsheets/d/1-v_DltaFwfD5mmrK_9QtNL4X6WMki9R62gQevJ1dVPI/edit#gid=0

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- 仮想環境：Vagrant,VirtualBox

## インフラ構成図

![1E1CF403-860C-4427-9137-D93C55619AF4_1_201_a](https://user-images.githubusercontent.com/67674103/98463663-1dc92d00-2200-11eb-8dae-21b1b6a31153.jpeg)

## ER図
![Untitled Diagram](https://user-images.githubusercontent.com/67674103/98488977-64a23b80-226f-11eb-95dd-e0e501369cd2.png)


## About me

新卒で約２年間、地元の信用金庫に勤務しておりました。2020年7月からWebエンジニアを目指して勉強中です。
