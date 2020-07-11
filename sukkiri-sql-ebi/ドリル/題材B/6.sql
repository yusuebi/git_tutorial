--商品コード、商品名、単価、これまでに販売した数量を抽出する
SELECT 商品コード, 商品名, 単価,
(SELECT SUM(数量)
	FROM 注文
	WHERE 商品コード = 'S0604') AS 数量
FROM 商品
WHERE 商品コード = 'S0604'

--商品コードを修正する
UPDATE 注文
SET 商品コード = (SELECT 商品コード
                     FROM 商品
		            WHERE 商品区分 = '2'
					  AND 商品名 LIKE '%ブーツ%'
					  AND 商品名 LIKE '%安心%'
				      AND 商品名 LIKE '%雨%')
WHERE 注文日 = '2018-03-15'
AND 注文番号 = '201803150014'
AND 注文枝番 = 1

--商品名にあったかが含まれる商品が売れた日付とその商品コードを過去の日付順に抽出する
SELECT 注文日, 商品コード
FROM 注文
WHERE 商品コード IN (SELECT 商品コード
                      FROM 商品
					 WHERE 商品名 LIKE '%あったか%')
ORDER BY 注文日

--商品ごとの平均販売数量を求め、どの商品ンお平均販売数量よりも多い数が売れた商品を探し、商品コードと販売数量を抽出する
SELECT 商品コード, SUM(数量) AS 数量
FROM 注文
GROUP BY 商品コード
HAVING SUM(数量) >ALL (SELECT AVG(数量)
                         FROM 注文
						GROUP BY 商品コード)


--クーポン割引を利用して販売したものについて、その販売数量と、商品1個当たりの平均割引額を抽出する
SELECT A.数量合計 AS 割引による販売数,
TRUNC(A.割引料合計 / A.数量合計, 0) AS 平均割引額
FROM (SELECT SUM(数量) AS 数量合計,
               SUM(クーポン割引料) AS 割引料合計
          FROM 注文
         WHERE 商品コード = 'W0746'
		   AND クーポン割引料 IS NOT NULL) AS A

--追加分の注文を注文テーブルに登録する
INSERT INTO 注文
SELECT 注文日, 注文番号, MAX(注文枝番) + 1, 'S1003', 1, NULL
FROM 注文
WHERE 注文日 = '2018-03-21'
AND 注文番号 = '201803210080'
GROUP BY 注文日, 注文番号;
INSERT INTO 注文
SELECT 注文日, 注文番号, MAX(注文枝番) + 1, 'A0052', 2, 500
FROM 注文
WHERE 注文日 = '2018-03-22'
AND 注文番号 = '201803220901'
GROUP BY 注文日, 注文番号;