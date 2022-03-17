*>COMMIT DBへの変更を確定して、変更を永続的なものにする
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_28_COMMIT.
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
        SET tname = 'peach'
        WHERE tid = '0001'
    END-EXEC.
    DISPLAY "DB UPDATE1 END".
    EXEC SQL
        ROLLBACK
    END-EXEC.
    
    EXEC SQL 
        UPDATE test 
        SET tname = 'peach'
        WHERE tid = '0002'
    END-EXEC.
    DISPLAY "DB UPDATE2 END".
    EXEC SQL 
        COMMIT
    END-EXEC.
    
    STOP RUN.
    END PROGRAM APPLICATION_28_COMMIT.

*>COMMIT
*>変更を確定する
*>ROLLBACK
*>変更されたデータを処理開始前の状態に戻す

