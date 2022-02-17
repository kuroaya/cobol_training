*>マッチング処理 マスターファイルとトランザクションファイルを突き合わせて処理を行う
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_19_MATCHING.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT IN01-FILE
            ASSIGN TO "File1.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT IN02-FILE
            ASSIGN TO "File2.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
        SELECT OUT01-FILE
            ASSIGN TO "File3.txt"
            ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
    FILE SECTION.
        FD IN01-FILE.
        01 IN01.
            05 IN01-KEY PIC X(04).
            05 IN01-SUJI PIC 99.
        FD IN02-FILE.
        01 IN02.
            05 IN02-KEY PIC X(04).
            05 IN02-SUJI PIC 99.
        FD OUT01-FILE.
        01 OUT01.
            05 OUT01-KEY PIC X(04).
            05 OUT01-SUJI PIC 99.
    WORKING-STORAGE SECTION.
        01 SW-AREA.
            05 SW-IN01-END PIC X(01).
        01 CST-AREA.
            05 CST-1X PIC X(01) VALUE '1'.
PROCEDURE DIVISION.
    MATCH-RTN SECTION.
    *>初期処理
        PERFORM INIT-RTN.
    *>主処理
        PERFORM MAIN-RTN
            UNTIL SW-IN01-END = CST-1X.
    *>終了処理
        PERFORM END-RTN.
        STOP RUN.
    MATCH-EXIT.
    *>1.初期処理(ファイルオープン)
    INIT-RTN SECTION.
        OPEN INPUT IN01-FILE.
        OPEN INPUT IN02-FILE.
        OPEN OUTPUT OUT01-FILE.
        PERFORM READ01-RTN.
        PERFORM READ02-RTN.
    INIT-EXIT.
    *>2.ファイル読み込み処理(IN01)
    READ01-RTN SECTION.
        *>入力ファイルREAD
        READ IN01-FILE AT END
            DISPLAY "READ IN01 END"
            MOVE CST-1X TO SW-IN01-END
            GO TO READ01-EXIT
        END-READ.
    READ01-EXIT.
    *>3.ファイル読み込み処理(IN02)
    READ02-RTN SECTION.
        *>入力ファイルREAD
        READ IN02-FILE AT END 
            MOVE HIGH-VALUE TO IN02-KEY
            GO TO READ02-EXIT
        END-READ.
    READ02-EXIT.
    *>4.主処理(マッチング処理)
    MAIN-RTN SECTION.
        IF IN01-KEY =IN02-KEY
            THEN
                MOVE IN01-KEY TO OUT01-KEY
                MOVE IN02-SUJI TO OUT01-SUJI
                WRITE OUT01
                PERFORM READ01-RTN
            ELSE
                IF IN01-KEY < IN02-KEY
                    THEN
                        MOVE IN01 TO OUT01
                        WRITE OUT01
                        PERFORM READ01-RTN
                END-IF
                IF IN01-KEY > IN02-KEY
                    PERFORM READ02-RTN
                END-IF
        END-IF.
    MAIN-EXIT.
    *>5.終了処理(ファイルクローズ)
    END-RTN SECTION.
        CLOSE IN01-FILE.
        CLOSE IN02-FILE.
        CLOSE OUT01-FILE.
    END-EXIT.
*>マスターファイル 一度決めるとほとんど変更することのないファイル
*>トランザクションファイル 頻繁に情報が更新されるようなファイル
*>それぞれのファイルに共通するキー項目を使用して、一致するか否かを判定して処理を進める
*>1.初期処理 ファイルオープン処理
*>マッチングする2つのファイルについて、1件目のファイル読み込み処理を行う
*>2.主処理 マッチング処理を行う
*>2つのファイルに共通するキー項目を比較する
*>比較した結果、ファイル編集や出力処理を行い、次のレコードを読み込む
*>3.終了処理 ファイルクローズ処理を行う
*>一致不一致を判断して、同じファイルに出力することもできる
