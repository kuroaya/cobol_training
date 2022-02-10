*>SORT 2つのファイルを結合して、並び替える
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_5_SORT.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT TEST_FILE1 ASSIGN TO 'File1'*>入力ファイル1
            ORGANIZATION IS LINE SEQUENTIAL
            STATUS IS IN_FILE_STATUS.
        SELECT TEST_FILE2 ASSIGN TO 'File2'*>入力ファイル2
            ORGANIZATION IS LINE SEQUENTIAL
            STATUS IS IN_FILE_STATUS.
        SELECT DESCENDING_FILE ASSIGN TO 'File3'*>降順用出力ファイル
            ORGANIZATION IS LINE SEQUENTIAL
            STATUS IS IN_DESCENDING_STATUS.
        SELECT ASCENDING_FILE ASSIGN TO 'File4'*>昇順用出力ファイル
            ORGANIZATION IS LINE SEQUENTIAL
            STATUS IS IN_ASCENDING_STATUS.
        SELECT MERGE_FILE ASSIGN TO 'File5'.*>併合用ファイル
        
DATA DIVISION.
    FILE SECTION.
        *>入力ファイル1
        FD TEST_FILE1.
            01 TEST_RECORD_1.
                05 NO_CORD PIC 9(5).
                05 DATA_1 PIC X(5).
                05 DATA_2 PIC X(5).
        *>入力ファイル2
        FD TEST_FILE2.
            01 TEST_RECORD_2.
                05 NO_CORD PIC 9(5).
                05 DATA_1 PIC X(5).
                05 DATA_2 PIC X(5).
        *>降順ファイル
        FD DESCENDING_FILE.
            01 DESCENDING_RECORD PIC X(15).
        *>昇順ファイル
        FD ASCENDING_FILE.
            01 ASCENDING_RECORD PIC X(15).
        *>併合ファイル
        SD MERGE_FILE.
            01 MERGE_RECORD.
                05 SORT_KEY PIC 9(5).
                05 SORT_DATA PIC X(10).
            
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
        01 IN_DESCENDING_STATUS PIC XX.
        01 IN_ASCENDING_STATUS PIC XX.
        
PROCEDURE DIVISION.
    OPEN INPUT TEST_FILE1.
    OPEN INPUT TEST_FILE2.
    
*>ファイルを結合して昇順でソートする
    MERGE MERGE_FILE
        ASCENDING KEY SORT_KEY
        USING TEST_FILE1 TEST_FILE2
        GIVING DESCENDING_FILE.
        
*>ファイルを結合して降順でソートする
    MERGE MERGE_FILE
        DESCENDING KEY SORT_KEY
        USING TEST_FILE1 TEST_FILE2
        GIVING ASCENDING_FILE.
        
    CLOSE TEST_FILE1.
    CLOSE TEST_FILE2.
    
    DISPLAY "プログラム終了".
    
    STOP RUN.
*>データを昇順と降順でソートをしてファイルを作成する
*>降順、昇順用のファイルがそれぞれ必要となる
*>MERGE文はSORT文と同様にデータをソートすることができる
