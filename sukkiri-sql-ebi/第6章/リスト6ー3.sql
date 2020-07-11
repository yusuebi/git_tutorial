--食費の行数を数える
SELECT COUNT(*) AS 食費の行数
FROM 家計簿
WHERE 費目 = '食費'