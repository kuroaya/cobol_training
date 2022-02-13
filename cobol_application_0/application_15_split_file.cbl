*>ファイル分割の応用
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_15_SPLIT_FILE.
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
        05 IN01_JCODE PIC X(07).
        05 IN01_JNAME PIC X(10).
        05 IN01_KINZOKU PIC 99.
        05 IN01_NDATE PIC X(08).
    FD OUT01_FILE.
    01 OUT01.
        05 OUT01_JCODE PIC X(07).
        05 OUT01_JNAME PIC X(10).
        05 OUT01_KINZOKU PIC 99.
        05 OUT01_NDATE PIC X(08).
    FD OUT02_FILE.
    01 OUT02.
        05 OUT02_JCODE PIC X(07).
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
PROCEDURE DIVISION.
    *>初期処理 ファイルオープン
    OPEN INPUT IN01_FILE.
    OPEN OUTPUT OUT01_FILE.
    OPEN OUTPUT OUT02_FILE.
    *>主処理 ファイル読み込み処理、ファイル分割処理
    PERFORM UNTIL IN_FILE_STATUS NOT = "00"
        READ IN01_FILE
            AT END 
                DISPLAY "READ END"
            NOT AT END 
                MOVE IN01 TO OUT01 
                IF IN01_KINZOKU = ZERO 
                    THEN
                        MOVE "20190401" TO OUT01_NDATE
                        WRITE OUT01
                        MOVE IN01_JCODE TO OUT02_JCODE
                        WRITE OUT02 
                    ELSE
                        ADD 1 TO OUT01_KINZOKU
                        WRITE OUT01
                    
                END-IF
        END-READ
    END-PERFORM.
    *>終了処理 ファイルクローズ
        CLOSE IN01_FILE.
        CLOSE OUT01_FILE.
        CLOSE OUT02_FILE.
        
        STOP RUN.
*>条件に従い、入力ファイルを加工した結果と、入力ファイルからデータを抜き出した
*>結果の2つに分けてファイルを出力している

