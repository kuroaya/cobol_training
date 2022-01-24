*>COMENT コメントを記述する
*>-----------------------------
*>プログラム名 ファイル入出力処理サンプル
*>プログラムID GETTING_STARTED_17_COMENT
*>バージョン 1.0.0
*>作成日        作成者
*>2022/01/24    YUUTARO ODA
*>更新日        更新者      更新概要
*>YYYY/MM/DD    XXXXXXX     XXXXXXX
*>-----------------------------
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_17_COMENT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT OUT01_FILE
            ASSIGN TO "File2"
            ORGANIZATION IS LINE SEQUENTIAL.
*>-----------------------------
*>データ部
*>-----------------------------
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN_KOUMOKU1 PIC X(12).
        FD OUT01_FILE.
        01 OUT01.
            05 OUT_KOUMOKU1 PIC X(12).
*>-----------------------------
*>作業場所節
*>-----------------------------
    WORKING-STORAGE SECTION.
        01 SAMPLE_DATA.
            05 KOUMOKU1 PIC X(12) VALUE "Hello Cobol".
*>-----------------------------
*>手続き部
*>-----------------------------   
PROCEDURE DIVISION.
    SAMPLE_RTN SECTION.
*>初期処理
        PERFORM INIT_RTN.
*>主処理
        PERFORM MAIN_RTN.
*>終了処理
        PERFORM END_RTN.
        STOP RUN.
    SAMPLE_EXIT.
*>-----------------------------
*>初期処理
*>-----------------------------    
    INIT_RTN SECTION.
        OPEN INPUT IN01_FILE.
        OPEN OUTPUT OUT01_FILE.
        PERFORM READ01_RTN.
    INIT-EXIT.
*>-----------------------------
*>ファイル読込処理
*>-----------------------------   
    READ01_RTN SECTION.
        READ IN01_FILE
            AT END 
                GO TO READ01-EXIT
        END-READ.
    READ01-EXIT.
*>-----------------------------
*>主処理
*>----------------------------- 
    MAIN_RTN SECTION.
        MOVE KOUMOKU1 TO OUT_KOUMOKU1.
        PERFORM WRITE01_RTN.
        DISPLAY "ファイル出力完了".
    MAIN-EXIT.
*>-----------------------------
*>ファイル出力処理
*>-----------------------------    
    WRITE01_RTN SECTION.
        WRITE OUT01.
    WRITE01-EXIT.
*>-----------------------------
*>終了処理
*>-----------------------------
    END_RTN SECTION.
        CLOSE IN01_FILE.
        CLOSE OUT01_FILE.
    END-EXIT.
*>*>を記述することで、後に記述した文字列がコメントとなる