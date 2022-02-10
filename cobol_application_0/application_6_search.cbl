*>SEARCH文 逐次検索
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_6_SEARCH.
ENVIRONMENT DIVISION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 WORKING_AREA.
*>コンソール入力&表示バッファ
            05 CONSOLE_INPUT PIC 9(01).
            05 DISP_BUF PIC X(20).
*>商品テーブル
        01 SHOHIN_TBL_MASTER.
            05 TBL_SIZE PIC 9(01).
            05 SHOHIN_TBL OCCURS 0 TO 5
                DEPENDING ON TBL_SIZE
                INDEXED BY TBL_IDX.
                10 HINBAN PIC 9(01).
                10 HINMEI PIC X(10).
PROCEDURE DIVISION.
    MAIN_PROCEDURE SECTION.
*>コンソール入力エリアの初期化
        MOVE ZERO TO CONSOLE_INPUT.
        
*>商品テーブルの初期化
        SET TBL_SIZE TO 5.
        MOVE 1 TO HINBAN(1).
        MOVE 2 TO HINBAN(2).
        MOVE 3 TO HINBAN(3).
        MOVE 4 TO HINBAN(4).
        MOVE 5 TO HINBAN(5).
        MOVE "みかん" TO HINMEI(1).
        MOVE "りんご" TO HINMEI(2).
        MOVE "バナナ" TO HINMEI(3).
        MOVE "いちご" TO HINMEI(4).
        MOVE "メロン" TO HINMEI(5).
        
    EXEC-DISPLAY-INPUT-PROC.
    *>コンソール表示&入力
        DISPLAY "PLEASE INPUT NUMBER(1~5)".
        ACCEPT CONSOLE_INPUT FROM CONSOLE.
        
    *>商品テーブルの逐次検索
        SET TBL_IDX TO 1.
        SEARCH SHOHIN_TBL
            AT END
                DISPLAY "1~5 NUMBER INPUT."
                GO TO EXEC-DISPLAY-INPUT-PROC
                WHEN HINBAN(TBL_IDX) = CONSOLE_INPUT
                DISPLAY HINMEI(TBL_IDX)
        END-SEARCH.

    END-PROC.
        STOP RUN.
END PROGRAM APPLICATION_6_SEARCH.
*>SEARCH~AT END~WHEN~END-SEARCH
*>検索表領域内を逐次検索して、WHENの検索条件に一致するデータがある場合に、
*>WHENからEND-SEARCHの間に書かれた命令軍を実行する
