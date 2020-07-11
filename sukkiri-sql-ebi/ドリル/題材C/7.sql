--すでにクリアしたイベントを抽出する
SELECT E.ルート番号, E.イベント番号, M.イベント名称, E.クリア結果
FROM 経験イベント E
JOIN イベント M
ON E.イベント番号 = M.イベント番号
WHERE クリア区分 = '1'
ORDER BY E.ルート番号

--イベントテーブルから、タイプ強制のイベントについて、イベント番号とイベント名称、パーティのクリア区分を抽出する
SELECT M.イベント番号, M.イベント名称, E.クリア区分
FROM イベント M
JOIN 経験イベント E
ON M.イベント番号 = E.イベント番号
WHERE タイプ ='1'

--未着手のイベントを抽出する
SELECT M.イベント番号, M.イベント名称, COALESCE(E.クリア区分, '未クリア') AS クリア区分
FROM イベント M
LEFT JOIN 経験イベント E
     ON M.イベント番号 = E.イベント番号
WHERE タイプ ='1'

--現在パーティに参加しているキャラクターの一覧をID順に抽出する
SELECT P.ID, P.名称 AS なまえ,
       S.コード名称 AS 職業, J.コード名称 AS 状態
FROM パーティー P
JOIN (SELECT コード値, コード名称
      FROM コード
      WHERE コード種別 ='1') S
ON P.職業コード = S.コード値
JOIN (SELECT コード値, コード名称
      FROM コード
      WHERE コード種別 ='2') J
ON P.状態コード = J.コード値
ORDER BY ID

--現在パーティに参加しているキャラクターの一覧を抽出する
SELECT P.ID,
       COALESCE(P.名称, '仲間になっていない！') AS なまえ,
       S.コード名称 AS 職業
FROM パーティー P
RIGHT JOIN (SELECT コード値, コード名称
            FROM コード
            WHERE コード種別 ='1') S
ON P.職業コード = S.コード値

--経験イベントテーブルから、参加済みイベントのクリア結果一覧を抽出する
SELECT E.イベント番号, E.クリア区分,
       C.コード値 || '：' || C.コード名称 AS クリア結果
FROM 経験イベント E
FULL JOIN (SELECT コード値, コード名称
           FROM コード
           WHERE コード種別 ='4') C
ON E.クリア結果 = C.コード値

--イベントテーブルから、前提イベントがセ呈されているイベントを抽出する
SELECT E1.イベント番号, E1.イベント名称,
       E1.前提イベント番号, E2.イベント名称 AS 前提イベント名称
FROM イベント E1
JOIN イベント E2
ON E1.前提イベント番号 = E2.イベント番号
WHERE E1.前提イベント番号 IS NOT NULL

--イベントテーブルから前提イベントまたは後続イベントが設定されているイベントを抽出する
SELECT E1.イベント番号, E1.イベント名称,
       E1.前提イベント番号, E2.イベント名称 AS 前提イベント名称,
       E1.後続イベント番号, E3.イベント名称 AS 後続イベント名称
FROM イベント E1
LEFT JOIN イベント E2
     ON E1.前提イベント番号 = E2.イベント番号
LEFT JOIN イベント E3
     ON E1.後続イベント番号 = E3.イベント番号
WHERE E1.前提イベント番号 IS NOT NULL
OR E1.後続イベント番号 IS NOT NULL

--ほかのイベントの前提となっているイベントを抽出する
SELECT E.イベント番号, E.イベント名称, Z.前提イベント数 
FROM イベント E
JOIN (SELECT 前提イベント番号,
      COUNT(前提イベント番号) AS 前提イベント数
FROM イベント
WHERE 前提イベント番号 IS NOT NULL
GROUP BY 前提イベント番号) Z
ON E.イベント番号 = Z.前提イベント番号
ORDER BY E.イベント番号