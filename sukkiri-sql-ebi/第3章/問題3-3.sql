--�o�^����Ă���S�f�[�^���擾���A�e�[�u���̓��e���m�F����
SELECT *
FROM ���ѕ\

--�w���ƉȖڂ�ǉ�����
/* �w�Дԍ�S001 */
INSERT INTO ���ѕ\
VALUES ('S002','�D�c�@�M��',77,55,80,75,93,NULL)

/* �w�Дԍ�A002 */
INSERT INTO ���ѕ\
VALUES ('A002','�L�b�@�G�g',64,69,70,0,59,NULL)

/* �w�Дԍ�E003 */
INSERT INTO ���ѕ\
VALUES ('E003','����@�ƍN',80,83,85,90,79,NULL)

--�w�Дԍ�S001�̊w���̖@�w��85,�N�w��67�ɏC������
UPDATE ���ѕ\
SET �@�w = 85,
    �N�w = 67
WHERE �w�Дԍ� = 'S001'

--�w�Дԍ�A002�̊w���Ɗw�Дԍ�E003�̊w���̊O�����81�ɏC������
UPDATE ���ѕ\
SET �O���� = 81
WHERE �w�Дԍ� IN ('A002','E003')

--���[���ɂ���đ������т��X�V����
/* �S�Ȗڂ�80�ȏ�̊w���́uA�v */
UPDATE ���ѕ\
SET �������� = 'A'
WHERE �@�w >= 80
AND �o�ϊw >= 80
AND �N�w >= 80
AND ��񗝘_ >= 80
AND �O����

/* �@�w�A�O����̂ǂ��炩��80�ȏ�Ōo�ϊw�A�N�w�̂ǂ��炩��80�ȏ�̊w���́uB�v�@*/
UPDATE ���ѕ\
SET �������� = 'B'
WHERE (�@�w >= 80
OR �O���� >= 80)
AND (�o�ϊw >= 80
OR �N�w >= 80)
AND �����]�� IS NULL

/* �S�Ȗڂ�50�����̊w���́uD�v */
UPDATE ���ѕ\
SET �������� = 'D'
WHERE �@�w < 50
AND �o�ϊw <50
AND �N�w < 50
AND ��񗝘_ < 50
AND �O���� <50
AND �������� IS NULL

/* ����ȊO�̊w�����uC�v */
UPDATE ���ѕ\
SET �������� = 'C'
WHERE �������� IS NULL

--�����ꂩ�̉Ȗڂ�0������w�����A���ѕ\�e�[�u������폜����
DELETE FROM ���ѕ\
WHERE �@�w = 0
OR �o�ϊw = 0
OR �N�w = 0
OR ��񗝘_ = 0
OR �O���� = 0