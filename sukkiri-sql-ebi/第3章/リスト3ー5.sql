--食費・交際費を取得するSQL
SELECT *
FROM 家計簿
WHERE 費目 IN ('食費','交際費')