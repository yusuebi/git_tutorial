--1���̃f�[�^���A�[�J�C�u�e�[�u���Ɉړ�����
BEGIN;
--����1�F�A�[�J�C�u�e�[�u���ɃR�s�[
INSERT INTO �ƌv��A�[�J�C�u
SELECT *
FROM �ƌv��
WHERE ���t <= '2018-01-31';
--����2�F�ƌv��e�[�u������폜
DELETE FROM �ƌv��
WHERE ���t <= '2018-01-31';
COMMIT;