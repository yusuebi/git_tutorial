--2月以降の行をロックして集計する
BEGIN;
SELECT *
FROM 家計簿
WHERE 日付 >= '2018-02-01'
FOR UPDATE;
--集計処理1
SELECT 〜 ;
--集計処理2
SELECT 〜 ;
--集計処理3
SELECT 〜 ;
COMMIT;