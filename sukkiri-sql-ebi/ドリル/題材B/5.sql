--����܂Œ������ꂽ���ʂ̍��v�����߂�
SELECT SUM(����) AS ���ʍ��v
FROM ����

--���������ɁA���������Ƃ̐��ʂ̍��v�����߂�
SELECT ������, SUM(����) AS ���ʍ��v
FROM ����
GROUP BY ������
ORDER BY ������

--���i�敪���ɁA���i�敪���Ƃ̒P���̍ŏ��z�ƍō��z�����߂�
SELECT ���i�敪, MIN(�P��) AS �ŏ��z, MAX(�P��) AS �ō��z
FROM ���i
GROUP BY ���i�敪
ORDER BY ���i�敪

--���i�R�[�h���ɁA���i�R�[�h���Ƃɂ���܂Œ������ꂽ���ʂ̍��v�����߂�
SELECT ���i�R�[�h, SUM(����) AS ���ʍ��v
FROM ����
GROUP BY ���i�R�[�h
ORDER BY ���i�R�[�h

--����܂łɍł��悭���ꂽ���i��10�ʂ܂Œ��o����
SELECT ���i�R�[�h, SUM(����) AS ���ʍ��v
FROM ����
GROUP BY ���i�R�[�h
ORDER BY ���ʍ��v DESC, ���i�R�[�h
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--����܂łɔ��ꂽ���ʂ�5�����̏��i�R�[�h�Ƃ��̐��ʂ𒊏o����
SELECT ���i�R�[�h, SUM(����) AS ���ʍ��v
FROM ����
GROUP BY ���i�R�[�h
HAVING SUM(����) < 5

--����܂łɃN�[�|���������������������ƁA�����z�̍��v�����߂�
SELECT COUNT(�N�[�|��������) AS ��������, SUM(�N�[�|��������) AS �����z���v
FROM ����

--�����Ƃ̒������������߂�
SELECT SUBSTRING(�����ԍ�, 1, 6) AS �N��, COUNT(*) AS ��������
FROM ����
WHERE �����}�� = 1
GROUP BY SUBSTRING(�����ԍ�, 1, 6)
ORDER BY SUBSTRING(�����ԍ�, 1, 6)

--Z����n�܂鏤�i�R�[�h�̂����A����܂łɔ��ꂽ�I����100�ȏ�̏��i�R�[�h�𒊏o����
SELECT ���i�R�[�h
FROM ����
WHERE ���i�R�[�h LIKE 'Z%'
GROUP BY ���i�R�[�h
HAVING SUM(����) >= 100