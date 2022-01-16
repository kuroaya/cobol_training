*>DISPLAY文 入力された文をディスプレイに出力する
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_1_DISPLAY.
ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 INPUT_RECORD.
            05 IN_DATA_STR PIC X(10).
            05 IN_DATA_NUM PIC 9(4).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INPUT_PART.
        DISPLAY "英数字を入力してください>>" WITH NO ADVANCING.
        ACCEPT IN_DATA_STR FROM CONSOLE.
        DISPLAY "数値を入力してください>>" WITH NO ADVANCING.
        ACCEPT IN_DATA_NUM FROM CONSOLE.
    JUDGE_PART.
        IF IN_DATA_NUM IS NUMERIC
            THEN
                IF IN_DATA_NUM >= 100 AND
                IN_DATA_NUM <= 999
                    THEN
                        CONTINUE;
                    ELSE
                        DISPLAY "入力した数値が正しくありません";
                        STOP RUN;
                END-IF
            ELSE
                DISPLAY "数値以外が入力されました";
                STOP RUN;
        END-IF.
    OUTPUT_PART.
        DISPLAY "IN_DATA_STR="IN_DATA_STR UPON CONSOLE.
        DISPLAY "IN_DATA_NUM="IN_DATA_NUM UPON CONSOLE.
    END_PART.
        STOP RUN.
*>ACCEPT データ項目 CONSOLE
*>コンソールに入力した文字列を、データ項目に格納する
*>WITH NO ADVANCING
*>改行がされなくなる
*>DISPLAY データ項目 UPON 出力するシステム名
*>対象データ項目の内容を表示する装置名を記述する

