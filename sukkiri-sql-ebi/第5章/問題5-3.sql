--依頼された文字は何文字か求める
UPDATE 受注
SET 文字数 = LENGTH(REPLASE(文字, ' ',''))

--受注内容一覧を表示する
SELECT 受注日,受注ID,文字数
       CASE COALESCE(書体コード '1')
	      WHEN '1' THEN 'ブロック体'
		  WHEN '2' THEN '筆記体'
		  WHEN '3' THEN '草書体' END AS 書体名,
	   CASE COALESCE(書体コード '1')
	      WHEN '1' THEN 100
		  WHEN '2' THEN 150
		  WHEN '3' THEN 200 END AS 単価,
	   CASE WHEN 文字数 > 10 THEN 500
	   ELSE 0 END AS 特別加工料金
FROM 受注

--文字の変更依頼内容に合わせて更新する
UPDATE 受注
SET 文字 = REPLACE(文字,' ','★')
WHERE 受注ID = '113'