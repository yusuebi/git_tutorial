--学部テーブルから理学部の廃止と学生の所属変更を行う
BEGIN;
UPDATE 学生
SET 学部ID = 'K'
WHERE 学部ID = 'R';
DELETE FROM 学部
WHERE ID = 'R'
COMMIT;