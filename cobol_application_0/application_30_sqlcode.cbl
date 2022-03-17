*>SQLCODE SQLの処理結果を持つ変数　処理の終了状態についての値を持つ
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_30_SQLCODE.
ENVIRONMENT DIVISION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    *>1.ホスト変数の定義
    EXEC SQL BEGIN DECLARE SECTION END-EXEC.
        01 DBNAME PIC X(32) VALUE "testdb".
        01 USERNAME PIC X(32) VALUE "********".
        01 PASSWORD PIC X(32) VALUE "********".
        01 TID PIC X(4).
        01 TNAME PIC X(10).
        01 SW_AREA.
            05 SW_NOTFOUND PIC X(01) VALUE SPACE.
        01 CST_AREA.
            05 CST_1X PIC X(01) VALUE "1".
            05 CST_SQL_NF PIC S9(09) COMP-5 VALUE +100.
    EXEC SQL END DECLARE SECTION END-EXEC.
    *>2.共通領域の定義
    EXEC SQL INCLUDE SQLCA END-EXEC.
PROCEDURE DIVISION.
    MAIN-RTN SECTION.
    *>3.データベース接続
    EXEC SQL
        CONNECT :USERNAME IDENTIFIED BY :PASSWORD
            USING :DBNAME
    END-EXEC.
    *>4.データベースアクセス
    *>DB カーソルオープン処理
        PERFORM OPEN-RTN.
    *>DB FETCH処理
        PERFORM FETCH-RTN UNTIL SW_NOTFOUND = CST_1X.
    *>DB カーソルクローズ処理
        PERFORM CLOSE-RTN.
    STOP RUN.
    MAIN-EXIT.
    
    *>DB　カーソルオープン処理
    OPEN-RTN SECTION.
        EXEC SQL
            DECLARE CSR01 CURSOR FOR
            SELECT tid,tname
            FROM test
            WHERE tid = '0002'
        END-EXEC.
        EXEC SQL 
            OPEN CSR01
        END-EXEC.
    OPEN-EXIT.
    *>DB FETCH処理　
    FETCH-RTN SECTION.
        EXEC SQL 
            FETCH CSR01
            INTO :TID,:TNAME
        END-EXEC.
        
        EVALUATE SQLCODE
            WHEN ZERO 
                DISPLAY TID TNAME SQLCODE
            WHEN CST_SQL_NF
                DISPLAY SQLCODE
                MOVE CST_1X TO SW_NOTFOUND
            WHEN OTHER
                DISPLAY SQLCODE
                DISPLAY "ERROR"
        END-EVALUATE.
    FETCH-EXIT.
    *>DB カーソルクローズ処理
    CLOSE-RTN SECTION
        EXEC SQL 
            CLOSE CSR01
        END-EXEC.
    END-EXIT.
    
    END PROGRAM APPLICATION_30_SQLCODE.

*>SQLCODE = 0
*>処理正常終了
*>SQLCODE = 100
*>FETCH処理時、該当データなし
*>SQLCODE > 0 警告
*>SQLCODE < 0 処理異常終了
*>検索後にSQLCODEが0(正常終了)か、100(該当データなし)か、それ以外(異常終了)かを
*>判断して、後続処理を実施している

