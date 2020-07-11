--10文字(10バイト)以下のメモだけを取得する
SELECT メモ, LENGTH (メモ) AS メモの長さ
FROM 家計簿
WHERE LENGTH (メモ) <= 10