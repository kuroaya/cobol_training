*>INSERT DBのテーブルにレコードを追加する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_26_INSERT.
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
            INSERT INTO test
            (tid,tname)
            VALUES ('0002','orange')
        END-EXEC.
        
        DISPLAY "DB INSERT END".
        
        EXEC SQL 
            COMMIT
        END-EXEC.
        
        STOP RUN.
        END PROGRAM APPLICATION_26_INSERT.

*>INSERT INTO テーブル名
*>  (列名1、列名2…)
*>  VALUES(値1、値2…)
*>列名を指定して、パラメータを入力する
