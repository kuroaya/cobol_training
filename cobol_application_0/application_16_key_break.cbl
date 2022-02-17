*>キーブレイク処理 ソート済みのレコードを順に読み込んで、
*>レコードをあるキー項目ごとにグループ分けをして処理を行うこと
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_16_KEY_BREAK.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01_FILE
            ASSIGN TO "File1.txt"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS IN_FILE_STATUS.
        SELECT OUT01_FILE
            ASSIGN TO "File2.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN01_FILE.
        01 IN01.
            05 IN01_YEAR PIC X(04).
            05 IN01_SUJI PIC 99.
        FD OUT01_FILE.
        01  OUT01.
            05 OUT01_YEAR PIC X(04).
            05 OUT01_SUJI PIC 999.
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
        01 WK_KEY_AREA.
            05 WK_KEY_OLD PIC X(04).
            05 WK_KEY_NEW PIC X(04).
        01 WK_SUM_AREA.
            05 WK_SUM_SUJI PIC 999.
PROCEDURE DIVISION.
    *>初期処理(ファイルオープン)
        OPEN INPUT IN01_FILE.
        OPEN OUTPUT OUT01_FILE.
        READ IN01_FILE
            AT END 
                DISPLAY "READ END"
            NOT AT END
                MOVE IN01_YEAR TO WK_KEY_NEW
                    WK_KEY_OLD
                MOVE IN01_SUJI TO WK_SUM_SUJI
        END-READ.
    *>主処理(キーブレイク処理、データ集計処理)
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ IN01_FILE
                AT END
                    DISPLAY "READ END"
                    MOVE WK_KEY_OLD TO OUT01_YEAR
                    MOVE WK_SUM_SUJI TO OUT01_SUJI
                    WRITE OUT01
                NOT AT END
                    MOVE IN01_YEAR TO WK_KEY_NEW
    *>キーブレイク
                    IF WK_KEY_NEW = WK_KEY_OLD
    *>データ集計
                    THEN
                        COMPUTE WK_SUM_SUJI = WK_SUM_SUJI + IN01_SUJI
    *>ファイル出力
                    ELSE
                        MOVE WK_KEY_OLD TO OUT01_YEAR
                        MOVE WK_SUM_SUJI TO OUT01_SUJI
                        WRITE OUT01 
    *>次のキーをセット
                        MOVE WK_KEY_NEW TO WK_KEY_OLD
                        MOVE IN01_SUJI TO WK_SUM_SUJI
                    END-IF
            END-READ
        END-PERFORM.
    *>終了処理
        CLOSE IN01_FILE.
        CLOSE OUT01_FILE.
        STOP RUN.
*>処理はファイルのレコードがキー順にソートされている事が前提となる
*>1.初期処理 ファイルオープン処理を行う
*>2.ファイル読み込み処理、キーブレイク、データ集計処理を行う
*>3.ファイルクローズ処理を行う
