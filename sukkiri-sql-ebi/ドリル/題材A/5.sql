--残高の合計、最大、最小、平均、登録されているデータの件数を求める
SELECT SUM(残高) AS 合計, MAX(残高) AS 最大, MIN(残高) AS 最小,
       AVG(残高) AS 平均, COUNT(*) AS 件数
FROM 口座

--種別が普通以外、残高が100万円以上、更新日が2017年以前のデータの件数を求める
SELECT COUNT(*) AS 件数
FROM 口座
WHERE 種別 <> '1'
AND 残高 >= 1000000
AND 更新日 < '2018-01-01'

--更新日が登録されていないデータ件数を求める
SELECT COUNT(*) - COUNT(更新日) AS 更新日が登録されていない件数
FROM 口座

--名義の最大値と最小値を求める
SELECT MAX(名義), MIN(名義)
FROM 口座

--更新日の最大値と最小値を求める
SELECT MAX(更新日), MIN(更新日)
FROM 口座

--種別ごとの残高の合計、最大、最小、平均、登録されているデータ件数を求める
SELECT 種別, SUM(残高) AS 合計, MAX(残高) AS 最大, MIN(残高) AS 最小,
       AVG(残高) AS 平均, COUNT(*) AS 件数
FROM 口座
GROUP BY 種別

--口座番号の下1桁目が同じ数字であるものをグループとし、それごとの件数を求める
SELECT SUBSTRING(口座番号, 7, 1) AS 口座番号グループ, COUNT(*) AS 件数
FROM 口座
GROUP BY SUBSTRING(口座番号, 7, 1)
ORDER BY 件数 DESC

--更新日の年ごとの残高の合計、最大、最小、平均、登録されているデータの件数を求める
SELECT SUBSTRING(COALESCE(CAST(更新日 AS VARCHAR), 'XXXX'), 1, 4) AS 更新年,
       SUM(残高) AS 合計, MAX(残高) AS 最大, MIN(残高) AS 最小,
       AVG(残高) AS 平均, COUNT(*) AS 件数
FROM 口座
GROUP BY SUBSTRING(COALESCE(CAST(更新日 AS VARCHAR), 'XXXX'), 1, 4)

--種別ごとの残高の合計とデータ件数を求める
SELECT 種別, SUM(残高) AS 合計, COUNT(*) AS 件数
FROM 口座
GROUP BY 種別
HAVING SUM(残高) > 3000000

--名義の1文字目が同じグループごとにデータ件数と名義文字数の平均を求める
SELECT SUBSTRING(名義, 1, 1) AS 名義,
COUNT(名義) AS 件数,
	AVG(LENGTH(REPLACE(名義, '　', ''))) AS 文字数の平均
FROM 口座
GROUP BY SUBSTRING(名義, 1, 1)
HAVING COUNT(名義) >= 10
OR AVG(LENGTH(REPLACE(名義, '　', ''))) > 5