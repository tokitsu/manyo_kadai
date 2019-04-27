# README

#タスク管理アプリケーションの作成(ruby on railsを使用する)


##タスク管理アプリケーションを作成します。以下の機能をつけること。

###１、Userがいること
###２、Userがタスクを登録できる。
###３、TaskにはLabelを複数つけることができる。
###４、Labelは複数のTaskにつけられる。

##データベースはpostgresqlを使用する。

##テーブルは３つ作成する

###１、Useテーブル
###２、Taskテーブル
###３、Labelテーブル

##それぞれのテーブルのカラム名

###Userテーブル

####１、user_id
####２、name
####３、email_adress
####４、password
####５、password_confirmation

###Taskテーブル

####１、task_id
####２、content

###Labelテーブル

####１、user_id
####２、task_id

##テーブルの関係性

###１、Userは複数のTaskを持つ
###２、Userは複数のLabelを持つ
###３、Taskは複数のLabelを持つ
