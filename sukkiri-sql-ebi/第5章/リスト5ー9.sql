--空白を除去したメモを取得する
SELECT メモ, TRIM(メモ) AS 空白除去したメモ
FROM 家計簿