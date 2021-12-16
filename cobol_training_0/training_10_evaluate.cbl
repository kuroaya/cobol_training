*>EVALUATE 条件分岐
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAINING_10_EVALUATE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 MY_FOOD PIC X(5).
PROCEDURE DIVISION.
    MAIN SECTION.
        MOVE "MEAT" TO MY_FOOD.
        EVALUATE MY_FOOD
            WHEN "MEAT"
            WHEN "PORK"
                DISPLAY "THIS IS MEAT."
            WHEN "FISH"
                DISPLAY "THIS IS FISH."
            WHEN "FRUIT"
                DISPLAY "THIS IS FRUIT."
            WHEN OTHER
                DISPLAY "WRONG FOOD."
        END-EVALUATE.
        STOP RUN.
*>EVALUATE 先頭のWHENから評価が行われて、最初に合致したWHENに記述されている処理を実行する
*>EVALUATE 対象
*>WHEN 評価基準
*>処理
*>END-EVALUATE 評価終了
*>WHEN OTHER にどのWHENにも合致しない評価の処理が記述される
