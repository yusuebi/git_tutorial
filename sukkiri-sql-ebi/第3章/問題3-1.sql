--6月のデータ
SELECT *
FROM 気象観測
WHERE 月 = 6

--6月以外のデータ
SELECT *
FROM 気象観測
WHERE 月 <> 6

--降水量が100未満のデータ
SELECT *
FROM 気象観測
WHERE 降水量 < 100

--降水量が200より多いデータ
SELECT *
FROM 気象観測
WHERE 降水量 > 200

--最高気温が30以上のデータ
SELECT *
FROM 気象観測
WHERE 最高気温 >= 30

--最低気温が0以下のデータ
SELECT *
FROM 気象観測
WHERE 最低気温 <= 0

--3月、5月、7月のデータ(INを使用)
SELECT *
FROM 気象観測
WHERE 月 IN (3,5,7)

--3月、5月、7月のデータ(ORを使用)
SELECT *
FROM 気象観測
WHERE 月 = 3
OR 月 = 5
OR 月 = 7

--3月、5月、7月以外のデータ(INを使用)
SELECT *
FROM 気象観測
WHERE NOT IN (3,5,7)

--3月、5月、7月以外のデータ(ORを使用)
SELECT *
FROM 気象観測
WHERE 月 <> 3
OR 月 <> 5
OR 月 <> 7

--降水量が100以下で、湿度が50より低いデータ
SELECT *
FROM 気象観測
WHERE 降水量 <= 100
AND 湿度 < 50

--最低気温が5未満か、最高気温が35より高いデータ
SELECT *
FROM 気象観測
WHERE 最低気温 < 5
OR 最高気温 > 35

--湿度が60～79の範囲にあるデータ(BETWEENを使用)
SELECT *
FROM 気象観測
WHERE 湿度 BETWEEN 60 AND 79

----湿度が60～79の範囲にあるデータ(ANDを使用)
SELECT *
FROM 気象観測
WHERE 湿度 >= 60
AND 湿度 <= 79

--観測データのない列のある月のデータ
SELECT *
FROM 気象観測
WHERE 降水量 IS NULL
OR 最高気温 IS NULL
OR 最低気温 IS NULL
OR 湿度 IS NULL