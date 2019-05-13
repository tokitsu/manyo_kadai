# README          

## タスク管理アプリケーションの作成(ruby on railsを使用する)    
 ruby -v 2.6.2
 rails -v 5.2.3
### タスク管理アプリケーションを作成します。  以下のようにデータベースを関連づけること。  

 1.Userがいること  
 2.Userがタスクを登録できる。  
 3.TaskにはLabelを複数つけることができる。  
 4.Labelは複数のTaskにつけられる。　　


### データベースの内容    


1.テーブルは３つ作成する  

 ・Useテーブル  
 ・Taskテーブル  
 ・Labelテーブル      

2.それぞれのテーブルのカラム名  

Userテーブル    

 ・user_id  
 ・name  
 ・email_adress  
 ・password  
 ・password_confirmation    

Taskテーブル    

 ・task_id  
 ・content    

Labelテーブル    

 ・user_id  
 ・task_id      

3.テーブルの関係性    

 ・Userは複数のTaskを持つ  
 ・Userは複数のLabelを持つ  
 ・Taskは複数のLabelを持つ      

4.データベースはpostgresqlを使用する



### アプリケーションをherokuにアップする

作成したアプリケーションをherokuにアップする。

　・herokuへの公開手順

   １、herokuのアカウントを作成する。  
   　　　　herokuのサイトにてアカウントを作成する。  
   ２、作成後、ターミナルでログインを行う。  
   　　heroku login --interactive このコマンドを実行して  
      メールアドレスとパスワードを入力する。  
     （これでログイン完了します。）  
   ３、アップするファイルの準備  
   　　ターミナルでgitのファイルをcommitする。  
   ４、heokuでのアプリケーションの作成  
   　　コマンド heroku create を実行してアプリケーションを  
   　　作成します。  
   ５、デプロイを行う  
   　　git push heroku master のコマンドを実行してherokuに  
   　　デプロイを行う。  
   ６、デプロイ後、マイグレーションを行う  
   　　heroku run rails db:migrate のコマンドを行う。  
   ７、アプリケーションの確認  
   　　herokuのサイトにログインして、作成したアプリケーションを  
   　　クリックし、open app のボタンをクリックすると  
   　　作成したアプリケーションが立ち上がります。  
