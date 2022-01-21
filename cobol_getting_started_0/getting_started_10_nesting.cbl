*>NESTING 入れ子構造
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_10_NESTING.
DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
        01 WORKING-AREA.
            05 CONSOLE-INPUT PIC X(1).
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
    INITIALIZE_PART.
        MOVE SPACE TO CONSOLE-INPUT.
    EXEC_DISPLAY_INPUT_PROC.
        DISPLAY "PLEASE INPUT".
        ACCEPT CONSOLE-INPUT FROM CONSOLE.
        IF (CONSOLE-INPUT >= 1) AND
            (CONSOLE-INPUT <= 5)
                THEN
                    EVALUATE CONSOLE-INPUT
                        WHEN 1
                            DISPLAY "ORANGE"
                        WHEN 2
                            DISPLAY "APPLE"
                        WHEN 3
                            DISPLAY "BANANA"
                        WHEN 4
                            DISPLAY "SUIKA"
                        WHEN 5
                            DISPLAY "MELLON"
                    END-EVALUATE
                ELSE
                    DISPLAY "NOTHING"
                    GO TO EXEC_DISPLAY_INPUT_PROC
        END-IF.
    END_PART.
        STOP RUN.
*>処理の中に処理を設定することができる
        