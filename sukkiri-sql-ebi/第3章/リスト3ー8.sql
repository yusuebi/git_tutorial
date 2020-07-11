--複数の論理演算子を使ったSELECT文
SELECT *
FROM 湊くんの買い物リスト
WHERE 販売店 = 'A'
OR 販売店 = 'B'
AND カテゴリ = 'ゲーム'
OR カテゴリ = 'DVD'