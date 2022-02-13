*>処理時間を取得する
IDENTIFICATION DIVISION.
PROGRAM-ID. APPLICATION_13_TIME.
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 CNT PIC 9(04) VALUE 0.
        01 STIME PIC 9(08).
        01 ETIME PIC 9(08).
        01 RESULT PIC 9(03).
PROCEDURE DIVISION.
    *>開始時刻を取得
    ACCEPT STIME FROM TIME.
    
    *>1000回に達するまでループ
    PERFORM UNTIL CNT = 1000
        ADD 1 TO CNT
        DISPLAY CNT"COUNT."
    END-PERFORM.
    
    *>終了時刻を取得
    ACCEPT ETIME FROM TIME
    
    *>処理時間を算出
    COMPUTE RESULT = STIME - ETIME.
    DISPLAY "RESULT TIME:"RESULT.
    
    STOP RUN.
*>ACCEPT 時刻を取得する項目 FROM TIME.
*>システムの現在時刻を取得する
*>処理開始時と終了時に時刻を取得して、その差を算出することで、処理にかかった時間を取得できる

