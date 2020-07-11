--4月の家計簿に関するさまざまなSQL文の実行
SELECT *
FROM 家計簿
WHERE 日付 >= '2018-04-01'
AND 日付 <= '2018-04-30';
SELECT DISTINCT 費目ID
FROM 家計簿
WHERE 日付 >= '2018-04-01'
AND 日付 <= '2018-04-30';