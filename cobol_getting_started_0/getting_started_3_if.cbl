*>IF文 条件分岐をTHENとELSEで行う
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_3_IF.
DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
        01 WORKING-AREA.
            05 CONSOLE_INPUT PIC X(1).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INITIALIZE_PART.
        MOVE SPACE TO CONSOLE_INPUT.
    INPUT_PART.
        DISPLAY "数字を一文字入力せよ".
        ACCEPT CONSOLE_INPUT FROM CONSOLE.
    JUDGE_PART.
        IF (CONSOLE_INPUT >= 0) AND
            (CONSOLE_INPUT <= 5)
            THEN
                DISPLAY "0から5の値が入力された"
            ELSE
                DISPLAY "6以上の値が入力された"
        END-IF.
    END_PART.
        STOP RUN.
*>条件に一致するとTHEN以下の処理を実行する
*>ELSE文があれば、条件に一致しなければELSE以下の処理を実行する
*>IF 条件
*>判断の条件を記述する
*>THEN
*>条件が成り立つときに行う処理を記述する
*>ELSE
*>成り立たないときに行う処理を記述する
*>END-IF.
*>処理の終了