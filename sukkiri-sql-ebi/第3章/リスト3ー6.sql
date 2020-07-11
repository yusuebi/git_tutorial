--食費でも交際費でもない行を取得するSQL
SELECT *
FROM 家計簿
WHERE 費目 NOT IN ('食費','交際費')