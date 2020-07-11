--集計結果から行を取り除くSQL文（エラーになる）
SELECT 費目, SUM(出金額) 費目別の出金額合計
FROM 家計簿
WHERE SUM(出金額) > 0
GROUP BY 費目