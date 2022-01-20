*>WRITE文 レコードを書き込む
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_7_WRITE.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT SAMPLE_FILE ASSIGN TO "File1"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS IN_FILE_STATUS.
DATA DIVISION.
    FILE SECTION.
        FD SAMPLE_FILE.
            01 OUT_FILE_REC PIC X(50).
            01 IN_FILE_REC PIC X(50).
        WORKING-STORAGE SECTION.
            01 IN_FILE_STATUS PIC XX.
            01 ITEM PIC X(50).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    WRITE_PART.
        OPEN OUTPUT SAMPLE_FILE.
        DISPLAY "WRITE".
        PERFORM UNTIL ITEM = "99"
            DISPLAY "PLEASE INPUT " WITH NO ADVANCING
            ACCEPT ITEM
            IF ITEM = "99"
                THEN
                    MOVE ITEM TO OUT_FILE_REC;
                    WRITE OUT_FILE_REC;
                    DISPLAY "WRITE:"OUT_FILE_REC
                ELSE
                    DISPLAY "NOT 99";
                    STOP RUN;
            END-IF
        END-PERFORM.
        CLOSE SAMPLE_FILE.
    READ_PART.
        OPEN INPUT SAMPLE_FILE.
        DISPLAY "READ".
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ SAMPLE_FILE
                AT END
                    DISPLAY "READ END";
                NOT AT END
                    DISPLAY "READ:"IN_FILE_REC;
            END-READ
        END-PERFORM.
        CLOSE SAMPLE_FILE.
        STOP RUN.
*>WRITE データ項目
*>データを書き込む
