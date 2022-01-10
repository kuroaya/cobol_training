*>PRINT プリンタへの印字
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_30_PRINT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT DATA_FILE ASSIGN TO "File1"
            FILE STATUS IS DATA_STATUS.
        SELECT PRINT_FILE ASSIGN TO "PRINTER"
            FILE STATUS IS PRINT_STATUS.
DATA DIVISION.
    FILE SECTION.
    FD DATA_FILE.
        01 DATA_RECORD.
            05 EMPLOYEE_DATA PIC X(5).
            05 BELONGS_DATA PIC X(3).
            05 NAME_DATA PIC X(10).
        FD PRINT_FILE.
        01 PRINT_RECORD PIC X(22).
    WORKING-STORAGE SECTION.
        01 STATUS_D.
            05 DATA_STATUS PIC XX.
            05 PRINT_STATUS PIC XX.
        01 TITLE.
            05 PIC X(5) VALUE ALL "*".
            05 PIC X(15) VALUE "PRINT RESULT".
            05 PIC X(5) VALUE ALL "*".
        01 DETAIL_D.
            05 EMPLOYEE_DATA PIC X(5).
            05 PIC X(2).
            05 BELONGS_DATA PIC X(3).
            05 PIC X(2).
            05 NAME_DATA PIC X(10).
        01 JUDGEMENT PIC X.
            88 KEEP VALUE "1".
            88 FINISH VALUE "2".
        01 NUM PIC 99.
            88 EXE VALUE ZERO.
            88 NEW VALUE 10.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INITIALIZE_PART.
        OPEN INPUT DATA_FILE.
        OPEN OUTPUT PRINT_FILE.
        IF "00" NOT = DATA_STATUS OR PRINT_STATUS
            THEN
                CONTINUE;
            ELSE
                SET KEEP NEW TO TRUE;
                PERFORM PRINT_PROCESS THRU END_PROCESS;
        END-IF.
    PROGRAM_END.
        STOP RUN.
    PRINT_PROCESS.
        PERFORM UNTIL FINISH
            READ DATA_FILE
                AT END 
                    SET FINISH TO TRUE;
                NOT AT END 
                    IF NEW
                        THEN
                            WRITE PRINT_RECORD FROM TITLE AFTER PAGE
                            END-WRITE;
                            SET EXE TO TRUE;
                        ELSE
                            CONTINUE;
                    END-IF
                    INITIALIZE DETAIL_D;
                    MOVE CORR DATA_RECORD TO DETAIL_D;
                    WRITE PRINT_RECORD FROM DETAIL_D AFTER 2 LINE
                    END-WRITE
                    ADD 1 TO NUM;
            END-READ
        END-PERFORM.
    END_PROCESS.
        CLOSE PRINT_FILE.
        CLOSE DATA_FILE.
*>ASSIGN TO プリンタ名
*>使用するプリンタ名を指定する
*>WRITE レコード
*>プリンタに印刷するということは、出力をするということなので、WRITE文を使用する
*>ADVANCING
*>行送り、またはページ送りの設定を指定する
*>BEFORE/AFTER
*>行送りする前/した後に、WRITE(印字)する
*>LINE
*>行送りを指定する
*>PAGE
*>ページ送りを指定する
*>AT END-OF-PAGE
*>ページ終了条件が成立したときの処理を記述する
*>NOT AT END-OF-PAGE
*>ページ終了条件が成立しないときの処理を記述する