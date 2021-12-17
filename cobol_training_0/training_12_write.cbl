*>ファイルに書き込む
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAINIG_12_OUTPUT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT OUT_FILE ASSIGN TO "FILE1.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD OUT_FILE.
            01 OUT_FILE_RECORD PIC 99.
    WORKING-STORAGE SECTION.
        01 LINE_COUNT PIC 99 VALUE 0.
PROCEDURE DIVISION.
    MAIN SECTION.
        OPEN OUTPUT OUT_FILE.
        PERFORM 10 TIMES
            ADD 1 TO LINE_COUNT
            MOVE LINE_COUNT TO OUT_FILE_RECORD
            WRITE OUT_FILE_RECORD
            DISPLAY OUT_FILE_RECORD
        END-PERFORM.
        CLOSE OUT_FILE.
        STOP RUN.
*>ENVIRONMENT 環境部 使用する実機の特性によって定まる性質を入力する
*>INPUT-OUTPUT SECTION 入出力節 省略可能 外部媒体とプログラム間でのデータ転送、および処理に必要な情報を入力する
*>SELECT ファイル名を指定したり、ファイルの属性やステータスを定義するときに使う
*>SELECT ファイル名項目 ASSIGN TO データ名
*>ファイル名項目に、プログラムで使用するファイル名と、関連付けられたファイル項目を指定する
*>ORGANIZATION IS LINE SEQUENTIAL ファイルを行順ファイルとして定義する 改行する
*>FILE SECTION ファイル節 データファイルの構造を定義する
*>FD ファイルの記述を行う 環境部のINPUT-OUTPUT SECTIONに記述したSELECT句のファイルに対応するモノを記述する
*>OPEN ファイルを開く
*>INPUT 入力用
*>OUTPUT 出力用
*>I-O 入出力用
*>EXTEND 拡張用 順呼び出しの時にのみ使用可能
*>READ ファイルからレコードを読み込む
*>WRITE データを書き込む
*>REWRITE データを置き換える
*>CLOSE ファイルを閉じる
