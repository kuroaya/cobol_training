*>BINARY SEARCH 二部表引き　高速に検索を行う
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_21_BINARYSEARCH.
DATA DIVISION.
    WORKING-STORAGE SECTION.
    01 クラス.
        05 生徒 OCCURS 3 ASCENDING KEY 数学 INDEXED BY K.
            10 氏名 PIC X(6).
            10 数学 PIC 9(3).
            10 英語 PIC 9(3).
    01 人数 PIC 99 VALUE ZERO.
PROCEDURE DIVISION.
    MAIN_PART SECTION.
    INPUT_PART.
        MOVE "TANAKA" TO 氏名(1).
        MOVE "SUZUKI" TO 氏名(2).
        MOVE "GOTOU" TO 氏名(3).
        MOVE 60 TO 数学(1).
        MOVE 55 TO 数学(2).
        MOVE 59 TO 数学(3).
        MOVE 49 TO 英語(1).
        MOVE 70 TO 英語(2).
        MOVE 35 TO 英語(3).
    SEARCH_PART.
        SEARCH ALL 生徒
            AT END
                DISPLAY "NO MATH POINT 59";
                STOP RUN;
            WHEN 数学(K) = 59
                CONTINUE;
        END-SEARCH.
    OUTPUT_PART.
        DISPLAY "MATH POINT 59 NAME "氏名(K) ".".
    END_PART.
        STOP RUN.
*>SEARCH ALL 検索対象
*>AT END
*>検索対象が存在しなかったときの処理を記述
*>WHEN 検索条件
*>検索条件に合致する対象が存在したときの処理を記述
*>END-SEARCH.
*>検索処理終了
