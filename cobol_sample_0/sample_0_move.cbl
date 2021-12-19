*> MOVE データ項目にデータを転記する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_0_MOVE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 入力_1 PIC X(5) VALUE "ABCDE".
        01 入力_2 PIC 9(5) VALUE 12345.
        01 入力_3 PIC N(6) VALUE "日本語".
        01 出力_1 PIC X(5).
        01 出力_2 PIC 9(5).
        01 出力_3 PIC N(6).
PROCEDURE DIVISION.
    MAIN SECTION.
        入力.
            MOVE "VWXYZ" TO 出力_1.
            MOVE 67890 TO 出力_2.
            MOVE N"外国語" TO 出力_3.
            DISPLAY 出力_1 "," 出力_2 "," 出力_3.
        出力.
            MOVE 入力_1 TO 出力_1.
            MOVE 入力_2 TO 出力_2.
            MOVE 入力_3 TO 出力_3.
            DISPLAY 出力_1 "," 出力_2 "," 出力_3.
        初期化.
            INITIALIZE 出力_1 出力_2 出力_3.
            DISPLAY 出力_1 "," 出力_2 "," 出力_3.
            MOVE "ZZZ" TO 出力_1(3:3).
            DISPLAY 出力_1.
            STOP RUN.
*> MOVE データ TO データ項目
*>データ項目にデータを転記する
*>MOVE データ項目_1 TO データ項目_2
*>データ項目_2にデータ項目1を転記する
*>INITIALIZE データ項目の初期化を行う
*>英数字項目は空白
*>数字項目は0
*>日本語項目は全角空白に初期化される
*>MOVE データ TO データ項目(値1:値2)
*>データ項目の値1から値2分だけデータを転記する


