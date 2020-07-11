--INで副問い合わせを利用する
SELECT *
FROM 家計簿集計
WHERE 費目 IN (SELECT DISTINCT 費目 FROM 家計簿)