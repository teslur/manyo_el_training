# demo
あとでherokuのURLをはる

# tips
## つまりどころ
### bundle installがmysql2でこける
よくある。sslのライブラリが見つからない〜とか。
```
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"
bundle install --path vendor/bundle
```

