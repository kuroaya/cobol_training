*>UPDATE 入力ファイルの値を使ってDBの項目を更新する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_23_UPDATE_2.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN01_TID PIC X(04).
            05 IN01_TNAME PIC X(10).
    WORKING-STORAGE SECTION.
        *>1.ホスト変数の定義
        EXEC SQL BEGIN DECLARE SECTION END-EXEC.
            01 DBNAME PIC X(32) VALUE "testdb".
            01 USERNAME PIC X(32) VALUE "********".
            01 PASSWORD PIC X(32) VALUE "********".
            01 WK-IN01.
                05 TID PIC X(4).
                05 TNAME PIC X(10).
        EXEC SQL END DECLARE SECTION END-EXEC.
        
        *>2.共通領域の定義
        EXEC SQL INCLUDE SQLCA END-EXEC.
        
PROCEDURE DIVISION.
    OPEN INPUT IN01_FILE.
    READ IN01_FILE
    END-READ.
    MOVE IN01 TO WK-IN01.
    
    *>3.データベース接続
    EXEC SQL
        CONNECT :USERNAME IDENTIFIED BY :PASSWORD
            USING :DBNAME
    END-EXEC.

    *>4.データベースアクセス
    EXEC SQL
        UPDATE test
        SET tname = :TNAME
        WHERE tid = :TID
    END-EXEC.
    
    DISPLAY "DB UPDATE END".
    
    EXEC SQL
        COMMIT
    END-EXEC.
    
    CLOSE IN01_FILE.
    STOP RUN.
    END PROGRAM APPLICATION_23_UPDATE_2.
