*>IS NUMERICレコード単位に持つ数字項目の値を加算していく
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_33_NUMERIC_2.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS IN_FILE_STATUS.
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN01_SUJI PIC 99.
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
        01 WK_SUM_SUJI PIC 999.
PROCEDURE DIVISION.
    INITIALIZE_EXE SECTION.
        OPEN INPUT IN01_FILE.
        READ IN01_FILE
            AT END
                DISPLAY "READ END";
            NOT AT END 
                IF (IN01_SUJI IS NUMERIC)
                    THEN
                        MOVE IN01_SUJI TO WK_SUM_SUJI;
                END-IF
        END-READ.
    MAIN_PROCEDURE SECTION.
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ IN01_FILE
                AT END 
                    DISPLAY "READ END"
                NOT AT END
                    IF (IN01_SUJI IS NUMERIC)
                        THEN
                            ADD IN01_SUJI TO WK_SUM_SUJI
                    END-IF
            END-READ
        END-PERFORM.
        DISPLAY "INPUT SUM"WK_SUM_SUJI".".
    END_PROCEDURE SECTION.
        CLOSE IN01_FILE.
        STOP RUN.

