*>SUBROUTINE 一連の処理の塊を定義する
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_11_SUBROUTINE.
DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
        01 WORKING-AREA.
            05 CONSOLE_INPUT PIC X(1).
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
    INITIALIZE_PART.
        MOVE SPACE TO CONSOLE_INPUT.
    EXEC_INPUT_PROC.
        DISPLAY "PLEASE INPUT.".
        ACCEPT CONSOLE_INPUT FROM CONSOLE.
        IF (CONSOLE_INPUT >= 1) AND
            (CONSOLE_INPUT <= 5)
                THEN
                    PERFORM EXEC_DISPLAY_PROC;
                ELSE
                    DISPLAY "NOTHING";
                    STOP RUN;
        END-IF.
        STOP RUN.
    EXEC_DISPLAY_PROC.
        EVALUATE CONSOLE_INPUT
            WHEN 1
                DISPLAY "ORANGE";
            WHEN 2
                DISPLAY "APPLE";
            WHEN 3
                DISPLAY "BANANA";
            WHEN 4
                DISPLAY "SUIKA";
            WHEN 5
                DISPLAY "MELLON";
        END-EVALUATE.
        EXIT.
*>処理ブロックをサブルーチン化して、PERFORM文を使用して呼び出すことができる   
