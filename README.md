## タスク管理アプリケーションの作成(ruby on railsを使用する)    
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
