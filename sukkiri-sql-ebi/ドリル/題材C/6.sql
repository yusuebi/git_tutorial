--勇者のHPの割合を調べる
SELECT 名称 AS なまえ, HP AS 現在のHP,
       ROUND(CAST(HP AS NUMERIC) / (SELECT SUM(HP) FROM パーティー) * 100, 1) AS パーティーでの割合
FROM パーティー
WHERE 職業コード = '01'

--魔法使いのMPを更新する
UPDATE パーティー
SET MP = MP + (SELECT ROUND(SUM(MP * 0.1))
               FROM パーティー
               WHERE 職業コード <> '20')
WHERE 職業コード = '20'

--経験イベントテーブルからこれまでにクリアしたイベントのうちタイプが強制または特殊であるものを抽出する
SELECT イベント番号, クリア結果
FROM 経験イベント
WHERE クリア区分 = '1'
AND イベント番号 IN (SELECT イベント番号
                     FROM イベント
                     WHERE タイプ IN ('1', '3'))

--パーティ内で最も高いMPを持つキャラクター名とそのMPを抽出する
SELECT 名称, MP
FROM パーティー
WHERE MP = (SELECT MAX(MP)
            FROM パーティー)

--これまでに着手していないイベントの数を抽出する
SELECT COUNT(*) AS 未着手イベントの数
FROM (SELECT イベント番号
      FROM イベント 
EXCEPT
SELECT イベント番号
FROM 経験イベント) AS SUB

--5番目にクリアしたイベントのイベント番号よりも小さい番号を持つすべてのイベントについて、イベント番号とイベント名称を抽出する
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 <ALL (SELECT イベント番号
                     FROM 経験イベント
                     WHERE ルート番号 = 5)

--これまでにクリアしたイベントを前提としているイベントの一覧を抽出する
SELECT イベント番号, イベント名称, 前提イベント番号
FROM イベント
WHERE 前提イベント番号 =ANY (SELECT イベント番号
                            FROM 経験イベント
                           WHERE クリア区分 = '1')


--経験イベントテーブルを更新する
UPDATE 経験イベント
SET クリア区分 = '1',
    クリア結果 = 'B'
WHERE イベント番号 = 9;
INSERT INTO 経験イベント
VALUES ((SELECT イベント番号 FROM イベント WHERE 前提イベント番号 = 9),
        '0', NULL,
        SELECT MAX(ルート番号) + 1 FROM 経験イベント));