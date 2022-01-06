*>INSPECT分のREPLACING指定
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_24_REPLACING.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    01 REPLACING_DATA PIC X(5).
PROCEDURE DIVISION.
    MAIN_PART.
    CHARACTERS_SPECIFY.
        MOVE "XYZ" TO REPLACING_DATA.
        INSPECT REPLACING_DATA REPLACING 
            CHARACTERS BY "A"
            DISPLAY REPLACING_DATA.
            INITIALIZE REPLACING_DATA.
    ALL_SPECIFY.
        MOVE "ABCAB" TO REPLACING_DATA.
        INSPECT REPLACING_DATA REPLACING
            ALL "AB" BY "YZ".
            DISPLAY REPLACING_DATA.
            INITIALIZE REPLACING_DATA.
    FIRST_SPECIFY.
        MOVE "ABCAB" TO REPLACING_DATA.
        INSPECT REPLACING_DATA REPLACING
            FIRST "BC" BY "YZ".
            DISPLAY REPLACING_DATA.
            INITIALIZE REPLACING_DATA.
    MULTIPLY_SPECIFY.
        MOVE "ABCAB" TO REPLACING_DATA.
        INSPECT REPLACING_DATA REPLACING
            ALL "AB" BY "YZ" AFTER "C"
            LEADING "A" BY "X"
            FIRST "BC" BY "FG"
            CHARACTERS BY "*"
            DISPLAY REPLACING_DATA.
    END_PART.
        STOP RUN.
*>対象の文字列のうち、指定したものに該当する文字を置換する
*>INSPECT 対象データ REPLACING
*>置換対象のデータを指定する
*>CHARACTERS BY 置換文字.
*>対象データをすべて置換文字に置き換える。置換文字は1文字に限られる
*>ALL 指定文字 BY 置換文字.
*>対象データのうち指定文字の有無を検査され、該当したら置換文字に置き換える
*>指定文字と置換文字は同じ文字数でないといけない
*>FIRST 指定文字 BY 置換文字.
*>対象データを左端から検査して、最初に一致した指定文字を置換文字に置き換える
*>REPLACINGは、すべての対象データが置換の対象になるか、置き換え指定がなくなるまで実行される
