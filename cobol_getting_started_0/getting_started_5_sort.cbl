*>SORT文 データを並び替える
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_5_SORT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN-FILE ASSIGN TO "File1"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT ST-FILE ASSIGN TO "File2".
        SELECT OUT-FILE ASSIGN TO "File3"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN-FILE.
            01 IN-REC.
                05 IN-SHOHIN-CODE PIC 9(003).
                05 IN-SHOHIN-MEI PIC X(010).
                05 IN-SHOHIN-KAKAKU PIC 9(004).
        SD ST-FILE.
            01 ST-REC.
                05 ST-SHOHIN-CODE PIC 9(003).
                05 ST-SHOHIN-MEI PIC X(010).
                05 ST-SHOHIN-KAKAKU PIC 9(004).
        FD OUT-FILE.
            01 OUT-REC.
                05 OUT-SHOHIN-CODE PIC 9(003).
                05 OUT-SHOHIN-MEI PIC X(010).
                05 OUT-SHOHIN-KAKAKU PIC 9(004).
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
        DISPLAY "START".
        SORT ST-FILE
            ON ASCENDING KEY ST-SHOHIN-CODE
            USING IN-FILE
            GIVING OUT-FILE.
        DISPLAY "GOAL".
        STOP RUN.
*>SORTでは、整列併合用ファイルというSORT文が一時的に使用するファイルの定義を行う必要がある
*>1.入力ファイルを読み込む
*>2.整列併合用ファイルを使用してソートを行う
*>3.出力ファイルにソート結果を出力する
*>EIVIRONMENT DIVISIONのFILE-CONTROLにファイルの属性を定義する
*>DATA DIVISIONのFILE SECTIONにレコードのレイアウトを定義する
*>PROCEDURE DIVISIONのSORT文に処理を記述して実行する
*>SELECT ファイル名 ASSIGN TO データ名
*>ファイル名 プログラムで整列併合用ファイルを使用して、ソート処理を行うときに使用するファイル名を記述する
*>データ名 整列併合用ファイルを指定する
*>SD ファイル名
*>ENVIRONMENT DIVISIONのFILE-CONTROLに定義した整列併合用ファイル名を記述する
*>SORT 整列併合用ファイル名
*>整列併合用ファイル名を記述する
*>ソートキー
*>ソートに使用するキーを記述する
*>ON ASCENDING KEY 項目名 昇順にソートを実行する
*>ON DESCENDING KEY 項目名 降順にソートを実行する
*>USING 入力ファイル名
*>入力ファイルを記述する
*>GIVING 出力ファイル名
*>出力ファイルを記述する

