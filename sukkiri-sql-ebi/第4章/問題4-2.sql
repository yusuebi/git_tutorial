--和集合の結果、整数テーブルと等しくなる
SELECT 値
FROM 奇数
UNION
SELECT 値
FROM 偶数

--差集合の結果、奇数テーブルと等しくなる
SELECT 値
FROM 整数
EXCEPT
SELECT 値
FROM 偶数

--積集合の結果、偶数テーブルと等しくなる
SELECT 値
FROM 整数
INTERSECT
SELECT 値
FROM 偶数

--検索結果なし
SELECT 値
FROM 奇数
INTERSECT
SELECT 値
FROM 偶数