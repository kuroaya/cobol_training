*>CORRESPONDING 集団項目を転記する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_1_CORRESPONDING.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 原宿.
            05 品物 PIC X(5) VALUE "RADIO".
            05 値段 PIC 9(5) VALUE 999.
        01 代々木.
            05 値段 PIC 9(5) VALUE 10000.
            05 品物 PIC X(5) VALUE "TV".
            05 店員 PIC N(5) VALUE N"田中".
PROCEDURE DIVISION.
    MAIN SECTION.
        初期表示.
            DISPLAY 原宿 "," 代々木.
        集団項目に対応する.
            MOVE CORRESPONDING 原宿 TO 代々木.
            DISPLAY 原宿 "," 代々木.
            STOP RUN.
*>MOVE CORRESPONDING 集団項目_1 TO 集団項目_2.
*>集団項目_1を集団項目_2に転記する
*>両集団項目中に共通する基本項目が転記の対象となる
