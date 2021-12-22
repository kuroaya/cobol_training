*>IF もし~ならば~する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_6_IF.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 STRING_0 PIC X(5).
        01 RESULT_0 PIC 9(5).
PROCEDURE DIVISION.
    MAIN SECTION.
    EXAMPLE.
        ACCEPT STRING_0.
            IF STRING_0 = N"IF"
                THEN
                    MOVE 12345 TO RESULT_0;
                ELSE
                    MOVE 99999 TO RESULT_0;
            END-IF.
            DISPLAY RESULT_0.
            STOP RUN.
*>IF 条件
*>判断基準を記述する
*>THEN
*>条件に合致した場合の処理を記述する
*>ELSE
*>合致しなかった場合の処理を記述する
*>END-IF.
*>処理の終了を宣言する