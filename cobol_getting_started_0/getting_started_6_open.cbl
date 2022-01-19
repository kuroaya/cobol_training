*>OPEN文 ファイルを開く
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_6_OPEN.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT SAMPLE_FILE ASSIGN TO "File1"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS IN_FILE_STATUS.
DATA DIVISION.
    FILE SECTION.
        FD SAMPLE_FILE.
            01 IN_FILE_REC PIC X(10).
        WORKING-STORAGE SECTION.
            01 IN_FILE_STATUS PIC XX.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    OPEN_PART.
        OPEN INPUT SAMPLE_FILE.
    READ_PART.
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ SAMPLE_FILE
                AT END 
                    DISPLAY "READ END";
                NOT AT END
                    DISPLAY IN_FILE_REC;
            END-READ
        END-PERFORM.
    END_PART.
        CLOSE SAMPLE_FILE.
        STOP RUN.
*>INPUT-OUTPUT SECTION.
*>入出力節
*>FILE-CONTROL.
*>ファイルの管理段落
*>SELECT ファイル名 ASSIGN TO データ名
*>ファイル編成の宣言 データ名をファイル名に格納する
*>ORGANIZATION IS LINE SEQUENTIAL
*>ファイルがテキストファイルであることを指定する 各データは一行ずつ扱われる
*>FILE STATUS IS ステータス名.
*>指定したファイルの状態を格納する
*>FILE SECTION
*>ファイル節
*>FD ファイル名
*>ファイル記述項
*>OPEN モード ファイル名.
*>モードを指定してファイルを開く
*>READ
*>読み込み
*>WRITE
*>書き込み
*>REWRITE
*>更新
*>CLOSE
*>ファイルを閉じる

