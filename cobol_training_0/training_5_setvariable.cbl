*>集合項目の使用方法
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAINING_5_SETVARIABLES.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 MY_DATA.
            03 DATA_NAME PIC X(10).
            03 FILLER PIC X(10).
            03 DATA_PRICE PIC 9(5).
PROCEDURE DIVISION.
    MAIN SECTION.
        MOVE "TANAKA" TO DATA_NAME.
        MOVE 9999 TO DATA_PRICE.
        DISPLAY DATA_NAME.
        DISPLAY DATA_PRICE.
        DISPLAY MY_DATA.
    STOP RUN.
*>基本項目 これ以上の分割ができないデータ
*>集団項目 基本の項目を集めたデータ 基本項目と親と子の関係にある
*>FILLER 明示的に参照しないデータ項目 後の使用に備えたデータ項目