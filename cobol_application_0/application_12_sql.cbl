*>COBOLとデータベースの連携
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_12_SQL.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 TID PIC X(4).
        01 TNAME PIC X(10).
        
*>ホスト変数の定義
    EXEC SQL BEGIN DECLARE SECTION END-EXEC.
        01 DBNAME PIC X(32) VALUE "testdb".
        01 USERNAME PIC X(32) VALUE "PostgreSQLユーザーID".
        01 PASSWORD PIC X(32) VALUE "ユーザーIDのパスワード".
    EXEC SQL END DECLARE SECTION END-EXEC.

*>共通領域の定義
    EXEC SQL INCLUDE SQLCA END-EXEC.
    
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
    
*>データベースと接続
    EXEC SQL 
        CONNECT:USERNAME IDENTIFIED BY :PASSWORD
            USING:DBNAME
    END-EXEC.
    
*>データベースとアクセス
    EXEC SQL
        SELECT tid,tname
        INTO:TID,:TNAME
        FROM test
        WHERE tid="0001"
    END-EXEC.
    
    DISPLAY TID TNAME.
    STOP RUN.
*>ホスト変数の定義
*>COBOL、データベース間のデータ連携用変数を定義する
*>共通領域の定義
*>データベースのエラー情報が格納される
*>データベースと接続
*>データベースに接続する
*>データベースとアクセス
*>データベースの操作(検索、追加、更新、削除など)を行う
*>CREATE DATABASE [データベース名]
*>データベース作成
*>CREATE TABLE [テーブル名](
*>[列名][データ型][制約],
*>…
*>)
*>テーブル作成
*>INSERT INTO [テーブル名]
*>([列名1],[列名2]…)VALUES
*>([値1],[値2]…)
*>データ作成
*>SELECT*FROM [テーブル名]
*>テーブル検索(結果確認)
