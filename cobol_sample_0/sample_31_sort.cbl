*>SORT文 データの並び替えを行う
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_31_SORT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT HUMAN_RESOURCE_FILE ASSIGN TO "File1".
        SELECT RESULT_FILE ASSIGN TO "File2".
        SELECT SORT_FILE ASSIGN TO "File3".
DATA DIVISION.
    FILE SECTION.
        FD HUMAN_RESOURCE_FILE.
            01 HUMAN_RECORD.
                05 EMPLOYEE_CODE PIC X(5).
                05 BELONGS_CODE PIC X(3).
                05 NAME_CODE PIC X(10).
                05 HURIGANA_CODE PIC X(20).
        FD RESULT_FILE.
            01 RESULT_RECORD PIC X(38).
        SD SORT_FILE.
            01 SORT_RECORD.
                05 ITEM_A PIC X(5).
                05 BERONGS PIC X(3).
                05 ITEM_B PIC X(10).
                05 NAME_FURIGANA PIC X(20).
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    SORT_PART.
        SORT SORT_FILE
            ASCENDING HURIGANA_CODE
            DESCENDING BERONGS
            USING HUMAN_RESOURCE_FILE
            GIVING RESULT_FILE.
        END_PART.
            STOP RUN.
*>SELECT ファイル名 ASSIGN TO 対象ファイル.
*>SORTで使用する対象ファイルのファイル名を「ファイル名」によって宣言する
*>SORT ファイル名
*>SORTしたいファイル名を指定する
*>ASCENDING
*>昇順
*>DESCENDING
*>降順
*>USING ファイル名
*>入力ファイルを指定する
*>GIVING ファイル名
*>出力ファイルを指定する