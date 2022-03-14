*>DELETE 指定した検索条件を元にしてDBにアクセスして、検索条件に該当したレコードを削除する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_24_DELETE.
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
            DELETE FROM test 
            WHERE tid = '0002'
        END-EXEC.
        
        DISPLAY "DB DELETE END".
        
        EXEC SQL 
            COMMIT
        END-EXEC.
        
        STOP RUN.
        END PROGRAM APPLICATION_24_DELETE.

*>DELETE FROM テーブル名
*>WHERE 検索条件
*>検索条件に合致したレコードを削除する
*>DELETE処理後に記述しているCOMMITは、DBの更新を確定するという意味がある

