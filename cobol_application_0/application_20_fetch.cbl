*>FETCH SQLの記述の一つ。指定した検索条件を元にDBにアクセスして、指定した項目(列)を取得する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_20_FETCH.
ENVIRONMENT DIVISION.
DATA DIVISION.
*>*****************************
    WORKING-STORAGE SECTION.
    *>1.ホスト変数の定義
        EXEC SQL BEGIN DECLARE SECTION END-EXEC.
            01 DBNAME PIC X(32) VALUE "testdb".
            01 USERNAME PIC X(32) VALUE "********".
            01 PASSWORD PIC X(32) VALUE "********".
            01 TID PIC X(4).
            01 TNAME PIC X(10).
            01 SW-AREA.
                05 SW-NOTFOUND PIC X(01) VALUE SPACE.
            01 CST-AREA.
                05 CST-1X PIC X(01) VALUE "1".
                05 CST-SQL-NF PIC S9(09) COMP-5 VALUE +100.
        EXEC SQL END DECLARE SECTION END-EXEC.
*>*****************************
    *>2.共通領域の定義
        EXEC SQL INCLUDE SQLCA END-EXEC.
*>*****************************
PROCEDURE DIVISION.
    MAIN-RTN SECTION.
    *>3.データベース接続
        EXEC SQL
            CONNECT :USERNAME IDENTIFIED BY :PASSWORD
                USING :DBNAME
        END-EXEC.
    *>4.データベースアクセス
    *>***** DB カーソルオープン処理
        PERFORM OPEN-RTN.
    *>***** DB FETCH処理
        PERFORM FETCH-RTN UNTIL SW-NOTFOUND = CST-1X.
    *>***** DB カーソルクローズ処理
        PERFORM CLOSE-RTN.
    STOP RUN.
    MAIN-EXIT.
*>*****************************
    *>***** DB カーソルオープン処理
        OPEN-RTN SECTION.
            EXEC SQL
                DECLARE CSR01 CURSOR FOR
                SELECT tid,tname
                FROM test
            END-EXEC.
            EXEC SQL
                OPEN CSR01
            END-EXEC.
        OPEN-EXIT.
*>*****************************
    *>***** DB FETCH処理
        FETCH-RTN SECTION.
            EXEC SQL 
                FETCH CSR01
                INTO :TID,:TNAME
            END-EXEC.
    *>
            IF SQLCODE = CST-SQL-NF
                THEN
                    MOVE CST-1X TO SW-NOTFOUND
                ELSE
                    DISPLAY TID TNAME
            END-IF.
        FETCH-EXIT.
*>*****************************
    *>***** DB カーソルクローズ処理
        CLOSE-RTN SECTION.
            EXEC SQL 
                CLOSE CSR01
            END-EXEC.
        CLOSE-EXIT.
    END-PROGRAM APPLICATION_20_FETCH.

*>カーソルの宣言
*>DECLARE カーソル名 CURSOR FOR
*>SELECT 列名1,列名2・・（テーブルから取得する項目（列）を指定）
*>FROM テーブル名
*>WHERE 検索条件
*>カーソルのオープン処理
*>OPEN カーソル名
*>FETCH処理
*>FETCH カーソル名
*>INTO 変数名1,変数名2・・（取得した項目をCOBOLで利用するためのホスト変数を指定）
*>カーソルのクローズ処理
*>CLOSE カーソル名
*>［基本的な処理構成］
*>1.ホスト変数の定義、2.共通領域の定義、3.データベース接続、4.データベースアクセス
