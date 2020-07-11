--IDがC02のデータを抽出する
SELECT *
FROM パーティー
WHERE ID = 'C02'

--IDがA01のHPを120に更新する
UPDATE パーティー
SET HP = 120
WHERE ID = 'A01'

--HPが100未満のデータについてID、名称、HPの一覧を抽出する
SELECT ID, 名称, HP
FROM パーティー
WHERE HP < 100

--MPが100以上のデータについてID、名称、MPの一覧を抽出する
SELECT ID, 名称, MP
FROM パーティー
WHERE MP >= 100

--タイプが特殊でないデータについて、イベント番号、イベント名称、タイプの一覧を抽出する
SELECT イベント番号, イベント名称, タイプ
FROM イベント
WHERE タイプ <> '3'

--イベント番号が5以下のデータについて、イベント番号とイベント名称を抽出する
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 <= 5

--イベント番号が20を超過しているデータについて、イベント番号とイベント名称を抽出する
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 > 20

--別のイベントのクリアを前提としないイベントについて、イベント番号とイベント名称を抽出する
SELECT イベント番号, イベント名称
FROM イベント
WHERE 前提イベント番号 IS NULL

--次に発生するイベントが決められているイベントについて、イベント番号、イベント名称、後続イベント番号を抽出する
SELECT イベント番号, イベント名称, 後続イベント番号
FROM イベント
WHERE 後続イベント番号 IS NOT NULL

--名称にミが含まれるパーティテーブルのデータについて、状態コードを眠りに更新する
UPDATE パーティー
SET 状態コード = '01'
WHERE 名称 LIKE '%ミ%'

--HPが120〜160の範囲にあるデータについてID、名称、HPの一覧を抽出する
SELECT ID, 名称, HP
FROM パーティー
WHERE HP BETWEEN 120 AND 160

--職業が勇者、戦士、武闘家のいずれかであるデータについて、名称と職業コードを抽出する
SELECT 名称, 職業コード
FROM パーティー
WHERE 職業コード IN ('01', '10', '11')

--状態コードが異常なしと気絶のどちらでもないデータについて、名称と状態コードを抽出する
SELECT 名称, 状態コード
FROM パーティー
WHERE 状態コード NOT IN ('00', '09')

--HPとMPがともに100を超えているデータを抽出する
SELECT *
FROM パーティー
WHERE HP > 100
AND MP > 100

--IDがAで始まり、職業コードの1文字目が2であるデータを抽出する
SELECT *
FROM パーティー
WHERE ID LIKE 'A%'
AND 職業コード LIKE '2%'

--タイプが強制で事前にクリアが必要なイベントでかつ次に発生するイベントが設定されているデータを抽出する
SELECT *
FROM イベント
WHERE タイプ ='1'
AND 前提イベント番号 IS NOT NULL
AND 後続イベント番号 IS NOT NULL