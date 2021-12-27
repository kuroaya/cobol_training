*>多次元の表を作成する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_18_MULTITABLE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 SCHOOL_YEAR.
            05 CLASS_DATA OCCURS 2 INDEXED BY L.
                10 STUDENT_DATA OCCURS 3 INDEXED BY K.
                    15 NUMBER_DATA PIC 9(2).
                    15 NAME_DATA PIC X(6).
                    15 POINT_DATA PIC 9(3).
                    15 SPA PIC X VALUE SPACE.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
        INPUT_PART.
            MOVE 1 TO NUMBER_DATA(1,1) NUMBER_DATA(2,1).
            MOVE 2 TO NUMBER_DATA(1,2) NUMBER_DATA(2,2).
            MOVE 3 TO NUMBER_DATA(1,3) NUMBER_DATA(2,3).
            MOVE "TANAKA" TO NAME_DATA(1,1).
            MOVE "SUZUKI" TO NAME_DATA(1,2).
            MOVE "MIYA" TO NAME_DATA(1,3).
            MOVE "GOTOU" TO NAME_DATA(2,1).
            MOVE "KASIWA" TO NAME_DATA(2,2).
            MOVE "TAGUTI" TO NAME_DATA(2,3).
            MOVE 95 TO POINT_DATA(1,1).
            MOVE 86 TO POINT_DATA(1,2).
            MOVE 73 TO POINT_DATA(1,3).
            MOVE 91 TO POINT_DATA(2,1).
            MOVE 92 TO POINT_DATA(2,2).
            MOVE 95 TO POINT_DATA(2,3).
        OUTPUT_PART.
            DISPLAY SCHOOL_YEAR.
            STOP RUN.
*>OCCURS句で次元数を設定できる
*>指定時は次元数をカンマで区切って記述する

            