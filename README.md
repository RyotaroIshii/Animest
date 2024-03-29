
# アニメスト

## サイト概要
### サイトテーマ
指定されたアニメタイトル・放送年のアニメを視聴し、ポイントを獲得してアバターの成長や称号の獲得をし、ランキング形式で全国のアニメユーザーと競争できる「アニメ×クエスト」を題材としたサービスです。なお、アニメ画像は使用せず、視聴したかどうかは自己申告となります。

### テーマを選んだ理由
気になってたアニメを観尽くすと、次はどれにするか迷うことがあります。「アニメ　おすすめ」などで調べても限界がありますし、人伝におすすめアニメを聞いたりしても、よくわからなかったり、自分で調べていないからとピンと来ない場合もあるでしょう。実際「友人達と『これが良いよ』『これおすすめだよ』と話していても、忘れたり、メモをとる気にならなかったりと、実際に視聴するのは一握り」だと聞きます。
そんな時にアニメタイトルがランダムで表示されるようなサービスがあれば、探す手間を省略でき、「おすすめ」では出ないけど面白い、"隠れ神アニメ"を発掘できるかもしれないと考えました。
特に現在の情勢で一時的に増えたアニメユーザー達は、時が経てばアニメを観なくなる可能性があります。そこでアニメタイトルを表示させるだけでなく、キャラ育成や称号機能、ランキング形式でユーザー間の順位を競えば、競争心を煽ってアニメ離れを阻止することができ、競争心がアニメへの興味・好奇心に繋がり、アニメ経済の規模を維持・拡大することができるのではないかと考えました。

### ターゲットユーザ

- 元々アニメが好きな人
- アニメを好きになった人
- キャラクター育成が好きな人
- 物を集めるのが好きな人
- 隠れ神アニメを発掘したい人
- アニメに関する部活やサークルメンバーを含め、他アニメ視聴者とランキング形式で"アニメへの情熱"を競いたい人

### 主な利用シーン

- 観るアニメに迷っているとき
- 自分のアニメへの情熱が本物だと思っているとき
- どのアニメを観れば良いか分からなくなったとき
- 知らないジャンルを開拓したいとき
- 自身が所属するコミュニティで、ただアニメを広めるだけじゃない"特別なこと"がしたい時

## 設計書
- [ER図](https://drive.google.com/file/d/1XReU3uYpgOhbVjkJaQ22HAqj0AdDeAcJ/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1AmsZ1yJPB7EGjiZuibkxRuHIPlZZqPTcp-N1T93vY6w/edit?usp=sharing)

## 実装機能リスト
リストは[こちら](https://docs.google.com/spreadsheets/d/1ui7cRQsYLrmJbussVq6b6Je69bkcSeMT1m5BW7IoXXw/edit?usp=sharing)

## 開発環境
- OS：Amazon Linux release 2 (Karoo)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 導入
- bootstrap 4.5
- kaminari 1.2.1
- font-awesome 6.2.0
- omniauth 1.9.1
- omniauth-twitter
- dotenv-rails
- graphql-client
- net-smtp
- better_errors
- binding_of_caller

## 使用素材
- squarespace
- Shutterstock
- イラストAC