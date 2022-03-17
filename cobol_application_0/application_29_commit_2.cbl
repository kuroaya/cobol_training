*>COMMIT_2 特定の条件下でコミットをせずに処理を終了させる
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_29_COMMIT_2.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
    SELECT IN01_FILE
        ASSIGN TO "File1.txt"
        ORGANIZATION IS LINE SEQUENTIAL
        FILE STATUS IS IN_FILE_STATUS.
        
DATA DIVISION.
    FILE SECTION.
    FD IN01_FILE.
    01 IN01.
        05 IN01_TID PIC X(04).
        05 IN01_TNAME PIC X(10).
    WORKING-STORAGE SECTION.
    01 IN_FILE_STATUS PIC XX.
    *>1.ホスト変数の定義
    EXEC SQL BEGIN DECLARE SECTION END-EXEC.
        01 DBNAME PIC X(32) VALUE "testdb".
        01 USERNAME PIC X(32) VALUE "********".
        01 PASSWORD PIC X(32) VALUE "********".
        01 WK_IN01.
            05 TID PIC X(4).
            05 TNAME PIC X(10).
    EXEC SQL END DECLARE SECTION END-EXEC.
    
    *>2.共通領域の定義
    EXEC SQL INCLUDE SQLCA END-EXEC.
    
PROCEDURE DIVISION.
    OPEN INPUT IN01_FILE.
    
    *>3.データベース接続
    EXEC SQL 
        CONNECT :USERNAME IDENTIFIED BY :PASSWORD
            USING :DBNAME
    END-EXEC.
    
    PERFORM UNTIL IN_FILE_STATUS NOT = "00"
        READ IN01_FILE
            AT END 
                DISPLAY "READ END"
            NOT AT END
                MOVE IN01 TO WK_IN01
    *>4.データベースアクセス
        EXEC SQL
            INSERT INTO test
            (tid,tname)
            VALUES(:TID,:TNAME)
        END-EXEC
        
        IF TID = "0003"
            THEN
                EXEC SQL 
                    ROLLBACK
                END-EXEC
            ELSE
                EXEC SQL
                    COMMIT 
                END-EXEC
        END-IF
        END-READ
    END-PERFORM.
    
    CLOSE IN01_FILE.
    STOP RUN.
    END PROGRAM APPLICATION_29_COMMIT_2.

*>入力データを基にして、テーブル「test」にデータを新設する処理となる
*>IN01_TID = '0003'の場合はロールバックを実行して、新設処理が行われずに処理が終了する

