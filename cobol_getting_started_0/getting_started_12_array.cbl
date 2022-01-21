*>ARRAY 配列
IDENTIFICATION DIVISION.
PROGRAM-ID. GETTING_STARTED_12_ARRAY.
    ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 WORK_ITEM_1.
            05 WORK_DATA PIC X(12) VALUE "OCCURS_TEST" OCCURS 5 TIMES.
        01 WORK_ITEM_2.
            05 WORK_SIZE PIC 9(01).
            05 FRUITS OCCURS 0 TO 5 
                DEPENDING ON WORK_SIZE. 
                10 ITEM PIC X(10).
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
    INITIALIZE_ARRAY.
        SET WORK_SIZE TO 5.
        MOVE "APPLE" TO ITEM(1).
        MOVE "ORANGE" TO ITEM(2).
        MOVE "BANANA" TO ITEM(3).
        MOVE "PINEAPPLE" TO ITEM(4).
        MOVE "MELON" TO ITEM(5).
    OUTPUT_PROCEDURE.
        DISPLAY "WORK_ITEM_1:" WORK_ITEM_1.
        DISPLAY "ITEM(1):"ITEM(1).
        DISPLAY "ITEM(2):"ITEM(2).
        DISPLAY "ITEM(3):"ITEM(3).
        DISPLAY "ITEM(4):"ITEM(4).
        DISPLAY "ITEM(5):"ITEM(5).
    END_PART.
        STOP RUN.
*>COBOLでは配列と同じデータ形式のことを「表テーブル」とも呼ぶ
*>データ項目 OCCURS 配列の最大要素数
*>要素数が固定の配列を設定する
*>01 66 77 88 レベルのデータ項目は指定できない
*>VALUE句を指定した場合は、配列の全ての要素に値が設定される
*>データ項目 OCCURS 最小要素数 TO 最大要素数 DEPENDING ON 要素数管理項目
*>要素数が可変の配列を設定する
*>要素数管理項目に、希望するデータ数を指定する、データ項目を設定する