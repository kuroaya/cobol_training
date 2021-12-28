*>SEARCH 条件に合致するデータを検索する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_20_SEARCH.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 CLASS_DATA.
            05 STUDENT_DATA OCCURS 3 INDEXED BY K.
                10 NAME_DATA PIC X(10).
                10 MATH_DATA PIC 9(3).
        01 PEOPLE_COUNT PIC 9 VALUE ZERO.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INPUT_PART.
        MOVE "TANAKA" TO NAME_DATA(1).
        MOVE "SUZUKI" TO NAME_DATA(2).
        MOVE "MIYAMOTO" TO NAME_DATA(3).
        MOVE 88 TO MATH_DATA(1).
        MOVE 95 TO MATH_DATA(2).
        MOVE 90 TO MATH_DATA(3).
    INITIAL_PART.
        SET K TO 1.
    COUNT_PART.
        PERFORM UNTIL K > 3
            SEARCH STUDENT_DATA VARYING K
                AT END
                    CONTINUE;
                WHEN MATH_DATA(K) >= 90
                    ADD 1 TO PEOPLE_COUNT;
                    SET K UP BY 1;
            END-SEARCH
        END-PERFORM.
    DISPLAY_PART.
        DISPLAY "MATH>=90 " PEOPLE_COUNT " PEOPLE".
    END_PART.
        STOP RUN.
*>SEARCH データ項目 VARYING 指標名
*>データ項目の指標名に対応するデータを検索対象とする
*>AT END
*>検索が終了したときの処理を記述する
*>WHEN 条件
*>条件に合致したときの処理を記述する
*>END-SEARCH.
*>SEARCHの終了

