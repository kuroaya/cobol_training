*>表を記述する 入力人数が可変である
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_15_TABLE_SET.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    01 WORKING_AREA.
        05 CONSOLE_INPUT PIC 9(01).
    01 CLASS_1.
        05 PEOPLE PIC 9(2).
        05 STUDENT OCCURS 1 TO 50 DEPENDING ON PEOPLE INDEXED BY K.
            10 NUM PIC 9(2).
            10 SPA PIC X VALUE SPACE.
            10 NAME PIC X(10).
            10 POINT PIC 9(3).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
        INPUT_PEOPLE.
            SET PEOPLE TO 5.
        INPUT_DATA.
            MOVE 1 TO NUM(1).
            MOVE 2 TO NUM(2).
            MOVE 3 TO NUM(3).
            MOVE 4 TO NUM(4).
            MOVE 5 TO NUM(5).
            MOVE "TANAKA" TO NAME(1).
            MOVE "NOZOMI" TO NAME(2).
            MOVE "SUZUKI" TO NAME(3).
            MOVE "ISUZU" TO NAME(4).
            MOVE "GOTOU" TO NAME(5).
            MOVE 75 TO POINT(1).
            MOVE 65 TO POINT(2).
            MOVE 100 TO POINT(3).
            MOVE 99 TO POINT(4).
            MOVE 80 TO POINT(5).
        OUTPUT_DATA.
            DISPLAY "NUMBER INPUT".
            ACCEPT CONSOLE_INPUT FROM CONSOLE.
            DISPLAY STUDENT(CONSOLE_INPUT).
            STOP RUN.
*>データ項目 値1 TO 値2 DEPENDING ON カウント BY 字.
*>値1から値2の間で、カウントに指定した数だけ、データを用意できる
*>SET データ項目 TO 値
*>値の数だけ、データを入力できる器が用意される

