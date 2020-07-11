--口座番号順にすべてのデータを抽出する
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座
ORDER BY 口座番号

--名義一覧を取得する
SELECT DISTINCT 名義
FROM 口座
ORDER BY 名義

--残高の大きい順にすべてのデータを抽出する
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座
ORDER BY 4 DESC, 1

--更新日を過去の日付中に10件抽出する
SELECT 更新日
FROM 口座
WHERE 更新日 IS NOT NULL
ORDER BY 更新日
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--更新日と残高を残高の小さい順に11～20件のみ抽出する
SELECT 更新日, 残高
FROM 口座
WHERE 残高 > 0
AND 更新日 IS NOT NULL
ORDER BY 残高, 更新日 DESC
OFFSET 10
FETCH FIRST 10 ROWS ONLY

--口座番号を口座番号順に抽出する
SELECT 口座番号
FROM 口座
UNION
SELECT 口座番号
FROM 廃止口座
ORDER BY 1

--廃止口座テーブルには存在しない名義を抽出する
SELECT 名義
FROM 口座
EXCEPT
SELECT 名義
FROM 廃止口座
ORDER BY 1 DESC

--口座テーブルと廃止口座テーブル両方に登録されている名義を抽出する
SELECT 名義
FROM 口座
INTERSECT
SELECT 名義
FROM 廃止口座
ORDER BY 1

--口座番号と残高の一覧を取得する
SELECT 口座番号, 残高
FROM 口座
WHERE 残高 = 0
UNION
SELECT 口座番号, 解約時残高
FROM 廃止口座
WHERE 解約時残高 <> 0
ORDER BY 1

--口座番号と名義の一覧を取得する、有効な口座には〇廃止した口座には×をつける
SELECT 口座番号, 名義, '○' AS 口座区分
FROM 口座
UNION
SELECT 口座番号, 名義, '×' AS 口座区分
FROM 廃止口座
ORDER BY 名義