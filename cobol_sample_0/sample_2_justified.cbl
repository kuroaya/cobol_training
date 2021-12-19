*>JUSTIFIED データをデータ項目に転記したときの、けたよせを行う
IDENTIFICATION DIVISION.
PROGRAM-ID. SAMPLE_2_JUSTIFIED.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 未処理 PIC X(10).
        01 けたよせ PIC X(10) JUSTIFIED RIGHT.
PROCEDURE DIVISION.
    MAIN SECTION.
        桁をよせる.
            MOVE "ABCDE" TO 未処理 けたよせ.
            DISPLAY 未処理 "," けたよせ.
            MOVE "JUSTIFIED_00001" TO 未処理 けたよせ.
            DISPLAY 未処理 " , " けたよせ.
            STOP RUN.
*>基本項目 JUSTIFIED RIGHT.
*>基本項目に転記したデータを右側にけたよせをする
*>データが基本項目の大きさを超えれば、左側の文字を切り捨ててデータをおさめる