--�E�҂�HP�̊����𒲂ׂ�
SELECT ���� AS �Ȃ܂�, HP AS ���݂�HP,
       ROUND(CAST(HP AS NUMERIC) / (SELECT SUM(HP) FROM �p�[�e�B�[) * 100, 1) AS �p�[�e�B�[�ł̊���
FROM �p�[�e�B�[
WHERE �E�ƃR�[�h = '01'

--���@�g����MP���X�V����
UPDATE �p�[�e�B�[
SET MP = MP + (SELECT ROUND(SUM(MP * 0.1))
               FROM �p�[�e�B�[
               WHERE �E�ƃR�[�h <> '20')
WHERE �E�ƃR�[�h = '20'

--�o���C�x���g�e�[�u�����炱��܂łɃN���A�����C�x���g�̂����^�C�v�������܂��͓���ł�����̂𒊏o����
SELECT �C�x���g�ԍ�, �N���A����
FROM �o���C�x���g
WHERE �N���A�敪 = '1'
AND �C�x���g�ԍ� IN (SELECT �C�x���g�ԍ�
                     FROM �C�x���g
                     WHERE �^�C�v IN ('1', '3'))

--�p�[�e�B���ōł�����MP�����L�����N�^�[���Ƃ���MP�𒊏o����
SELECT ����, MP
FROM �p�[�e�B�[
WHERE MP = (SELECT MAX(MP)
            FROM �p�[�e�B�[)

--����܂łɒ��肵�Ă��Ȃ��C�x���g�̐��𒊏o����
SELECT COUNT(*) AS ������C�x���g�̐�
FROM (SELECT �C�x���g�ԍ�
      FROM �C�x���g 
EXCEPT
SELECT �C�x���g�ԍ�
FROM �o���C�x���g) AS SUB

--5�ԖڂɃN���A�����C�x���g�̃C�x���g�ԍ������������ԍ��������ׂẴC�x���g�ɂ��āA�C�x���g�ԍ��ƃC�x���g���̂𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����
FROM �C�x���g
WHERE �C�x���g�ԍ� <ALL (SELECT �C�x���g�ԍ�
                     FROM �o���C�x���g
                     WHERE ���[�g�ԍ� = 5)

--����܂łɃN���A�����C�x���g��O��Ƃ��Ă���C�x���g�̈ꗗ�𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����, �O��C�x���g�ԍ�
FROM �C�x���g
WHERE �O��C�x���g�ԍ� =ANY (SELECT �C�x���g�ԍ�
                            FROM �o���C�x���g
                           WHERE �N���A�敪 = '1')


--�o���C�x���g�e�[�u�����X�V����
UPDATE �o���C�x���g
SET �N���A�敪 = '1',
    �N���A���� = 'B'
WHERE �C�x���g�ԍ� = 9;
INSERT INTO �o���C�x���g
VALUES ((SELECT �C�x���g�ԍ� FROM �C�x���g WHERE �O��C�x���g�ԍ� = 9),
        '0', NULL,
        SELECT MAX(���[�g�ԍ�) + 1 FROM �o���C�x���g));