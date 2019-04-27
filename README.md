# README

# タスク管理アプリケーションの作成(ruby on railsを使用する)


## タスク管理アプリケーションを作成します。以下の機能をつけること。

### 1.Userがいること
### 2.Userがタスクを登録できる。
### 3.TaskにはLabelを複数つけることができる。
### 4.Labelは複数のTaskにつけられる。

## データベースはpostgresqlを使用する。

## テーブルは３つ作成する

### 1.Useテーブル
### 2.Taskテーブル
### 3.Labelテーブル

## それぞれのテーブルのカラム名

### Userテーブル

#### 1.user_id
#### 2.name
#### 3.email_adress
#### 4.password
#### 5.password_confirmation

### Taskテーブル

#### 1.task_id
#### 2.content

### Labelテーブル

#### 1.user_id
#### 2.task_id

## テーブルの関係性

### 1.Userは複数のTaskを持つ
### 2.Userは複数のLabelを持つ
### 3.Taskは複数のLabelを持つ
