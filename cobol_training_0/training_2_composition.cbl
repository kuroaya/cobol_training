*>cobolプログラムの構成

*>見出し部
*>プログラムを識別する情報を載せる
*>省略不可能
IDENTIFICATION DIVISION.
*>プログラム名を記述する
PROGRAM-ID. TRAINING_2_COMPOSITION.

*>環境部
*>cobolを使用する計算機やFILEの情報を載せる
*>省略可能
ENVIRONMENT DIVISION.

*>データ部
*>ファイルデータの構成、内部データの項目、プログラム間のデータ項目を載せる
*>データ項目がないときは省略可能
DATA DIVISION.

*>手続き部
*>宣言部分と手続き部分を載せる
*>実行させたいことを記述する
PROCEDURE DIVISION.
    DISPLAY "cobolプログラムの構成について".
    STOP RUN.

*>IDENTIFICATION DIVISION.見出し部
*>PROGRAM-ID. SECTION. プログラム名
*>ENVIRONMENT DIVISION. 環境部
*>DATA DIVISION. データ部
*>PROCEDURE DIVISION. 手続き部