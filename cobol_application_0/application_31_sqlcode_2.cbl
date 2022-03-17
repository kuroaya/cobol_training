*>SQLCODE_2 SQLCODEのキーに重複が発生した場合
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_31_SQLCODE_2.
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
    *>4-1.INSERT1 キー重複
    EXEC SQL 
        INSERT INTO test 
        (tid,tname)
        VALUES ('0002','grape')
    END-EXEC.
    
    EVALUATE SQLCODE 
        WHEN ZERO 
            DISPLAY SQLCODE 
            EXEC SQL
                COMMIT 
            END-EXEC
        WHEN OTHER
            DISPLAY SQLCODE "," SQLSTATE 
            DISPLAY "ERROR"
            EXEC SQL
                ROLLBACK
            END-EXEC
    END-EVALUATE.
    
    *>4-1.INSERT2 正常
    EXEC SQL
        INSERT INTO test
        (tid,tname)
        VALUES('0003','grape')
    END-EXEC.

    EVALUATE SQLCODE 
        WHEN ZERO 
            DISPLAY SQLCODE 
            EXEC SQL 
                COMMIT
            END-EXEC
        WHEN OTHER
            DISPLAY SQLCODE "," SQLSTATE 
            DISPLAY "ERROR"
            EXEC SQL 
                ROLLBACK
            END-EXEC
    END-EVALUATE.
    
    STOP RUN.
    END PROGRAM APPLICATION_31_SQLCODE_2.

*>テーブルtestに2レコードデータを新設する処理