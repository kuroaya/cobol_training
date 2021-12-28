*>特定の条件を満たしたレコードをIF文でカウントする
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_19_RECORDCOUNT.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 CLASS_DATA.
            05 STUDENT OCCURS 3 INDEXED BY K.
                10 NAME_DATA PIC X(10).
                10 MATH_DATA PIC 9(3).
        01 COUNT_DATA PIC 9 VALUE ZERO.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INPUT_PART.
        SET K TO 3.
            MOVE "SUZUKI" TO NAME_DATA(1).
            MOVE "TANAKA" TO NAME_DATA(2).
            MOVE "KOTORI" TO NAME_DATA(3).
            MOVE 98 TO MATH_DATA(1).
            MOVE 85 TO MATH_DATA(2).
            MOVE 92 TO MATH_DATA(3).
    COUNT_PART.
        PERFORM VARYING K FROM 1 BY 1 UNTIL K > 3
            IF MATH_DATA(K) > 90
                THEN
                    ADD 1 TO COUNT_DATA;
                ELSE
                    CONTINUE;
            END-IF
        END-PERFORM.
    OUTPUT_PART.
        DISPLAY "MATH>90 " COUNT_DATA " PEOPLE".
    END_PART.
        STOP RUN.
*>PERFORM VARYING 指標名 FROM 初期値 FORM 増加値 UNTIL 指標名 > 値
*>指標名が値を超えるまで、以下の処理を繰り返す
*>以上の処理に、条件が合致したら、カウントするデータ項目を増やす処理を挿入する
