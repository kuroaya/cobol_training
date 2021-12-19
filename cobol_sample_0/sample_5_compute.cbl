*>COMPUTE 四則演算の基礎
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_5_COMPUTE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 値_1 PIC 9 VALUE 1.
        01 値_2 PIC 9 VALUE 2.
        01 値_3 PIC 9 VALUE 3.
        01 値_4 PIC 9 VALUE 4.
        01 答 PIC 9.
        01 R PIC 9.
PROCEDURE DIVISION.
    MAIN SECTION.
        計算.
*>足し算
            ADD 値_1 値_2 TO 値_3 GIVING 答.
            DISPLAY "ADD:"答.
            COMPUTE 答 = 値_1 + 値_2 + 値_3.
            DISPLAY "ADD:"答.
            ADD 値_1 値_2 GIVING 答 ROUNDED R.
            DISPLAY "ADD:"答 R.
            COMPUTE 答 ROUNDED R = 値_1 + 値_2.
            DISPLAY "ADD:"答 R.
*>引き算
            SUBTRACT 値_1 値_2 FROM 値_3.
            DISPLAY "SUBTRACT:"値_3.
            MOVE 3 TO 値_3.
            COMPUTE 答 = 値_3 - (値_1 + 値_2).
            DISPLAY "SUBTRACT:"答.
*>掛け算
            MULTIPLY 値_1 BY 値_2.
            DISPLAY "MULTIPLY:"値_2.
            COMPUTE 答 = 値_1 * 値_2.
            DISPLAY "MULTIPLY:"答.
            COMPUTE 値_2 = 値_1 * 値_2
            DISPLAY "MULTIPLY:"値_2.
*>割り算
            DIVIDE 値_2 INTO 値_4.
            DISPLAY "DIVIDE:"値_4.
            MOVE 4 TO 値_4.
            COMPUTE 値_4 = 値_4/値_2.
            DISPLAY "DIVIDE:"値_4.
            MOVE 4 TO 値_4.
            DIVIDE 値_4 BY 値_2 GIVING 答
            DISPLAY "DIVIDE:"答.
            COMPUTE 答 = 値_4/値_2.
            DISPLAY "DIVIDE:"答.
            STOP RUN.
*>足し算
*>ADD 値_1 値_2 TO 値_3 GIVING 値_4.
*>COMPUTE 値_4 = 値_1 + 値_2 + 値_3.
*>ADD 値_1 値_2 GIVING 値_3 ROUNDED 値_4.
*>COMPUTE 値_3 ROUNDED 値_4 = 値_1 + 値_2.
*>引き算
*>SUBTRACT 値_1 値_2 FROM 値_3.
*>COMPUTE 値_3 = 値_3 - (値_1 + 値_2).
*>掛け算
*>MULTIPLY 値_1 BY 値_2.
*>COMPUTE 値_2 = 値_1 * 値_2.
*>割り算
*>DIVIDE 値_1 INTO 値_2.
*>COMPUTE 値_2 = 値_2/値_1.
*>DIVIDE 値_1 BY 値_2 GIVING 値_3.
*>COMPUTE 値_3 = 値_1/値_2.


