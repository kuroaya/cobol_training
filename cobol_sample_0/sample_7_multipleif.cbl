*>IF 多重分岐
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_7_MULTIPLEIF.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 STRING_0 PIC X(5).
        01 STRING_1 PIC XX.
        01 RESULT PIC 99.
PROCEDURE DIVISION.
    MAIN SECTION.
        ACCEPT STRING_0.
        ACCEPT STRING_1.
        MULTIPLE_BLANCH.
        IF STRING_0 = "MULTI"
            THEN
                IF STRING_1 = "OK"
                    THEN
                        MOVE 11 TO RESULT;
                    ELSE
                        IF STRING_1 = "NG"
                            THEN
                                MOVE 99 TO RESULT;
                            ELSE
                                CONTINUE;
                        END-IF
                END-IF
            ELSE
                CONTINUE;
        END-IF.
        DISPLAY RESULT.
        STOP RUN.
*>IF文の中にIF文を挿入することができる
