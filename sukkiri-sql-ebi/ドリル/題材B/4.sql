--未分類の商品について、商品コード、単価、キャンペーン価格を取得する
SELECT 商品コード, 単価, 単価 * 0.95 AS キャンペーン価格
FROM 商品
WHERE 商品区分 = '9'
ORDER BY 商品コード

--注文日が2018年3月12日～14日のクーポン割引を更新する
UPDATE 注文
SET クーポン割引料 = クーポン割引料 + 300
WHERE 注文日 >= '2018-03-12'
AND 注文日 < '2018-03-15'
AND 数量 >= 2
AND クーポン割引料 IS NOT NULL

--注文番号2018022502250の商品コードW0156の注文数を1つ減らす
UPDATE 注文
SET 数量 = 数量 - 1
WHERE 注文番号 = '201802250126'
AND 商品コード = 'W0156'

--注文番号201710010001～201710319999のデータを抽出する
SELECT 注文番号 || '-' || CAST(注文枝番 AS VARCHAR)
FROM 注文
WHERE 注文番号 >= '201710010001'
AND 注文番号 <= '201710319999'

--商品区分の一覧を取得する
SELECT DISTINCT 商品区分 AS 区分,
       CASE 商品区分 WHEN '1' THEN '衣類'
	                 WHEN '2' THEN '靴'
					 WHEN '3' THEN '雑貨'
					 WHEN '9' THEN '未分類' END AS 区分名
FROM 商品

--商品コード、商品名、単価、販売ランク、商品区分を抽出する
SELECT 商品コード, 商品名, 単価,
CASE WHEN 単価 < 3000 THEN 'S'
	WHEN 単価 >= 3000 AND 単価 < 10000 THEN 'M'
	ELSE 'L' END AS 販売価格ランク,
商品区分 || ':' ||
CASE 商品区分 WHEN '1' THEN '衣類'
	WHEN '2' THEN '靴'
	WHEN '3' THEN '雑貨'
	 WHEN '9' THEN '未分類' END AS 商品区分
FROM 商品
ORDER BY 単価, 商品コード

--商品名が10文字を超過する商品名と文字数を取得する
SELECT 商品名, LENGTH(商品名) AS 文字数
FROM 商品
WHERE LENGTH(商品名) > 10
ORDER BY LENGTH(商品名)

--注文日と注文番号の一覧を抽出する
SELECT 注文日, SUBSTRING(注文番号, 9, 4) AS 注文番号
FROM 注文

--商品コードの1文字目がMの商品の商品コードをEで始まるように更新する
UPDATE 商品
SET 商品コード = 'E' || SUBSTRING(商品コード, 2, 4)
WHERE SUBSTRING(商品コード, 1, 1) = 'M'

--注文番号の連番部分が1000～2000の注文番号を抽出する
SELECT SUBSTRING(注文番号, 9, 4) AS 注文番号
FROM 注文
WHERE SUBSTRING(注文番号, 9, 4) >= '1000'
AND SUBSTRING(注文番号, 9, 4) <= '2000'
ORDER BY SUBSTRING(注文番号, 9, 4)

--商品コードS1990の廃番日を関数を使って本日の日付に修正する
UPDATE 廃番商品
SET 廃番日= CURRENT_DATE
WHERE 商品コード = 'S1990'

--一万円以上の商品の一覧を取得する
SELECT 商品コード, 商品名, 単価, TRUNC(単価 * 0.7, 0) AS 値下げした単価
FROM 商品
WHERE 単価 >= 10000