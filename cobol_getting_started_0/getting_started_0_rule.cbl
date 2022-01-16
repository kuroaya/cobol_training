*>COBOLの書き方とルール
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_0_RULE.
ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 WORK-AREA.
            05 WORK_GROUP.
                10 WORK_NUM_1 PIC 9(3).
                10 WORK_NUM_2 PIC 9(3).
                10 WORK_SUM PIC 9(3).
                10 WORK_SUB PIC 9(3).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    CONFIG_PART.
        MOVE 100 TO WORK_NUM_1.
        MOVE 200 TO WORK_NUM_2.
        MOVE 300 TO WORK_SUB.
    EXE_PART.
        ADD WORK_NUM_1 WORK_NUM_2 TO WORK_SUM.
        SUBTRACT WORK_NUM_1 FROM WORK_SUB.
    OUTPUT_PART.
        DISPLAY "ADD:"WORK_SUM.
        DISPLAY "SUB:"WORK_SUB.
    END_PART.
        STOP RUN.
*>IDENTIFICATION DIBISION
*>見出し部 プログラムを識別するための部
*>PROGRAM-ID プログラム名
*>作成するプログラムの名前
*>ENVIRONMENT DIVISION.
*>環境部
*>CONFIGURATION SECTION
*>構成節 プログラムを適用するコンピュータ名や、環境変数などの情報の定義を行う
*>INPUT-OUTPUT SECTION
*>入出力節 プログラムファイルを使用する場合に記述する
*>DATA DIVISION
*>データ部 主にプログラムで使用するデータ項目や、ファイルのレコードの宣言を行う
*>FILE SECTION
*>ファイル節
*>WORKING-STORAGE SECTION
*>作業場所節
*>LINKAGE SECTION
*>連絡節
*>COMMUNICATION SECTION
*>通信節
*>PROCEDURE DIVISION
*>手続き部 各種処理を宣言したり、実行される手続きやエラーになった場合の処理内容を記述する
*>STOP文を記述すれば、プログラムを終了できる
