*>FUNCTION句 組み込み関数を使用する
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_15_FUNCITION.
DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
        01 WORKING_AREA.
            05 GENZAI_DATE.
                10 YY PIC X(4).
                10 MM PIC X(2).
                10 DD PIC X(2).
                10 HH PIC X(2).
                10 MI PIC X(2).
                10 SS PIC X(2).
                10 ETC PIC X(2).
            05 DSP_BUF PIC X(128).
PROCEDURE DIVISION.
    MAIN_PROCEDURE SECTION.
    INPUT_DATE.
        MOVE FUNCTION CURRENT-DATE TO GENZAI_DATE.
    DISPLAY_PROCEDURE.
        STRING "DATE:" YY "年" MM "月" DD "日" HH "時" MI "分"
            DELIMITED BY SPACE
            INTO DSP_BUF.
        DISPLAY DSP_BUF.
    END_PROCEDURE.
        STOP RUN.
*>FUNCTION 組込み関数 パラメータ
*>指定した組み込み関数を呼び出す
*>CURRENT-DATE 現在時刻を取得して表示するプログラム
