--選択リストで副問い合わせを利用する
SELECT 日付, メモ, 出金額,
        (SELECT 合計 FROM 家計簿集計
		  WHERE 費目 = '食事') AS 過去の合計額
FROM 家計簿アーカイブ
WHERE 費目 = '食費'