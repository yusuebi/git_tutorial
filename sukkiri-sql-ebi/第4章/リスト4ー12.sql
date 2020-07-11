--差集合を取得する
SELECT 費目
FROM 家計簿
EXCEPT
SELECT 費目
FROM 家計簿アーカイブ