--残高が100万円以上の口座番号と残高を抽出する
SELECT 口座番号, 残高 / 1000
AS 千円単位の残高
FROM 口座
WHERE 残高 >= 1000000

--口座テーブルに3つのデータを登録する
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2018-04-01');
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2018-04-02');
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2018-04-03');

--登録したデータを修正する
UPDATE 口座
SET 残高 = (残高 - 3000) * 1.003
WHERE 口座番号 IN ('0652281','1026413', '2239710')

--更新日が2016年以前のデータを対象に口座番号、更新日、通帳期限日を抽出する
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
FROM 口座
WHERE 更新日 < '2017-01-01'

--種別が別段のデータについて口座番号と名義を抽出する
SELECT DISTINCT 種別 AS 種別コード,
CASE 種別 WHEN '1' THEN '普通'
	WHEN '2' THEN '当座'
	WHEN '3' THEN '別段' END AS 種別名
FROM 口座

--登録されている種別の一覧を取得する
SELECT DISTINCT 種別 AS 種別コード,
CASE 種別 WHEN '1' THEN '普通'
	WHEN '2' THEN '当座'
	WHEN '3' THEN '別段' END AS 種別名
FROM 口座

--口座番号、名義、残高ランクを取得する
SELECT 口座番号, 名義,
CASE WHEN 残高 < 100000 THEN 'C'
	WHEN 残高 >= 100000
	 AND 残高 < 1000000 THEN 'B'
	ELSE 'A' END AS 残高ランク
FROM 口座

--口座番号、名義残高の文字数を抽出する
SELECT LENGTH(口座番号), LENGTH(REPLACE(名義, '　', '')), LENGTH(CAST(残高 AS VARCHAR))
FROM 口座

--名義の1～5文字目にカワが含まれるデータを抽出する
SELECT *
FROM 口座
WHERE SUBSTRING(名義, 1, 5) LIKE '%カワ%'

--残高の桁数が4桁以上で、1000円未満の端数のないデータを抽出する
SELECT *
FROM 口座
WHERE LENGTH(CAST(残高 AS VARCHAR)) >= 4
AND SUBSTRING(CAST(残高 AS VARCHAR), LENGTH(CAST(残高 AS VARCHAR))-2, 3) = '000'

--口座番号、残高、理想を残高の降順に抽出する
SELECT 口座番号, 残高, TRUNC(残高 * 0.0002, 0) AS 利息
FROM 口座
ORDER BY 残高 DESC

--口座番号、残高、残高利息を抽出する
SELECT 口座番号, 残高,
CASE WHEN 残高 < 500000 THEN TRUNC(残高 * 0.0001, 0)
	WHEN 残高 >= 500000
	 AND 残高 < 2000000 THEN TRUNC(残高 * 0.0002, 0)
	WHEN 残高 >= 2000000 THEN TRUNC(残高 * 0.0003, 0)
	  END AS 残高別利息
FROM 口座
ORDER BY 残高別利息 DESC, 口座番号

--口座テーブルに3つのデータを登録する
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE);
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('1015513', 'アキツ　ジュンジ', '1', 88463, CURRENT_DATE);
INSERT INTO 口座(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('1739298', 'ホシノ　サトミ', '1', 704610, CURRENT_DATE);

--更新日が2018年以降のデータを抽出する
SELECT 口座番号, 名義, 種別, 残高,
SUBSTRING(CAST(更新日 AS VARCHAR), 1, 4) || '年' ||
SUBSTRING(CAST(更新日 AS VARCHAR), 6, 2) || '月' ||
SUBSTRING(CAST(更新日 AS VARCHAR), 9, 2) || '日' AS 更新日
FROM 口座
WHERE 更新日 >= '2018-01-01'

--更新日を抽出する。更新日が設定されていない場合は設定なしと表記する
SELECT COALESCE(CAST(更新日 AS VARCHAR), '設定なし') AS 更新日
FROM 口座