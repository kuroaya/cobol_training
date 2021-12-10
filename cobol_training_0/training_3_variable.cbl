*>変数(データ項目)の設定方法
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAINING_3_VARIABLE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 DATA_1 PIC X(20).
PROCEDURE DIVISION.
    MAIN SECTION.
        MOVE "TRAINING VARIABLE." TO DATA_1.
        DISPLAY DATA_1.
        STOP RUN.
*>PIC 領域の意味 どのような領域を確保するのか指定する
*>PIC X(20) 任意の20文字
*>PIC 9(3) 符号なし数字20桁
*>PIC N(3) 日本語(全角)の3この文字
*>PIC S9(3) 符号付き数字3桁
*>PIC 9V99 符号なし数字3桁の上位1桁と2桁の間に仮想小数点が存在