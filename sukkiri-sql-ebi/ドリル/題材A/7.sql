--これまでの取引の記録を取引テーブルから抽出する
SELECT T.口座番号, T.日付, J.取引事由名,
       COALESCE(T.入金額, T.出金額) AS 取引金額
FROM 取引 AS T
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE T.口座番号 IN ('0311240', '1234161', '2750902')
ORDER BY T.口座番号, T.取引番号

--口座情報とこれまでの取引情報を一覧として抽出する
SELECT K.口座番号, K.名義, K.残高,
       T.日付, T.入金額, T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
WHERE K.口座番号 = '0887132'
ORDER BY T.取引番号

--2016年3月1日に取引のあった口座番号の一覧を取得する
SELECT T.口座番号, K.名義, K.残高
FROM 取引 AS T
JOIN 口座 AS K
ON T.口座番号 = K.口座番号
WHERE T.日付 = '2016-03-01'

--解約された口座を手直しする
SELECT T.口座番号,
       COALESCE(K.名義, '解約済み') AS 名義,
       COALESCE(K.残高, 0) AS 残高
FROM 取引 AS T
LEFT JOIN 口座 AS K
       ON T.口座番号 = K.口座番号
WHERE T.日付 = '2016-03-01'

--取引テーブルのデータを抽出する
SELECT T.取引番号,
       CAST(J.取引事由ID AS VARCHAR) || ':' || J.取引事由名 AS 取引事由,
       T.日付, T.口座番号, T.入金額, T.出金額
FROM 取引 AS T
RIGHT JOIN 取引事由 AS J
       ON T.取引事由ID = J.取引事由ID
       
--取引テーブルと取引事由テーブルから取引自由の一覧を抽出する
SELECT DISTINCT T.取引事由ID, J.取引事由名
FROM 取引 AS T
FULL JOIN 取引事由 J
     ON T.取引事由ID = J.取引事由ID

--取引事由名を一覧表示する
SELECT K.口座番号, K.名義, K.残高,
       T.日付, J.取引事由名, T.入金額, T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE K.口座番号 = '0887132'
ORDER BY T.取引番号

--取引残高が500万円以上のデータを抽出する
SELECT K.口座番号, K.名義, K.残高,
       T.日付, T.取引事由ID, T.入金額, T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
WHERE K.残高 >= 5000000
AND (T.入金額 >= 1000000 OR T.出金額 >= 1000000)
AND T.日付 >= '2018-01-01'

--同一の口座で同じ日に3回以上取引された口座番号と回数を抽出する
SELECT K.口座番号, T.回数, K.名義
FROM 口座 AS K
JOIN (SELECT 口座番号, COUNT(*) AS 回数
        FROM 取引
       GROUP BY 口座番号, 日付
      HAVING COUNT(*) >= 3) AS T
ON K.口座番号 = T.口座番号

--同じ名義で複数の口座番号を持つ顧客を抽出する
SELECT DISTINCT K1.名義, K1.口座番号,
       K1.種別, K1.残高, K1.更新日
FROM 口座 AS K1
JOIN 口座 AS K2
ON K1.名義 = K2.名義
WHERE K1.口座番号 <> K2.口座番号
ORDER BY K1.名義, K1.口座番号;