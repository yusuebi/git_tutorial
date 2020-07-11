--衣類の商品について、商品コードの降順に商品コードと商品名の一覧を取得する
SELECT 商品コード, 商品名
FROM 商品
WHERE 商品区分 = '1'
ORDER BY 商品コード DESC

--主キーの昇順に2018年3月以降の注文を取得する
SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
FROM 注文
WHERE 注文日 >= '2018-03-01'
ORDER BY 注文日, 注文番号, 注文枝番

--これまで注文のあったデータを抽出する
SELECT DISTINCT 商品コード
FROM 注文
ORDER BY 商品コード

--注文のあった日付を新しい順に10行抽出する
SELECT 注文日
FROM 注文
ORDER BY 注文日 DESC
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--単価の低い順に6～20行目のデータを抽出する
SELECT *
FROM 商品
ORDER BY 単価, 商品区分, 商品コード
OFFSET 5
FETCH FIRST 15 ROWS ONLY

--2016年12月に廃棄されたものと、売り上げ個数が100を超えるものを抽出する
SELECT *
FROM 廃番商品
WHERE 廃番日 >= '2016-12-01'
AND 廃番日 < '2017-01-01'
UNION
SELECT *
FROM 廃番商品
WHERE 売上個数 > 100
ORDER BY 6 DESC

--これまでに注文されたことのない商品コードを昇順に抽出する
SELECT 商品コード
FROM 商品
EXCEPT
SELECT 商品コード
FROM 注文
ORDER BY 1

--これまでに注文された実績のある商品コードを昇順に抽出する
SELECT 商品コード
FROM 商品
INTERSECT
SELECT 商品コード
FROM 注文
ORDER BY 1 DESC

--未分類で単価が千円以下と一万円を超える商品について、商品コード、商品名、単価を抽出する
SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品区分 = '9'
AND 単価 <= 1000
UNION
SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品区分 = '9'
AND 単価 > 10000
ORDER BY 3, 1