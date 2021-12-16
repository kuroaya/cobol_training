*>IFによる条件分岐
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAINING_9_IF.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 IF_DATA PIC 9(3).
PROCEDURE DIVISION.
    MAIN SECTION.
        MOVE 70 TO IF_DATA.
        IF IF_DATA > 60
            THEN
                DISPLAY "PASS"
            ELSE
                DISPLAY "NO PASS"
        END-IF.
*>比較演算子を文字列であらわす
        IF IF_DATA IS GREATER 80
            THEN
                DISPLAY "PASS"
            ELSE
                DISPLAY "NO PASS"
        END-IF.
        STOP RUN.
*>IF 条件分岐を設定できる
*>IF 条件
*>THEN 真の場合
*>ELSE 偽の場合
*>END-IF. IF終了
*>比較演算子 < > >= <=
*>=
*>NOT =
*>IS EQUAL TO
*>IS GREATER THAN
*>IS GREATER THAN OR EQUAL TO

