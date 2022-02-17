IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_18_MATCHING.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT IN02_FILE
            ASSIGN TO "File2.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT OUT01_FILE
            ASSIGN TO "File3.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT OUT02_FILE
            ASSIGN TO "File4.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN01_KEY PIC X(04).
            05 IN01_SUJI PIC 99.
        FD IN02_FILE.
        01 IN02.
            05 IN02_KEY PIC X(04).
        FD OUT01_FILE.
        01 OUT01.
            05 OUT01_KEY PIC X(04).
            05 OUT01_SUJI PIC 99.
        FD OUT02_FILE.
        01 OUT02.
            05 OUT02_KEY PIC X(04).
            05 OUT02_SUJI PIC 99.
    WORKING-STORAGE SECTION.
        01 SW_AREA.
            05 SW_IN01_END PIC X(01).
        01 CST_AREA.
            05 CST_1X PIC X(01) VALUE '1'.
PROCEDURE DIVISION.
    MATCH_RTN SECTION.
    *>初期処理
        PERFORM INIT_RTN.
    *>主処理
        PERFORM MAIN_RTN
            UNTIL SW_IN01_END = CST_1X.
    *>終了処理
        PERFORM END_RTN.
        STOP RUN.
    MATCH_EXIT.
    *>1.初期処理(ファイルオープン)
    INIT_RTN SECTION.
        OPEN INPUT IN01_FILE.
        OPEN INPUT IN02_FILE.
        OPEN OUTPUT OUT01_FILE.
        OPEN OUTPUT OUT02_FILE.
        PERFORM READ01_RTN.
        PERFORM READ02_RTN.
    INIT_EXIT.
    *>2.ファイル読み込み処理(IN01)
    READ01_RTN SECTION.
    *>入力ファイルREAD
        READ IN01_FILE AT END 
            DISPLAY "READ IN01 END"
            MOVE CST_1X TO SW_IN01_END
            GO TO READ01-EXIT
        END-READ.
    READ01-EXIT.
    *>3.ファイル読み込み処理(IN02)
    READ02_RTN SECTION.
    *>入力ファイルREAD
        READ IN02_FILE AT END 
            DISPLAY "READ IN02 END"
            MOVE HIGH-VALUE TO IN02_KEY
            GO TO READ02-EXIT
        END-READ.
    READ02-EXIT.  
    *>4.主処理(マッチング処理)
    MAIN_RTN SECTION.
        IF IN01_KEY = IN02_KEY
            THEN
                MOVE IN01 TO OUT01
                WRITE OUT01
                PERFORM READ01_RTN
            ELSE
                IF IN01_KEY < IN02_KEY
                    MOVE IN01 TO OUT02
                    WRITE OUT02
                    PERFORM READ01_RTN
                END-IF
                IF IN01_KEY > IN02_KEY
                    PERFORM READ02_RTN
                END-IF
        END-IF.
    MAIN-EXIT.
    *>5.終了処理(ファイルクローズ)
    END_RTN SECTION.
        CLOSE IN01_FILE.
        CLOSE IN02_FILE.
        CLOSE OUT01_FILE.
        CLOSE OUT02_FILE.
    END-EXIT.
