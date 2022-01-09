*>OPEN文 順ファイルをオープンする
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_28_OPENFILE.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT DATA_FILE ASSIGN TO "File1"
            FILE STATUS IS FILE_STATUS.
DATA DIVISION.
    FILE SECTION.
    FD DATA_FILE.
    01 DATA_RECORD.
        05 NUMBER_CODE PIC X(5).
        05 BELONGS_CODE PIC X(4).
        05 NAME_CODE PIC X(10).
    WORKING-STORAGE SECTION.
    01 FILE_STATUS PIC XX.
    01 JUDGE PIC X.
        88 CONTINUE_PROCESS VALUE "1".
        88 END_PROCESS VALUE "2".
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INITIALIZE_PART.
        OPEN INPUT DATA_FILE.
        SET CONTINUE_PROCESS TO TRUE.
        IF FILE_STATUS NOT = "00"
            THEN
                DISPLAY "NO OPEN";
                STOP RUN;
            ELSE
                CONTINUE;
        END-IF.
    READING_PART.
        PERFORM UNTIL END_PROCESS
            READ DATA_FILE
                AT END
                    SET END_PROCESS TO TRUE;
                NOT AT END
                    DISPLAY NUMBER_CODE "," BELONGS_CODE "," NAME_CODE;
            END-READ
        END-PERFORM.
    FILE_END_PART.
        CLOSE DATA_FILE.
    END_PART.
        STOP RUN.
*>File1
*>11111
*>AAA
*>TANAKA
*>OPEN INPUT
*>入力モード READ 可能
*>OPEN OUTPUT
*>出力モード WRITE 可能
*>OPEN I-O
*>入出力両用モード READ REWRITE 可能
*>OPEN EXTEND
*>拡張モード WRITE 可能
*>READ ファイル名
*>SELECT句で指定されたファイル名を記述する
*>INTO 一意名
*>レコードの読み込み後に、そのレコードの内容を転記する
*>AT END 無条件文1
*>ファイルから読み込むレコードがない場合に、制御が渡る
*>NOT AT END 無条件文2
*>ファイルからレコードを読み込んだ場合に、制御が渡る
*>END-READ
*>処理の終了
