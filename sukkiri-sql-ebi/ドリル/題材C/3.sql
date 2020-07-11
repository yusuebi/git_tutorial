--パーティの現在の状態コードの一覧を取得する
SELECT DISTINCT 状態コード
FROM パーティー

--IDと名称をIDの昇順に抽出する
SELECT ID, 名称
FROM パーティー
ORDER BY ID

--名称と職業コードを名称の降順に抽出する
SELECT 名称, 職業コード
FROM パーティー
ORDER BY 名称 DESC

--名称、HP、状態コードを状態コードの昇順かつHPの高い順に抽出する
SELECT 名称, HP, 状態コード
FROM パーティー
ORDER BY 状態コード, HP DESC

--タイプ、イベント番号、イベント名称、前提イベント番号、後続イベント番号をタイプの昇順かつイベント番号の昇順に抽出する
SELECT タイプ, イベント番号, イベント名称, 前提イベント番号, 後続イベント番号
FROM イベント
ORDER BY 1, 2

--HPの高い順に3件抽出する
SELECT *
FROM パーティー
ORDER BY HP DESC
OFFSET 0
FETCH FIRST 3 ROWS ONLY

--MPが3番目に高いデータを抽出する
SELECT *
FROM パーティー
ORDER BY MP DESC
OFFSET 2
FETCH FIRST 1 ROWS ONLY

--一覧を抽出する
SELECT CASE WHEN 職業コード LIKE '1%' THEN 'S'
            WHEN 職業コード LIKE '2%' THEN 'M'
            ELSE 'A'
       END AS 職業区分,
職業コード, ID, 名称
FROM パーティー
ORDER BY 職業コード

--イベントテーブルと経験イベントテーブルから、まだ参加していないイベントの番号を抽出する
SELECT イベント番号
FROM イベント
EXCEPT
SELECT イベント番号
FROM 経験イベント
ORDER BY 1

--イベントテーブルと経験イベントテーブルから、すでにクリアされたイベントのうちタイプがフリーのイベント番号を抽出する
SELECT イベント番号
FROM 経験イベント
WHERE クリア区分 ='1'
INTERSECT
SELECT イベント番号
FROM イベント
WHERE タイプ ='2'