--入金額が50,000円に等しい行を検索してすべての列を表示する
SELECT *
FROM 家計簿
WHERE 入金額 = 50000

--出金額が4,000円を超える行をすべて削除する
DELETE FROM 家計簿
WHERE 出金額 > 4000

--2018年2月3日のメモを「カフェラテを購入」に変更する
UPDATE 家計簿
SET メモ = 'カフェラテを購入'
WHERE 日付 = '2018-02-03'