--現在入室中の社員数を取得する
SELECT COUNT(*) AS 社員数
FROM 入退室管理
WHERE 退室 IS NULL

--社員ごとの入室回数を、回数の多い順に取得する
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
ORDER BY 2 DESC

--事由区分ごとの入室回数を取得。事由区分はわかりやすい表記とする
SELECT CASE 事由区分 WHEN '1' THEN 'メンテナンス'
                     WHEN '2' THEN 'リリース作業'
					 WHEN '3' THEN '障害対応'
					 WHEN '9' THEN 'その他'
	   END AS 事由,
	   COUNT (*) AS 入室回数
FROM 入退室管理
GROUP BY 事由区分

--入室回数が10回を超過する社員について、社員名と入室回数を取得する
SELECT 社員名, COUNT(*) 入室回数
FROM 入退室管理
GROUP BY 社員名
HAVING COUNT(*) > 10

--障害が発生した日付とそれぞれの障害に対応した社員数を取得する
SELECT 日付, COUNT(社員名) AS 対応社員数
FROM入退室管理
WHERE 事由区分 = '3'
GROUP BY日付