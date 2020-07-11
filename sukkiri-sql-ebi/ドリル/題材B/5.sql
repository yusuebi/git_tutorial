--これまで注文された数量の合計を求める
SELECT SUM(数量) AS 数量合計
FROM 注文

--注文日順に、注文日ごとの数量の合計を求める
SELECT 注文日, SUM(数量) AS 数量合計
FROM 注文
GROUP BY 注文日
ORDER BY 注文日

--商品区分順に、商品区分ごとの単価の最少額と最高額を求める
SELECT 商品区分, MIN(単価) AS 最小額, MAX(単価) AS 最高額
FROM 商品
GROUP BY 商品区分
ORDER BY 商品区分

--商品コード順に、商品コードごとにこれまで注文された数量の合計を求める
SELECT 商品コード, SUM(数量) AS 数量合計
FROM 注文
GROUP BY 商品コード
ORDER BY 商品コード

--これまでに最もよく売れた商品を10位まで抽出する
SELECT 商品コード, SUM(数量) AS 数量合計
FROM 注文
GROUP BY 商品コード
ORDER BY 数量合計 DESC, 商品コード
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--これまでに売れた数量が5個未満の商品コードとその数量を抽出する
SELECT 商品コード, SUM(数量) AS 数量合計
FROM 注文
GROUP BY 商品コード
HAVING SUM(数量) < 5

--これまでにクーポン割引をした注文件数と、割引額の合計を求める
SELECT COUNT(クーポン割引料) AS 割引件数, SUM(クーポン割引料) AS 割引額合計
FROM 注文

--月ごとの注文件数を求める
SELECT SUBSTRING(注文番号, 1, 6) AS 年月, COUNT(*) AS 注文件数
FROM 注文
WHERE 注文枝番 = 1
GROUP BY SUBSTRING(注文番号, 1, 6)
ORDER BY SUBSTRING(注文番号, 1, 6)

--Zから始まる商品コードのうち、これまでに売れた終了が100個以上の商品コードを抽出する
SELECT 商品コード
FROM 注文
WHERE 商品コード LIKE 'Z%'
GROUP BY 商品コード
HAVING SUM(数量) >= 100