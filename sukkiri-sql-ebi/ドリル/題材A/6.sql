--������̎�����ʂ������e�[�u���c���ɔ��f����
UPDATE ����
SET �c�� = �c�� + (SELECT COALESCE(SUM(�����z) - SUM(�o���z), 0)
       FROM ���
       WHERE �����ԍ� = '0351333'
       AND ���t = '2018-01-11'),
�X�V�� = '2018-01-11'
WHERE �����ԍ� = '0351333'

--���݂̎c���ƁA������ɔ�����������ɂ����o���z���ꂼ��̍��v���z���擾����B
SELECT �c��,
(SELECT SUM(�����z)
  FROM ���
  WHERE �����ԍ� = '1115600'
  AND ���t     = '2017-12-28') AS �����z���v,
(SELECT SUM(�o���z)
  FROM ���
  WHERE �����ԍ� = '1115600'
  AND ���t     = '2017-12-28') AS �o���z���v
FROM ����
WHERE �����ԍ� = '1115600'

--1��̎����100���~�ȏ�̓����������������ɂ��āA�����ԍ��A���`�A�c�����擾����
SELECT �����ԍ�, ���`, �c��
FROM ����
WHERE �����ԍ� IN (SELECT �����ԍ�
FROM ���
WHERE �����z >= 1000000)

--����e�[�u���̓��t���������̍X�V�����������e�[�u���̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �X�V�� >ALL (SELECT ���t FROM ���)

--�����Əo���̗����������������t�𒊏o����
SELECT A. ���t,
       (SELECT MAX(�����z) FROM ��� WHERE �����ԍ� = '3104451') AS �ő�����z,
       (SELECT MAX(�o���z) FROM ��� WHERE �����ԍ� = '3104451') AS �ő�o���z
  FROM (SELECT ���t
          FROM ���
         WHERE �����ԍ� = '3104451'
         GROUP BY ���t
        HAVING SUM(�����z) > 0 AND SUM(�o���z) > 0) AS A
        
--���₢���킹���g���Č����e�[�u������p�~�����e�[�u���Ƀf�[�^�𒊏o����
INSERT INTO �p�~����
SELECT * FROM ����
WHERE �����ԍ� = '2761055';
DELETE FROM ����
WHERE �����ԍ� = '2761055';