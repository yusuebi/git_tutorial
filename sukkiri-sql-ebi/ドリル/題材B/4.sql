--�����ނ̏��i�ɂ��āA���i�R�[�h�A�P���A�L�����y�[�����i���擾����
SELECT ���i�R�[�h, �P��, �P�� * 0.95 AS �L�����y�[�����i
FROM ���i
WHERE ���i�敪 = '9'
ORDER BY ���i�R�[�h

--��������2018�N3��12���`14���̃N�[�|���������X�V����
UPDATE ����
SET �N�[�|�������� = �N�[�|�������� + 300
WHERE ������ >= '2018-03-12'
AND ������ < '2018-03-15'
AND ���� >= 2
AND �N�[�|�������� IS NOT NULL

--�����ԍ�2018022502250�̏��i�R�[�hW0156�̒�������1���炷
UPDATE ����
SET ���� = ���� - 1
WHERE �����ԍ� = '201802250126'
AND ���i�R�[�h = 'W0156'

--�����ԍ�201710010001�`201710319999�̃f�[�^�𒊏o����
SELECT �����ԍ� || '-' || CAST(�����}�� AS VARCHAR)
FROM ����
WHERE �����ԍ� >= '201710010001'
AND �����ԍ� <= '201710319999'

--���i�敪�̈ꗗ���擾����
SELECT DISTINCT ���i�敪 AS �敪,
       CASE ���i�敪 WHEN '1' THEN '�ߗ�'
	                 WHEN '2' THEN '�C'
					 WHEN '3' THEN '�G��'
					 WHEN '9' THEN '������' END AS �敪��
FROM ���i

--���i�R�[�h�A���i���A�P���A�̔������N�A���i�敪�𒊏o����
SELECT ���i�R�[�h, ���i��, �P��,
CASE WHEN �P�� < 3000 THEN 'S'
	WHEN �P�� >= 3000 AND �P�� < 10000 THEN 'M'
	ELSE 'L' END AS �̔����i�����N,
���i�敪 || ':' ||
CASE ���i�敪 WHEN '1' THEN '�ߗ�'
	WHEN '2' THEN '�C'
	WHEN '3' THEN '�G��'
	 WHEN '9' THEN '������' END AS ���i�敪
FROM ���i
ORDER BY �P��, ���i�R�[�h

--���i����10�����𒴉߂��鏤�i���ƕ��������擾����
SELECT ���i��, LENGTH(���i��) AS ������
FROM ���i
WHERE LENGTH(���i��) > 10
ORDER BY LENGTH(���i��)

--�������ƒ����ԍ��̈ꗗ�𒊏o����
SELECT ������, SUBSTRING(�����ԍ�, 9, 4) AS �����ԍ�
FROM ����

--���i�R�[�h��1�����ڂ�M�̏��i�̏��i�R�[�h��E�Ŏn�܂�悤�ɍX�V����
UPDATE ���i
SET ���i�R�[�h = 'E' || SUBSTRING(���i�R�[�h, 2, 4)
WHERE SUBSTRING(���i�R�[�h, 1, 1) = 'M'

--�����ԍ��̘A�ԕ�����1000�`2000�̒����ԍ��𒊏o����
SELECT SUBSTRING(�����ԍ�, 9, 4) AS �����ԍ�
FROM ����
WHERE SUBSTRING(�����ԍ�, 9, 4) >= '1000'
AND SUBSTRING(�����ԍ�, 9, 4) <= '2000'
ORDER BY SUBSTRING(�����ԍ�, 9, 4)

--���i�R�[�hS1990�̔p�ԓ����֐����g���Ė{���̓��t�ɏC������
UPDATE �p�ԏ��i
SET �p�ԓ�= CURRENT_DATE
WHERE ���i�R�[�h = 'S1990'

--�ꖜ�~�ȏ�̏��i�̈ꗗ���擾����
SELECT ���i�R�[�h, ���i��, �P��, TRUNC(�P�� * 0.7, 0) AS �l���������P��
FROM ���i
WHERE �P�� >= 10000