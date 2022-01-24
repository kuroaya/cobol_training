*>SEARCH文テーブルを検索する
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_14_SEARCH.
DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
        01 WORKING_AREA.
            05 CONSOLE_INPUT PIC 9(01).
            05 DISP_BUF PIC X(64).
        01 SHOHIN_TBL_MASTER.
            05 TBL_SIZE PIC 9(01).
            05 SHOHIN_TBL OCCURS 0 TO 5
                DEPENDING ON TBL_SIZE
                INDEXED BY TBL_IDX.
                10 HINBAN PIC 9(01).
                10 HINMEI PIC X(10).
PROCEDURE DIVISION.
    MAIN_PROCEDURE SECTION.
    INITIALIZE_PROCEDURE.
        MOVE ZERO TO CONSOLE_INPUT.
        SET TBL_SIZE TO 5.
        MOVE 1 TO HINBAN(1).
        MOVE 2 TO HINBAN(2).
        MOVE 3 TO HINBAN(3).
        MOVE 4 TO HINBAN(4).
        MOVE 5 TO HINBAN(5).
        MOVE "ORRANGE" TO HINMEI(1).
        MOVE "APPLE" TO HINMEI(2).
        MOVE "BANANA" TO HINMEI(3).
        MOVE "STRAWBERRY" TO HINMEI(4).
        MOVE "MELON" TO HINMEI(5).
    DISPLAY_INPUT.
    EXEC_DISPLAY_INPUT_PROC.
        DISPLAY "PLEASE INPUT (1~5)"
        ACCEPT CONSOLE_INPUT FROM CONSOLE.
        SET TBL_IDX TO 1.
        SEARCH SHOHIN_TBL
            AT END
                DISPLAY "INPUT ERROR"
                STOP RUN
            WHEN
                HINBAN(TBL_IDX) = CONSOLE_INPUT
                MOVE SPACE TO DISP_BUF
                STRING "HINMEI　TO　" HINMEI(TBL_IDX)
                    DELIMITED BY SPACE
                    INTO DISP_BUF
                DISPLAY DISP_BUF
        END-SEARCH.
    END_PROCEDURE.
        STOP RUN.
*>データ項目 OCCURS 最小要素数 TO 最大要素数
*>配列にするデータ項目定義を記述する
*>DEPENDING ON 要素数
*>配列に格納されているデータ数を管理するデータ項目を指定する
*>INDEXED BY インデックス項目
*>SEARCH文で検索した結果の要素番号が入るデータ項目を指定する
*>SEARCH 検索表領域名(配列名)
*>検索する表領域名(配列名)を記述する
*>AT END
*>検索条件に一致するデータがない場合に実行する処理
*>WHEN 検索条件
*>検索条件に一致するデータがある場合に実行する処理
*>検索対象項目に指定する要素番号は、表領域(配列)を定義したときINDEXED BY で指定した
*>SEARCH文用のインデックス項目を指定する
*>END-SEARCH
*>SEARCH文の終了
