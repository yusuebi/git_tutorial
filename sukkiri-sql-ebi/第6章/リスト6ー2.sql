--様々な集計をする
SELECT
    SUM(出金額) AS 合計出金額,
	AVG(出金額) AS 平均出金額,
	MAX(出金額) AS 最も大きな散財,
	MIN(出金額) AS もっとも少額の支払い
FROM 家計簿