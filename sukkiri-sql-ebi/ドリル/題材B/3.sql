--�ߗނ̏��i�ɂ��āA���i�R�[�h�̍~���ɏ��i�R�[�h�Ə��i���̈ꗗ���擾����
SELECT ���i�R�[�h, ���i��
FROM ���i
WHERE ���i�敪 = '1'
ORDER BY ���i�R�[�h DESC

--��L�[�̏�����2018�N3���ȍ~�̒������擾����
SELECT ������, �����ԍ�, �����}��, ���i�R�[�h, ����
FROM ����
WHERE ������ >= '2018-03-01'
ORDER BY ������, �����ԍ�, �����}��

--����܂Œ����̂������f�[�^�𒊏o����
SELECT DISTINCT ���i�R�[�h
FROM ����
ORDER BY ���i�R�[�h

--�����̂��������t��V��������10�s���o����
SELECT ������
FROM ����
ORDER BY ������ DESC
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--�P���̒Ⴂ����6�`20�s�ڂ̃f�[�^�𒊏o����
SELECT *
FROM ���i
ORDER BY �P��, ���i�敪, ���i�R�[�h
OFFSET 5
FETCH FIRST 15 ROWS ONLY

--2016�N12���ɔp�����ꂽ���̂ƁA����グ����100�𒴂�����̂𒊏o����
SELECT *
FROM �p�ԏ��i
WHERE �p�ԓ� >= '2016-12-01'
AND �p�ԓ� < '2017-01-01'
UNION
SELECT *
FROM �p�ԏ��i
WHERE ����� > 100
ORDER BY 6 DESC

--����܂łɒ������ꂽ���Ƃ̂Ȃ����i�R�[�h�������ɒ��o����
SELECT ���i�R�[�h
FROM ���i
EXCEPT
SELECT ���i�R�[�h
FROM ����
ORDER BY 1

--����܂łɒ������ꂽ���т̂��鏤�i�R�[�h�������ɒ��o����
SELECT ���i�R�[�h
FROM ���i
INTERSECT
SELECT ���i�R�[�h
FROM ����
ORDER BY 1 DESC

--�����ނŒP������~�ȉ��ƈꖜ�~�𒴂��鏤�i�ɂ��āA���i�R�[�h�A���i���A�P���𒊏o����
SELECT ���i�R�[�h, ���i��, �P��
FROM ���i
WHERE ���i�敪 = '9'
AND �P�� <= 1000
UNION
SELECT ���i�R�[�h, ���i��, �P��
FROM ���i
WHERE ���i�敪 = '9'
AND �P�� > 10000
ORDER BY 3, 1