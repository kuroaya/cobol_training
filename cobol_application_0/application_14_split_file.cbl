IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_14_SPLIT_FILE.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1.txt"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS IN_FILE_STATUS.
        SELECT OUT01_FILE
            ASSIGN TO "File2.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT OUT02_FILE
            ASSIGN TO "File3.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN01_SUJI PIC 99.
        FD OUT01_FILE.
        01 OUT01.
            05 OUT01_SUJI PIC 99.
        FD OUT02_FILE.
        01 OUT02.
            05 OUT02_SUJI PIC 99.
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
PROCEDURE DIVISION.
    *>初期処理 ファイルオープン
        OPEN INPUT IN01_FILE.
        OPEN OUTPUT OUT01_FILE.
        OPEN OUTPUT OUT02_FILE.
    *>主処理 ファイル読込処理、分割処理
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ IN01_FILE
                AT END
                    DISPLAY "READ END"
                NOT AT END
                    IF IN01_SUJI < 20
                        THEN
                            MOVE IN01_SUJI TO OUT01_SUJI
                            WRITE OUT01 
                        ELSE
                            MOVE IN01_SUJI TO OUT02_SUJI
                            WRITE OUT02 
                    END-IF
            END-READ
        END-PERFORM.
    *>終了処理 ファイルクローズ
        CLOSE IN01_FILE.
        CLOSE OUT01_FILE.
        CLOSE OUT02_FILE.
        
        STOP RUN.

