*>FUNCTION ユーザー定義関数
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_2_FUNCTION.
ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
        REPOSITORY.
        FUNCTION FUNC.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 NUM PIC 99.
        01 MSG PIC 9.
PROCEDURE DIVISION.
    MOVE 10 TO NUM.
        COMPUTE MSG = FUNCTION FUNC (NUM).
        DISPLAY "NUM=0 1 NUM<>0 0:"MSG.
END PROGRAM APPLICATION_2_FUNCTION.

IDENTIFICATION DIVISION.
FUNCTION-ID. FUNC.
DATA DIVISION.
    LINKAGE SECTION.
        01 NUM PIC 99.
        01 RET PIC 9.
PROCEDURE DIVISION
    USING BY VALUE NUM
    RETURNING RET.
        IF NUM = 0
            THEN
                COMPUTE RET = 1
            ELSE
                COMPUTE RET = 0
        END-IF.
        EXIT FUNCTION.
END FUNCTION FUNC.
*>ユーザー定義関数を使用するには、関数名段落(FUNCTION-ID)を指定して、任意に関数を作成できる
*>上記の関数は、プログラムにおいて引数を指定して関数を呼び出し、定められた処理を実行して結果を返せる
*>FUNCTION-ID ユーザー定義関数名 (As 定数).
*>END FUNCTION ユーザー定義関数名
*>以上のようにユーザー定義関数を定義する
*>PROCEDURE DIVISIONには関数の実行結果を返すためのRETURNINGを指定する必要がある
*>関数終了時のEND FUNCTIONは省略できない