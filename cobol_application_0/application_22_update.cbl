*>UPDATE DBにアクセスして、指定した項目(列)の値を更新する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_22_UPDATE.
ENVIRONMENT DIVISION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        *>1.ホスト変数の定義
        EXEC SQL BEGIN DECLARE SECTION END-EXEC.
            01 DBNAME PIC X(32) VALUE "testdb".
            01 USERNAME PIC X(32) VALUE "********".
            01 PASSWORD PIC X(32) VALUE "********".
        EXEC SQL END DECLARE SECTION END-EXEC.
        
        *>2.共通領域の定義
        EXEC SQL INCLUDE SQLCA END-EXEC.

PROCEDURE DIVISION.
    *>3.データベース接続
    EXEC SQL
        CONNECT :USERNAME IDENTIFIED BY :PASSWORD
            USING :DBNAME
    END-EXEC.
    
    *>4.データベースアクセス
    EXEC SQL
        UPDATE test
        SET tname = 'peace'
        WHERE tid = '0002'
    END-EXEC.
    
    DISPLAY "DB UPDATE END".
    
    EXEC SQL
        COMMIT
    END-EXEC.
    
    STOP RUN.
    END PROGRAM APPLICATION_22_UPDATE.
*>UPDATE テーブル名
*>SET 項目1=値1、項目2=値2…:更新すると項目と値を指定
*>WHERE 検索条件
*>1.ホスト変数の定義
*>COBOL、DB間のデータ連携用の変数を定義する
*>2.共通領域の定義
*>DBのエラー情報が格納される
*>3.データベース接続
*>ユーザーID、パスワードを指定して、DBと接続する
*>4.データベースアクセス
*>DBの操作(検索、追加、更新、削除など)を行う


