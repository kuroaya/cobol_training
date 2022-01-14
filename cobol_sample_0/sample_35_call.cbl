*>CALL文 他のプログラムを呼び出す
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_35_CALL.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 TAX_DATA IS EXTERNAL PIC 9.
        01 EARNINGS PIC 9(5).
        01 TAX_INCLUDED PIC 9(5).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INPUT_PART.
        ACCEPT EARNINGS.
    CALL_PART.
        IF EARNINGS IS NUMERIC
            THEN
                MOVE 5 TO TAX_DATA;
                CALL "CALL_2" USING BY CONTENT EARNINGS
                        BY REFERENCE TAX_INCLUDED
                    ON EXCEPTION
                        DISPLAY "ERROR";
                    NOT ON EXCEPTION
                        DISPLAY EARNINGS "," TAX_INCLUDED;
                END-CALL
            ELSE
                CONTINUE;
        END-IF.
    END_PART.
        STOP RUN.
        
IDENTIFICATION DIVISION.
PROGRAM-ID. CALL_2.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 TAX_DATA IS EXTERNAL PIC 9.
    LINKAGE SECTION.
        01 EARNINGS PIC 9(5).
        01 TAX_INCLUDED PIC 9(5).
PROCEDURE DIVISION USING EARNINGS, TAX_INCLUDED.
    MAIN_PART SECTION.
    CALCULATION.
        COMPUTE TAX_INCLUDED = EARNINGS + EARNINGS * TAX_DATA / 100.
    SUB_END.
        END PROGRAM "CALL_2".
*>データ名 IS EXTERNAL データ種
*>データ間で共通して使う項目を指定する
*>CALL プログラム名 USING BY REFERENCE OR CONTENT データ項目
*>指定したプログラム名を呼び出す
*>REFERENCE 参照渡し 呼び出し先での変更が、呼び出し元に反映される
*>CONTENT 値渡し 呼び出し先で変更しても、呼び出し元に反映されない
*>ON EXCEPTION
*>呼び出し先のプログラムが実行できない場合に実行される
*>NOT ON EXCEPTION
*>呼び出し先のプログラムが実行できる場合に実行される
*>LINKAGE SECTION
*>呼ばれたプログラムが、呼び出し元から受け取ったデータ項目を記述する
*>PROCEDURE DIVISION USING データ項目
*>手続き部での実行 処理に用いるデータ項目も記述する
