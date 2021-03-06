--年間降水量と、年間の最高気温・最低気温の平均
SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測

--東京の年間降水量と、年間の最高気温・最低気温の平均
SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測
WHERE 都市名 = '東京'

--各都市の降水量平均と、最も低かった最高気温、最も高った最低気温
SELECT AVG(降水量), MIN(最高気温), MAX(最低気温)
FROM 都市別気象観測
GROUP BY 都市名

--月別の降水量、最高気温、最低気温の平均
SELECT AVG(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測
GROUP BY 月

--1年間で最も高い最高気温が38度以上を記録した月のある都市名とその気温
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MAX(最高気温) >= 38

--1年間で最も低い最低気温が-10度以下を記録した月のある都市とその気温
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10