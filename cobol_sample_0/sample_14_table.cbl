*>表を記述する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_14_TABLE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    01 WORKING_AREA.
        05 CONSOLE_INPUT PIC 9(01).
    01 CLASS_1.
        05 STUDENT OCCURS 3 INDEXED BY K.
            10 NUM PIC 9(2).
            10 SPA PIC X VALUE SPACE.
            10 NAME PIC X(10).
            10 POINT PIC 9(3).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
        INPUT_PART.
            MOVE 1 TO NUM(1).
            MOVE 2 TO NUM(2).
            MOVE 3 TO NUM(3).
            MOVE "TANAKA" TO NAME(1).
            MOVE "NOZOMI" TO NAME(2).
            MOVE "SUZUKI" TO NAME(3).
            MOVE 75 TO POINT(1).
            MOVE 65 TO POINT(2).
            MOVE 100 TO POINT(3).
        OUTPUT_PART.
            DISPLAY "NUMBER INPUT".
            ACCEPT CONSOLE_INPUT FROM CONSOLE.
            DISPLAY STUDENT(CONSOLE_INPUT).
            STOP RUN.
*>3人の生徒情報について、表を作成する
*>それぞれの生徒のナンバー、名前、ポイントのデータ項目を用意する
*>データ項目にデータを入力する
*>情報を知りたい生徒のナンバーを入力すると、該当の生徒の情報が表示される
*>データ項目 OCCURS 値 INDEXED BY 字.
*>値の分だけ、同じ内容のデータ項目を設定する