--パーティのキャラクターのHPとMPについて、最大値、最小値、平均値を求める
SELECT MAX(HP) AS 最大HP, MIN(HP) AS 最小HP, AVG(HP) AS 平均HP,
       MAX(MP) AS 最大MP, MIN(MP) AS 最小MP, AVG(MP) AS 平均MP
FROM パーティー

--タイプ別にイベントの数を取得する
SELECT CASE タイプ WHEN '1' THEN '強制'
        WHEN '2' THEN 'フリー'
        WHEN '3' THEN '特殊'
       END AS タイプ,
COUNT(イベント番号) AS イベント数
FROM イベント
GROUP BY タイプ

--経験イベントテーブルから、クリアの結果別にクリアしたイベントの数を取得する
SELECT クリア結果, COUNT(イベント番号) AS イベント数
FROM 経験イベント
WHERE クリア区分 ='1'
GROUP BY クリア結果
ORDER BY クリア結果

--攻撃魔法小さな奇跡をつかった時の敵の行動を表示する
SELECT CASE WHEN SUM(MP) < 500 THEN '敵は見とれている！'
         WHEN SUM(MP) >= 500 AND
              SUM(MP) < 1000 THEN '敵は呆然としている！'
         WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している！'
       END AS 小さな奇跡
FROM パーティー

--経験イベントテーブルから、クリアしたイベント数と参加したもののまだクリアしていないイベントの数を取得する
SELECT CASE クリア区分 WHEN '1' THEN 'クリアした'
          WHEN '0' THEN '参加したがクリアしていない'
       END AS 区分,
COUNT(イベント番号) AS イベント数
FROM 経験イベント
GROUP BY クリア区分

--職業タイプごとのHPとMPの最大値、最小値、平均値を取得する
SELECT SUBSTRING(職業コード, 1, 1) AS 職業タイプ,
       MAX(HP) AS 最大HP, MIN(HP) AS 最小HP, AVG(HP) AS 平均HP,
       MAX(MP) AS 最大MP, MIN(MP) AS 最小MP, AVG(MP) AS 平均MP
FROM パーティー
GROUP BY SUBSTRING(職業コード, 1, 1)

--IDの1文字目によってパーティを分類し、HPの平均が100を超えているデータを抽出する
SELECT SUBSTRING(ID, 1, 1) AS IDによる分類,
       AVG(HP) AS HPの平均,
       AVG(MP) AS MPの平均
FROM パーティー
GROUP BY SUBSTRING(ID, 1, 1)
HAVING AVG(HP) > 100

--力の扉を開けることのできる扉の数を求める
SELECT SUM(
  CASE WHEN HP < 100 THEN 1
       WHEN HP >= 100 AND HP < 150 THEN 2
       WHEN HP >= 150 AND HP < 200 THEN 3
       WHEN HP >= 200 THEN 5 END
  ) AS 開けられる扉の数
FROM パーティー