--���i�R�[�h�A���i���A�P���A����܂łɔ̔��������ʂ𒊏o����
SELECT ���i�R�[�h, ���i��, �P��,
(SELECT SUM(����)
	FROM ����
	WHERE ���i�R�[�h = 'S0604') AS ����
FROM ���i
WHERE ���i�R�[�h = 'S0604'

--���i�R�[�h���C������
UPDATE ����
SET ���i�R�[�h = (SELECT ���i�R�[�h
                     FROM ���i
		            WHERE ���i�敪 = '2'
					  AND ���i�� LIKE '%�u�[�c%'
					  AND ���i�� LIKE '%���S%'
				      AND ���i�� LIKE '%�J%')
WHERE ������ = '2018-03-15'
AND �����ԍ� = '201803150014'
AND �����}�� = 1

--���i���ɂ����������܂܂�鏤�i�����ꂽ���t�Ƃ��̏��i�R�[�h���ߋ��̓��t���ɒ��o����
SELECT ������, ���i�R�[�h
FROM ����
WHERE ���i�R�[�h IN (SELECT ���i�R�[�h
                      FROM ���i
					 WHERE ���i�� LIKE '%��������%')
ORDER BY ������

--���i���Ƃ̕��ϔ̔����ʂ����߁A�ǂ̏��i�������ϔ̔����ʂ��������������ꂽ���i��T���A���i�R�[�h�Ɣ̔����ʂ𒊏o����
SELECT ���i�R�[�h, SUM(����) AS ����
FROM ����
GROUP BY ���i�R�[�h
HAVING SUM(����) >ALL (SELECT AVG(����)
                         FROM ����
						GROUP BY ���i�R�[�h)


--�N�[�|�������𗘗p���Ĕ̔��������̂ɂ��āA���̔̔����ʂƁA���i1������̕��ϊ����z�𒊏o����
SELECT A.���ʍ��v AS �����ɂ��̔���,
TRUNC(A.���������v / A.���ʍ��v, 0) AS ���ϊ����z
FROM (SELECT SUM(����) AS ���ʍ��v,
               SUM(�N�[�|��������) AS ���������v
          FROM ����
         WHERE ���i�R�[�h = 'W0746'
		   AND �N�[�|�������� IS NOT NULL) AS A

--�ǉ����̒����𒍕��e�[�u���ɓo�^����
INSERT INTO ����
SELECT ������, �����ԍ�, MAX(�����}��) + 1, 'S1003', 1, NULL
FROM ����
WHERE ������ = '2018-03-21'
AND �����ԍ� = '201803210080'
GROUP BY ������, �����ԍ�;
INSERT INTO ����
SELECT ������, �����ԍ�, MAX(�����}��) + 1, 'A0052', 2, 500
FROM ����
WHERE ������ = '2018-03-22'
AND �����ԍ� = '201803220901'
GROUP BY ������, �����ԍ�;