--�����e�[�u����������ԍ���0037651�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �����ԍ� = '0037651'

--�c����0���傫���f�[�^�𒊏o����
SELECT * FROM ����
WHERE �c�� > 0

--�����ԍ���1000000���O�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �����ԍ� < '1000000'

--�X�V����2017�N�ȑO�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �X�V�� < '2018-01-01'

--�c����100���~�ȏ�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �c�� >= 1000000

--��ʂ����ʂł͂Ȃ��f�[�^�𒊏o����
SELECT * FROM ����
WHERE ��� <> '1'

--�X�V�����o�^����Ă��Ȃ��f�[�^�𒊏o����
SELECT * FROM ����
WHERE �X�V�� IS NULL

--���`�Ƀn�V���܂ރf�[�^�𒊏o����
SELECT * FROM ����
WHERE ���` LIKE '%�n�V%'

--�X�V����2018�N1���̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �X�V�� BETWEEN '2018-01-01' AND '2018-01-31'

--��ʂ������܂��͕ʒi�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE ��� IN ('2', '3')

--���`���T�J�^�@�����E�w�C,�}�c���g�@�~���R,�n�}�_�@�T�g�V�̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE ���` IN ('�T�J�^�@�����E�w�C', '�}�c���g�@�~���R', '�n�}�_�@�T�g�V')

--�X�V����2017�N12��30������2018�N1��4���̃f�[�^�𒊏o����
SELECT * FROM ����
WHERE �X�V�� >= '2017-12-30'
AND �X�V�� < '2018-01-05'

--�c����1���~�����ōX�V�����o�^����Ă���f�[�^�𒊏o����
SELECT * FROM ����
WHERE �c�� < 10000
AND �X�V�� IS NOT NULL

--�����ԍ���2000000�ԑ�܂��͖��`�̐����G����n�܂�3�����Ŗ����R�ŏI���f�[�^�𒊏o����
SELECT * FROM ����
WHERE �����ԍ� LIKE '2______'
AND ���`�@LIKE '�G__�@%�R'