
# fluent-plugin-kuromoji

Output kuromoji analysis Plugin for fluentd

required java!

## Installation

### td-agent(Linux)

    /usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-kuromoji

### td-agent(Mac)

    sudo /usr/local/Cellar/td-agent/X.X.XX/bin/fluent-gem install fluent-plugin-kuromoji

### fluentd only(bundler)

```ruby:Gemfile
gem 'fluent-plugin-kuromoji'
```

## quick start

```bash
$ git clone https://github.com/toyama0919/fluent-plugin-kuromoji
$ cd fluent-plugin-kuromoji
$ bundle install
$ bundle exec fluentd -c sample/fluent.conf -p lib/fluent/plugin/
$ echo '{ "message":"私はサッカーが大好きです" }' | fluent-cat kuromoji.input
```

## parameter

param    |   value
--------|------
target_key|analyze target key(require)
add_tag_prefix|output tag prefix(require)
dictionary_path|kuromoji dictionaly path

## setting
```
<match kuromoji.input>
  type kuromoji
  target_key message
  add_tag_prefix analyzed
  dictionary_path sample/userdict.txt
</match>

<match analyzed.kuromoji.input>
  type stdout
</match>
```

## usage

```bash
echo '{ "message":"私は朝青龍が大好きです" }' | fluent-cat kuromoji.input

# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"名詞,代名詞,一般,*","reading":"ワタシ","base_form":"私","surface_form":"私","position":0,"is_known":true,"is_user":false}
# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"助詞,係助詞,*,*","reading":"ハ","base_form":"は","surface_form":"は","position":1,"is_known":true,"is_user":false}
# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"カスタム名詞","reading":"アサショウリュウ","base_form":null,"surface_form":"朝青龍","position":2,"is_known":false,"is_user":true}
# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"助詞,格助詞,一般,*","reading":"ガ","base_form":"が","surface_form":"が","position":5,"is_known":true,"is_user":false}
# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"名詞,形容動詞語幹,*,*","reading":"ダイスキ","base_form":"大好き","surface_form":"大好き","position":6,"is_known":true,"is_user":false}
# 2014-06-21 19:20:00 +0900 analyzed.kuromoji.input: {"parts_of_speech":"助動詞,*,*,*","reading":"デス","base_form":"です","surface_form":"です","position":9,"is_known":true,"is_user":false}
```

## dictionaly exsample
```csv
##
## This file should use UTF-8 encoding
##
## User dictionary format:
##   <text>,<token1> <token2> ... <tokenn>,<reading1> <reading2> ... <readingn>,<part-of-speech>
##

# Custom segmentation for long entries
日本経済新聞,日本 経済 新聞,ニホン ケイザイ シンブン,カスタム名詞
関西国際空港,関西 国際 空港,カンサイ コクサイ クウコウ,テスト名詞

# Custom reading for former sumo wrestler Asashoryu
朝青龍,朝青龍,アサショウリュウ,カスタム名詞
```

## ChangeLog

See [CHANGELOG.md](CHANGELOG.md) for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2014 Hiroshi Toyama. See [LICENSE](LICENSE) for details.
