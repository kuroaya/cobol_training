*>EVALUATE 条件を選択して多重分岐する
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_8_EVALUATE.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 MATH PIC 9(3).
        01 LANG PIC 9(3).
        01 RESULT PIC X.
PROCEDURE DIVISION.
    MAIN SECTION.
    TEST_RESULT.
        ACCEPT MATH.
        ACCEPT LANG.
        EVALUATE MATH ALSO LANG
            WHEN 0 THRU 50 ALSO ANY
                MOVE "D" TO RESULT;
            WHEN 51 THRU 90 ALSO 0 THRU 50
                MOVE "C" TO RESULT;
            WHEN 51 THRU 90 ALSO 51 THRU 100
            WHEN 91 THRU 100 ALSO 0 THRU 50
                MOVE "B" TO RESULT;
            WHEN 91 THRU 100 ALSO 51 THRU 100
                MOVE "A" TO RESULT;
            WHEN OTHER
                MOVE "Z" TO RESULT;
        END-EVALUATE.
        DISPLAY RESULT.
        STOP RUN.
*>得点によってAからDの判断をする どこにも該当しなければZ
*>EVALUATE 判断対象
*>判断の対象を記述する
*>WHEN 条件
*>判断基準を記述する
*>処理
*>判断基準に該当したら行う処理を記述する
*>WHEN 条件を並べたら、複数の判断基準を併記できる
*>END-EVALUATE EVALUATE終了
