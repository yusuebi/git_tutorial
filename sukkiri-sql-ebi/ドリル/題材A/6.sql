--取引日の取引結果を口座テーブル残高に反映する
UPDATE 口座
SET 残高 = 残高 + (SELECT COALESCE(SUM(入金額) - SUM(出金額), 0)
       FROM 取引
       WHERE 口座番号 = '0351333'
       AND 日付 = '2018-01-11'),
更新日 = '2018-01-11'
WHERE 口座番号 = '0351333'

--現在の残高と、取引日に発生した取引による入出金額それぞれの合計金額を取得する。
SELECT 残高,
(SELECT SUM(入金額)
  FROM 取引
  WHERE 口座番号 = '1115600'
  AND 日付     = '2017-12-28') AS 入金額合計,
(SELECT SUM(出金額)
  FROM 取引
  WHERE 口座番号 = '1115600'
  AND 日付     = '2017-12-28') AS 出金額合計
FROM 口座
WHERE 口座番号 = '1115600'

--1回の取引で100万円以上の入金があった口座について、口座番号、名義、残高を取得する
SELECT 口座番号, 名義, 残高
FROM 口座
WHERE 口座番号 IN (SELECT 口座番号
FROM 取引
WHERE 入金額 >= 1000000)

--取引テーブルの日付よりも未来の更新日を持つ口座テーブルのデータを抽出する
SELECT * FROM 口座
WHERE 更新日 >ALL (SELECT 日付 FROM 取引)

--入金と出金の両方が発生した日付を抽出する
SELECT A. 日付,
       (SELECT MAX(入金額) FROM 取引 WHERE 口座番号 = '3104451') AS 最大入金額,
       (SELECT MAX(出金額) FROM 取引 WHERE 口座番号 = '3104451') AS 最大出金額
  FROM (SELECT 日付
          FROM 取引
         WHERE 口座番号 = '3104451'
         GROUP BY 日付
        HAVING SUM(入金額) > 0 AND SUM(出金額) > 0) AS A
        
--副問い合わせを使って口座テーブルから廃止口座テーブルにデータを抽出する
INSERT INTO 廃止口座
SELECT * FROM 口座
WHERE 口座番号 = '2761055';
DELETE FROM 口座
WHERE 口座番号 = '2761055';