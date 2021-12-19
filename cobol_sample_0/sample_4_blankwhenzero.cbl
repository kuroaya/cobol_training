*>BLANK WHEN ZERO データ項目に転記した値がゼロのときに、そこをスペースにすることができる
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_4_BLANKWHENZERO.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 データ_1 PIC 9(5).
        01 データ_2 PIC 9(5) BLANK WHEN ZERO.
PROCEDURE DIVISION.
    MAIN SECTION.
        BLANKZERO.
            MOVE 1234 TO データ_1 データ_2.
            DISPLAY データ_1 " , " データ_2.
            MOVE ZERO TO データ_1 データ_2.
            DISPLAY データ_1 " , " データ_2.
            STOP RUN.
*>データ項目 BLANK WHEN ZERO.
*>データ項目にゼロを転記したとき、そこがスペースになる