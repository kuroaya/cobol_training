*>表の各データ項目に初期値を与える
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_16_INITIAL_VALUE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    01 ENGLISH VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
        05 ALPHABET_DATA PIC X OCCURS 26.
    01 COUNT_DATA PIC 9(2) VALUE 1.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    OUTPUT_PART.
        PERFORM UNTIL COUNT_DATA > 26
            DISPLAY ALPHABET_DATA(COUNT_DATA);
            ADD 1 TO COUNT_DATA;
        END-PERFORM.
        STOP RUN.
*>集団項目にVALUE句によって初期値を設定する
*>集団項目に属する基本項目に、以下の構文でその初期値を与えることができる
*>データ項目 PIC 構造 OCCURS レコード数