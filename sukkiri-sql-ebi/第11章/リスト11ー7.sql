--4月に関する家計簿データのみを持つビューを作成
CREATE VIEW 家計簿4月 AS
SELECT *
FROM 家計簿
WHERE 日付 >= '2018-04-01'
AND 日付 <= '2018-04-30'