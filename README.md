# README
rubyのバージョンは3.0.2、apiモード。
フロントエンドはreactで作成しているため、先に当該railsサーバを起動しておくことを推奨。

1.bundle installでライブラリをインストールする。  
2.rails db:migrateでテーブルを作成する。  
3.rails db:seedで初期データを作成する。（任意）  
4.rails sでサーバを起動する。（ポートは3001がデフォルト）  