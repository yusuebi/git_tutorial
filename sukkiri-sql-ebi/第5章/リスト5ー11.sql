--費目列の1～3文字目に「費」があるものだけを抽出する
SELECT *
FROM 家計簿
WHERE SUBSTRING(費目,1,3) LIKE '%費%'