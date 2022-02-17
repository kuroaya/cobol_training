*>キーブレイク処理 2つのグループに分ける
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_17_KEY_BREAK.
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
            05 IN01_MONTH PIC X(02).
            05 IN01_SUJI PIC 99.
        FD OUT01_FILE.
        01 OUT01.
            05 OUT01_YEAR PIC X(04).
            05 OUT01_MONTH PIC X(02).
            05 OUT01_SUJI PIC 999.
            05 OUT01_SUJI_ALL PIC 999.
    WORKING-STORAGE SECTION.
        01 IN_FILE_STATUS PIC XX.
        01 WI_KEY_AREA.
            05 WK_KEY_OLD.
                10 WK_KEY_OLD_YEAR PIC X(04).
                10 WK_KEY_OLD_MONTH PIC X(02).
            05 WK_KEY_NEW.
                10 WK_KEY_NEW_YEAR PIC X(04).
                10 WK_KEY_NEW_MONTH PIC X(02).
        01 WK_SUM_AREA.
            05 WK_SUM_SUJI PIC 999.
            05 WK_SUM_SUJI_ALL PIC 999.
PROCEDURE DIVISION.
    *>初期処理(ファイルオープン)
        OPEN INPUT IN01_FILE.
        OPEN OUTPUT OUT01_FILE.
        READ IN01_FILE
            AT END
                DISPLAY "READ END"
            NOT AT END
                MOVE IN01_YEAR TO WK_KEY_NEW_YEAR
                    WK_KEY_OLD_YEAR
                MOVE IN01_MONTH TO WK_KEY_NEW_MONTH
                    WK_KEY_OLD_MONTH
                MOVE IN01_SUJI TO WK_SUM_SUJI
                MOVE IN01_SUJI TO WK_SUM_SUJI_ALL
        END-READ.
    *>主処理(キーブレイク処理、データ集計処理)
        PERFORM UNTIL IN_FILE_STATUS NOT = "00"
            READ IN01_FILE
                AT END 
                    DISPLAY "READ END"
                    MOVE WK_KEY_OLD_YEAR TO OUT01_YEAR
                    MOVE WK_KEY_OLD_MONTH TO OUT01_MONTH
                    MOVE WK_SUM_SUJI TO OUT01_SUJI
                    MOVE WK_SUM_SUJI_ALL TO OUT01_SUJI_ALL
                    WRITE OUT01
                NOT AT END
                    MOVE IN01_YEAR TO WK_KEY_NEW_YEAR
                    MOVE IN01_MONTH TO WK_KEY_OLD_MONTH
    *>キーブレイク1
                    IF WK_KEY_NEW_YEAR = WK_KEY_OLD_YEAR
    *>データ集計
                        THEN
    *>キーブレイク2
                            IF WK_KEY_NEW = WK_KEY_OLD
                                THEN
                                    COMPUTE WK_SUM_SUJI = WK_SUM_SUJI + IN01_SUJI
                                    COMPUTE WK_SUM_SUJI_ALL = WK_SUM_SUJI_ALL + IN01_SUJI
                                ELSE
    *>ファイル出力
                                    MOVE WK_KEY_OLD_YEAR TO OUT01_YEAR
                                    MOVE WK_KEY_OLD_MONTH TO OUT01_MONTH
                                    MOVE WK_SUM_SUJI TO OUT01_SUJI
                                    MOVE WK_SUM_SUJI_ALL TO OUT01_SUJI_ALL
                                    WRITE OUT01
    *>次のキーをセット
                                    MOVE WK_KEY_NEW TO WK_KEY_OLD
                                    MOVE IN01_SUJI TO WK_SUM_SUJI
                                    COMPUTE WK_SUM_SUJI_ALL = WK_SUM_SUJI_ALL + IN01_SUJI
                            END-IF
                        ELSE
    *>ファイル出力
                                    MOVE WK_KEY_OLD_YEAR TO OUT01_YEAR
                                    MOVE WK_KEY_OLD_MONTH TO OUT01_MONTH
                                    MOVE WK_SUM_SUJI TO OUT01_SUJI
                                    MOVE WK_SUM_SUJI_ALL TO OUT01_SUJI_ALL
                                    WRITE OUT01
    *>次のキーをセット
                                    MOVE WK_KEY_NEW TO WK_KEY_OLD
                                    MOVE IN01_SUJI TO WK_SUM_SUJI
                                    MOVE IN01_SUJI TO WK_SUM_SUJI_ALL
                    END-IF
            END-READ
        END-PERFORM.
    *>終了処理(ファイルクローズ)
        CLOSE IN01_FILE.
        CLOSE OUT01_FILE.
        STOP RUN.
*>キー項目を二つ作ることで二つのグループ単位に数字を集計することができる
