--アイテム勇気の鈴を装備したときのキャラクターのHPを適切な列を用いて取得する
SELECT 名称 AS なまえ, HP AS 現在のHP, HP + 50 AS 装備後のHP
FROM パーティー
WHERE 職業コード IN ('11', '21')

--IDA01とA03のMPを更新する
UPDATE パーティー
SET MP = MP + 20
WHERE ID IN ('A01', 'A03')

--武闘家のスッキリパンチは自分のHPを2倍したポイントのダメージを与える
SELECT 名称 AS なまえ, HP AS 現在のHP, HP * 2 AS 予想されるダメージ
FROM パーティー
WHERE 職業コード = '11'

--パーティーにいるキャラクターの状況について、適切な列を用いて別名で一覧を取得する
SELECT 名称 AS なまえ, HP || '／' || MP AS HPとMP,
  CASE 状態コード WHEN '00' THEN NULL
     WHEN '01' THEN '眠り'
     WHEN '02' THEN '毒'
     WHEN '03' THEN '沈黙'
     WHEN '04' THEN '混乱'
     WHEN '09' THEN '気絶'
  END AS ステータス
FROM パーティー

--イベント一覧を取得する
SELECT イベント番号, イベント名称,
  CASE タイプ WHEN '1' THEN '強制'
       WHEN '2' THEN 'フリー'
       WHEN '3' THEN '特殊'
  END AS タイプ,
  CASE WHEN イベント番号 >= 1 AND イベント番号 <=10 THEN '序盤'
       WHEN イベント番号 >= 11 AND イベント番号 <=17 THEN '中盤'
       ELSE '終盤'
  END AS 発生時期
FROM イベント

--攻撃を受けた時のキャラクターの予想ダメージを求める
SELECT 名称 AS なまえ, HP AS 現在のHP,
       LENGTH(名称) * 10 AS 予想ダメージ
FROM パーティー

--状態コードを更新する
UPDATE パーティー
SET 状態コード = '04'
WHERE HP % 4 = 0
OR MP % 4 = 0;

--アイテムを購入した際の支払った金額を求める
SELECT TRUNC(777 * 0.7, 0) AS 支払った金額

--HPとMPを更新する
UPDATE パーティー
SET HP = ROUND(HP * 1.3, 0),
    MP = ROUND(MP * 1.3, 0)

--3回攻撃した際の攻撃ポイントを取得する
SELECT 名称 AS なまえ, HP,
       POWER(HP, 0) AS 攻撃1回目,
       POWER(HP, 1) AS 攻撃2回目,
       POWER(HP, 2) AS 攻撃3回目
FROM パーティー
WHERE 職業コード = '10'

--主人公のパーティにいるキャラクターの状況を取得する
SELECT 名称 AS なまえ, HP,　状態コード,
  CASE WHEN HP <= 50 THEN 3 + CAST(状態コード AS INTEGER)
       WHEN HP >= 51 AND HP <= 100 THEN 2 + CAST(状態コード AS INTEGER)
       WHEN HP >= 101 AND HP <= 150 THEN 1 + CAST(状態コード AS INTEGER)
       ELSE CAST(状態コード AS INTEGER) 
  END AS リスク値
FROM パーティー
ORDER BY リスク値 DESC, HP

--イベント一覧をイベント番号順に取得する
SELECT COALESCE(CAST(前提イベント番号 AS VARCHAR), '前提なし') AS 前提イベント番号,
       イベント番号,
       COALESCE(CAST(後続イベント番号 AS VARCHAR), '後続なし') AS 後続イベント番号
FROM イベント
ORDER BY イベント番号