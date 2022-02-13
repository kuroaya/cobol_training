*>多次元配列にループ処理で値を格納する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_9_MULTI_ARRAY_PER.
ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
DATA DIVISION.
    WORKING-STORAGE SECTION.
*>多次元配列を定義
        01 WORK_ITEM.
            03 WORK_DATA_1 OCCURS 2.
            05 WORK_DATA_2 OCCURS 2.
            07 WORK_DATA_3 OCCURS 3.
            09 WORK_ITEM_1 PIC 9(02).
        01 CNT_1 PIC 9(02).
        01 CNT_2 PIC 9(02).
        01 WORK_CNT_3.
            03 CNT_3 PIC 9(02).
            03 CNT_VAL PIC 9(05) VALUE 0.
PROCEDURE DIVISION.
    MAIN_PROCEDURE.
        *>1次元配列
        PERFORM VARYING CNT_1 FROM 1 BY 1 UNTIL CNT_1 > 2
            *>2次元配列
            PERFORM VARYING CNT_2 FROM 1 BY 1 UNTIL CNT_2 > 2 
                *>3次元配列
                PERFORM VARYING CNT_3 FROM 1 BY 1 UNTIL CNT_3 > 3 
                    *>値を格納
                    ADD 1 TO CNT_VAL
                    MOVE CNT_VAL TO WORK_ITEM_1(CNT_1 CNT_2 CNT_3)
                    DISPLAY "WORK_ITEM("CNT_1" "CNT_2" "CNT_3"):"WORK_ITEM_1(CNT_1 CNT_2 CNT_3)
                END-PERFORM
            END-PERFORM
        END-PERFORM.
        
        STOP RUN.
*>PERFORM UNTILで1次元配列から3次元配列を要素分ループして、配列の項目にデータを格納している
