--�����ԍ��A�����}�ԁA���i�R�[�h�A���i���A���ʂ̈ꗗ�𒍕��ԍ��y�ђ����}�Ԃ̏��ɒ��o����
SELECT T.�����ԍ�, T.�����}��, T.���i�R�[�h, S.���i��, T.����
FROM ���� AS T
JOIN ���i AS S
ON T.���i�R�[�h = S.���i�R�[�h
WHERE T.�����ԍ� = '201801130115'
ORDER BY T.�����ԍ�, T.�����}��

--�p�����a��ɒ������ꂽ�������𒊏o����
SELECT T.������, T.�����ԍ�, T.�����}��, T.����,
       H.�P�� * T.���� AS �������z
FROM ���� AS T
JOIN �p�ԏ��i AS H
ON T.���i�R�[�h = H.���i�R�[�h
WHERE T.���i�R�[�h = 'A0009'
AND T.������ > H.�p�ԓ�

--���i���A����ɒP���Ɛ��ʂ��甄����z���ꗗ�Ƃ��Ē��o����
SELECT S.���i�R�[�h, S.���i��, S.�P��,
       T.������, T.�����ԍ�, T.����,
	   S.�P�� * T.���� AS ������z
FROM ���i AS S
JOIN ���� AS T
ON S.���i�R�[�h = T.���i�R�[�h
WHERE S.���i�R�[�h = 'S0604'
ORDER BY T.�����ԍ�

--2016�N8���ɒ����̂��������i�R�[�h�̈ꗗ�𒊏o����
SELECT T.���i�R�[�h, S.���i��
FROM ���� AS T
JOIN ���i AS S
ON T.���i�R�[�h = S.���i�R�[�h
WHERE T.������ >= '2016-08-01'
AND T.������ < '2016-09-01'

--�p�ԂƂȂ��Ă��鏤�i�𒊏o����
SELECT T.���i�R�[�h, COALESCE(S.���i��, '�p��') AS ���i��
FROM ���� AS T
LEFT JOIN ���i AS S
ON T.���i�R�[�h = S.���i�R�[�h
WHERE T.������ >= '2016-08-01'
AND T.������ < '2016-09-01'

--�G�݂̏��i�ɂ��āA�������A���i�R�[�h�A���i���A���ʂ𒊏o����
SELECT T.������, S.���i�R�[�h || ':' || S.���i�� AS ���i,
COALESCE(T.����, 0) AS ����
FROM ���� AS T
RIGHT JOIN ���i AS S
ON T.���i�R�[�h = S.���i�R�[�h
WHERE S.���i�敪 = '3'

--�p�ԂɂȂ������i�͏��i�R�[�h�ɔp�ԍς݂ƕ\������
SELECT T.������, S.���i�R�[�h || ':' || S.���i�� AS ���i, COALESCE(T.����, 0) AS ����
FROM ���� AS T
RIGHT JOIN
(SELECT ���i�R�[�h, ���i��, ���i�敪 FROM ���i
UNION
SELECT ���i�R�[�h, '�i�p�ԍς݁j' AS ���i��, ���i�敪
FROM �p�ԏ��i) AS S
ON T.���i�R�[�h = S.���i�R�[�h
WHERE S.���i�敪 = '3'

--���ׂɒ������A�����ԍ��A�����}�ԁA���i�R�[�h�A���i���A�P���A���ʁA�������z�𒊏o����
SELECT T.������, T.�����ԍ�, T.�����}��, T.���i�R�[�h,
COALESCE(S.���i��, H.���i��) AS ���i��,
COALESCE(S.�P��, H.�P��) AS �P��,
T.���� AS ����,
COALESCE(S.�P��, H.�P��) * T.���� - COALESCE(T.�N�[�|��������, 0) AS �������z
FROM ���� AS T
LEFT JOIN ���i AS S
ON T.���i�R�[�h = S.���i�R�[�h
LEFT JOIN �p�ԏ��i AS H
ON T.���i�R�[�h = H.���i�R�[�h
WHERE T.�����ԍ� = '201704030010'

--���i�R�[�h��B�Ŏn�܂鏤�i�ɂ��āA���i�e�[�u�����珤�i�R�[�h�A���^���A�P�����A�����e�[�u�����炱��܂Ŕ���グ�����𒊏o����
SELECT S.���i�R�[�h, S.���i��, S.�P��, COALESCE(T.����, 0) AS ���㐔��,
       S.�P�� * COALESCE(T.����, 0) AS ��������z
FROM ���i AS S
LEFT JOIN (SELECT ���i�R�[�h, SUM(����) AS ����
              FROM ����
              WHERE ���i�R�[�h LIKE 'B%'
		      GROUP BY ���i�R�[�h) AS T
ON S.���i�R�[�h = T.���i�R�[�h
WHERE S.���i�R�[�h LIKE 'B%'
ORDER BY S.���i�R�[�h

--���ݔ̔����̏��i�ɂ��āA�֘A���Ă��鏤�i�̂���ꗗ�𒊏o����
SELECT S1.���i�R�[�h, S1.���i��,
       S2.���i�R�[�h AS �֘A���i�R�[�h, S2.���i�� AS �֘A���i��
FROM ���i AS S1
JOIN ���i AS S2
ON S1.���i�R�[�h = S2.�֘A���i�R�[�h