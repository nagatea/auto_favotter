auto_favotter
====

## Description

TLに流れてきたツイートを片っ端からふぁぼします。

このアプリケーションはherokuで使うことを前提としています。

## Requirement 

+ gem
+ bundler


## Usage

1. cloneします．

	```
	$ git clone git@github.com:nagatea/auto_favotter.git
	```

2. Twitterのアクセストークンの設定を行います。作成したherokuのアプリケーションの`Settings`より`Config Variables`の設定を以下のように入力してください。

	```
    MY_CONSUMER_KEY = TwitterアカウントのConsumer Key
    MY_CONSUMER_SECRET = TwitterアカウントのConsumer Secret
    MY_ACCESS_TOKEN = TwitterアカウントのAccess Token
    MY_ACCESS_TOKEN_SECRET = TwitterアカウントのAccess Token Secret
	```

3. herokuにデプロイする。

    うまくいけば勝手にふぁぼってくれると思います。
