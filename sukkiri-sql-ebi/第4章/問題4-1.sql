--�����������̖��׏��ɁA���ׂĂ̒����f�[�^���擾����
SELECT *
FROM ��������
ORDER BY �����ԍ�, �����}��

--2018�N1���ɒ����̂��������i���̈ꗗ�����i�����Ɏ擾����
SELECT DISTINCT ���i��
FROM ��������
WHERE ���t >= '2018-01-01'
AND ���t <= '2018-01-31'
ORDER BY ���i��

--�h�����N�̏��i��ΏۂɁA�������z�̒Ⴂ�ق�����2�`4�Ԗڂ̒����̒����ԍ��ƒ����}�ԁA�������z���擾����
SELECT �����ԍ�, �����}��, �������z
FROM ��������
WHERE ���� = '1'
ORDER BY �������z
OFFSET 1 ROWS FETCH NEXT 3 ROWS ONLY 

--���̑��̏��i�ɂ��āA2�ȏ㓯���ɍw�����ꂽ���i���擾���A���t�A���i���A�P���A���ʁA�������z���w�������ɕ\������
SELECT ���t, ���i��, �P��, ����, �������z
FROM ��������
WHERE ���� = '3'
AND ���� >= 2
ORDER BY ���t, ���� DESC

--���i�̕��ނ��ƂɁA���ށA���i���A�T�C�Y�A�P����1�̕\�Ƃ��Ď擾����
SELECT DISTINCT ����, ���i��, �T�C�Y, �P��
FROM ��������
WHERE ���� = '1'
UNION
SELECT DISTINCT ����, ���i��, NULL, �P��
FROM ��������
WHERE ���� = '2'
UNION
SELECT DISTINCT ����, ���i��, NULL, �P��
FROM ��������
WHERE ���� = '3'
ORDER BY 1, 2