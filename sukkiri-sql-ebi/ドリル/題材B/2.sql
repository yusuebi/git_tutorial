--���i�R�[�h��W1252�̃f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE ���i�R�[�h = 'W1252'

--���i�R�[�h��S0023�̏��i�̒P����500�~�ɕύX����
UPDATE ���i
SET �P�� = 500
WHERE ���i�R�[�h = 'S0023'

--�P������~�ȉ��̃f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE �P�� <= 1000

--�P�����ܐ�~�ȏ�̃f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE �P�� >= 50000

--2018�N�ȍ~�̃f�[�^�𒊏o����
SELECT *
FROM ����
WHERE ������ >= '2018-01-01'


--2017�N11���ȑO�̃f�[�^�𒊏o����
SELECT *
FROM ����
WHERE ������ < '2017-12-01'

--�ߗނłȂ��f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE ���i�敪 <> '1'

--�N�[�|�������𗘗p���Ă��Ȃ��f�[�^�𒊏o����
SELECT *
FROM ����
WHERE �N�[�|�������� IS NULL

--���i�R�[�h��N�Ŏn�܂鏤�i���폜����
DELETE FROM ���i
WHERE ���i�R�[�h LIKE 'N%'

--���i���ɃR�[�g���܂܂��p�i�́A���i�R�[�h�A���i���A�P���𒊏o����
SELECT ���i�R�[�h, ���i��, �P��
FROM ���i
WHERE ���i�� LIKE '%�R�[�g%'

--�C�܂��͎G�݂������͖����ނ̏��i�̏��i�R�[�h�A���i�敪�𒊏o����
SELECT ���i�R�[�h, ���i�敪
FROM ���i
WHERE ���i�敪 IN ('2', '3', '9')

--���i�R�[�h��A0100�`A0500�ɂ��Ă͂܂�f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE ���i�R�[�h BETWEEN 'A0100' AND 'A0500'

--���i�R�[�h��N0501,N1021,N0223�̂����ꂩ�𒍕����������𒊏o����
SELECT *
FROM ����
WHERE ���i�R�[�h IN ('N0501', 'N1021', 'N0223')

--�G�݂ŏ��i���ɐ��ʂ��܂܂�鏤�i�𒊏o����
SELECT * FROM ���i
WHERE ���i�敪 = '3'
AND ���i�� LIKE '%����%'

--���i���Ɍy���܂��͂��ӂ�̂ǂ��炩���܂܂��f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE ���i�� LIKE '%�y��%'
OR ���i�� LIKE '%���ӂ�%'

--�ߗނŒP�����O��~�ȉ��܂��́A�G�݂ŒP�����ꖜ�~�ȏ�̃f�[�^�𒊏o����
SELECT *
FROM ���i
WHERE (���i�敪 = '1' AND �P�� <= 3000)
OR (���i�敪 = '3' AND �P�� >= 10000)

--2018�N3�����Ɉ�x��3�ȏ�̒������������f�[�^�𒊏o����
SELECT ���i�R�[�h
FROM ����
WHERE ������ >= '2018-03-01'
AND ������ < '2018-04-01'
AND ���� >= 3

--��x�̒�����10�ȏ㒍���������N�[�|�������𗘗p�����f�[�^�𒊏o����
SELECT *
FROM ����
WHERE ���� >= 10
OR �N�[�|�������� IS NOT NULL