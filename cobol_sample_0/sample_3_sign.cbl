*>SIGN 数値属性のデータ項目に符号を格納する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_3_SIGN.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 数値_1 PIC S9(5).
        01 数値_2 PIC S9(5) SIGN IS LEADING.
        01 数値_3 PIC S9(5) SIGN IS TRAILING.
        01 数値_4 PIC S9(5) SIGN LEADING SEPARATE.
PROCEDURE DIVISION.
    MAIN SECTION.
        符号付き転記.
            MOVE 12345 TO 数値_1 数値_2 数値_3 数値_4.
            DISPLAY 数値_1 " , " 数値_2 " , " 数値_3 " , " 数値_4.
            STOP RUN.
*>SIGN IS LEADING.
*>指定したデータ項目の左側に符号を格納する
*>SIGN IS TRAILING.
*>指定したデータ項目の右側に符号を格納する
*>DISPLAY命令で上記を実行すると、符号は左側に表示される