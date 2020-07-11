--SQL文をいくつも実行して、各費目の集計結果を得る方法
SELECT '食費' AS 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
WHERE 費目 = '食費'

SELECT '給料' AS 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
WHERE 費目 = '給料'

SELECT '教養娯楽費' AS 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
WHERE 費目 = '教養娯楽費'