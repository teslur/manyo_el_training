# demo
あとでherokuのURLをはる

# tips
## 環境
  * macOS Mojave 10.14.3
  * ruby 2.5.1
  * rails 5.2.3
  * mysql 8.0.12

mysqlなのはこだわりは無いけど慣れてるから。エンジニアになってから業務で使うDBがOracle→mysql→PostgreSQLと変遷してきている。

## つまりどころ
### bundle installがmysql2でこける
よくある。sslのライブラリが見つからない〜とか。
```
ld: library not found for -lssl
```
bundlerにオプションを渡してやると解決。
```
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"
bundle install --path vendor/bundle
```

### 「タスクにはラベルがつけられる」
毎回悩む。どこかでhas_many throughなテーブルの持ち方はホニャララだみたいな言説も最近見かけたし。

  1. Task has_many Labels ?
  2. Task has_many Labels through TaskLabels ?
  3. Task has 'labels' columen ?

1.は単純明快。
ラベル側からタスクを引っ張ってくるときにJOINとかSQLを二回発行するとか必要。

2.はラベルマスターを持つような想定。
ラベルは自由設定じゃなくて選ぶ、みたいなときはこっちかな。
JOINとかSQLをn回とか要る。

3.はテーブルが増えない、DBのレコード上ついてるタグが明確。
テーブルが一つだからJOINやSQL発行のオーバーヘッドは気にしなくていい。
どうせラベル名の検索はLIKE検索だろうからあんまりインデックスを気にすることもなかろう。

弱点はアソシエーションのヘルパーメソッド類が使えなくなること、ラベルがカラム長の制約を受けること、ラベルのユニーク制約とかが大変など。
多いな弱点。

今回は無難に1.を選択した。

