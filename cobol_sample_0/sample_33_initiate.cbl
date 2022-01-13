*>INITIATE文　報告書機能を使う
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_33_INITIATE.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT OFFICE_FILE ASSIGN TO "File1"
            FILE STATUS IS OFFICE_STATUS.
        SELECT REPORT_FILE ASSIGN TO "PRINTER"
            FILE STATUS IS REPORT_STATUS.
DATA DIVISION.
    FILE SECTION.
        FD OFFICE_FILE.
        01 OFFICE_RECORD.
            05 NAME_DATA PIC X(4).
            05 PRODUCT_DATA PIC X(10).
            05 EARNINGS_TIME.
                10 EARNINGS_MONTH PIC 99.
                10 EARNINGS_DAY PIC 99.
            05 AMOUNT_OF_MONEY PIC 9(5).
        FD REPORT_FILE RECORD CONTAINS 80 REPORT IS OFFICE_AMOUNT.
    WORKING-STORAGE SECTION.
        01 STATUS_DATA.
            05 OFFICE_STATUS PIC XX.
            05 REPORT_STATUS PIC XX.
        01 JUDGE PIC X.
            88 CONTINUE_EXE VALUE "1".
            88 END_EXE VALUE "2".
        01 YEAR_CONFIG.
            05 YEAR PIC 9(4) VALUE 2013.
            05 SEIREKI PIC 9(4) VALUE 2013.
            05 MONTH_DATA PIC 99 VALUE 9.
            05 DAY_DATA PIC 99 VALUE 30.
    REPORT SECTION.
        RD OFFICE_AMOUNT PAGE LIMIT 60
            FIRST DETAIL 6
            LAST DETAIL 58.
        01 TYPE RH NEXT GROUP NEXT PAGE.
            05 LINE 15.
                10 COLUMN 37 PIC 9(4) SOURCE YEAR.
                10 COLUMN 41 PIC X(4) VALUE "YEAR".
            05 LINE 18.
                10 COLUMN 32 PIC X(10) VALUE "LIST".
            05 LINE 40.
                10 COLUMN 33 PIC 9(4) SOURCE SEIREKI.
                10 COLUMN 37 PIC X(4) VALUE "YEAR".
                10 COLUMN 39 PIC 9(2) SOURCE MONTH_DATA.
                10 COLUMN 41 PIC X(5) VALUE "MONTH".
                10 COLUMN 43 PIC 9(2) SOURCE DAY_DATA.
                10 COLUMN 45 PIC X(3) VALUE "DAY".
            05 LINE 58.
                10 COLUMN 37 PIC X(4) VALUE "PAGE".
                10 COLUMN 43 PIC ZZ9 SOURCE PAGE-COUNTER.
        01 TYPE PH.
            05 LINE 3.
                10 COLUMN 10 PIC X(10) VALUE "OFFICE".
                10 COLUMN 20 PIC X(10) VALUE "PRODUCT".
                10 COLUMN 40 PIC X(5) VALUE "DATE".
                10 COLUMN 60 PIC X(10) VALUE "AMOUNT".
        01 TYPE PF.
            05 LINE 60.
                10 COLUMN 37 PIC X(4) VALUE "PAGE".
                10 COLUMN 43 PIC ZZ9 SOURCE PAGE-COUNTER.
        01 EARNINGS_DATA TYPE DE.
            05 LINE PLUS 1.
                10 COLUMN 10 PIC X(4) SOURCE NAME_DATA.
                10 COLUMN 20 PIC X(10) SOURCE PRODUCT_DATA.
                10 COLUMN 40 PIC Z9 SOURCE EARNINGS_MONTH.
                10 COLUMN 42 PIC X(1) VALUE "/".
                10 COLUMN 43 PIC Z9 SOURCE EARNINGS_DAY.
                10 COLUMN 60 PIC 9(5) SOURCE AMOUNT_OF_MONEY.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INITIALIZE_PART.
        OPEN INPUT OFFICE_FILE.
        OPEN OUTPUT REPORT_FILE.
        IF "00" NOT = OFFICE_STATUS OR REPORT_STATUS
            THEN
                DISPLAY "OPEN ERROR";
            ELSE
                SET CONTINUE_EXE TO TRUE;
                INITIATE OFFICE_AMOUNT;
                PERFORM REPORT_PART THRU END_PART;
        END-IF.
    PROGRAM_END.
        STOP RUN.
    REPORT_PART.
        PERFORM UNTIL END_EXE
            READ REPORT_FILE
                AT END
                    SET END_EXE TO TRUE;
                NOT AT END 
                    GENERATE EARNINGS_DATA;
            END-READ
        END-PERFORM.
    END_PART.
        TERMINATE OFFICE_AMOUNT.
        CLOSE REPORT_FILE.
        CLOSE OFFICE_FILE.
*>SELECT ファイル名 ASSIGN TO プリンター名 FILE STATUS IS ファイル状態.
*>環境部 報告書は、印字をするための機能なので、プリント対象のファイルを指定する
*>FD ファイル名
*>SELECT句で宣言したファイルを、ファイル名とする
*>FD ファイル RECORD CONTAINS 整数 REPORT IS 報告書名.
*>報告書を指定
*>RD 報告書名
*>FDで指定されたファイル名を設定する
*>RD 報告書名 PAGE LIMIT 整数
*>各報告書集団がページ内の出現位置を行位置で指定する
*>HEADING 整数
*>報告書頭書き、ページ頭書きの印刷行の上限を指定する
*>FIRST DETAIL 整数
*>報告書の本文の最初の印刷行の上限を指定する
*>LAST DETAIL 整数
*>報告書の本文の最後の印刷行の下限を指定する
*>FOOTING 整数
*>制御脚書きにおける最後の印刷行の下限を指定する
*>RH
*>REPORT HEADING 報告書頭書き
*>PH
*>PAGE HEADING ページ頭書き
*>CH
*>CONTROL HEADING 制御頭書き
*>DE
*>DETAIL 明細
*>CF
*>CONTROL FOOTING 制御脚書き
*>PF
*>PAGE FOOTING ページ脚書き
*>RF
*>REPORT FOOTING 報告書脚書き
*>INITIATE 報告書名
*>報告書の処理を開始する
*>GENERATE データ名 OR 報告書名
*>報告書を作成するための文
*>TERMINATE 報告書名
*>報告書の処理を終了するための文
