--1月のデータをアーカイブテーブルに移動する
BEGIN;
--処理1：アーカイブテーブルにコピー
INSERT INTO 家計簿アーカイブ
SELECT *
FROM 家計簿
WHERE 日付 <= '2018-01-31';
--処理2：家計簿テーブルから削除
DELETE FROM 家計簿
WHERE 日付 <= '2018-01-31';
COMMIT;