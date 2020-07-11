--副問い合わせからNULLを除外する(COALESCE版)
SELECT *
FROM 家計簿アーカイブ
WHERE 費目 IN(SELECT COALESCE(費目, '不明')FROM 家計簿)