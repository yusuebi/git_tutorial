--�N�ԍ~���ʂƁA�N�Ԃ̍ō��C���E�Œ�C���̕���
SELECT SUM(�~����), AVG(�ō��C��), AVG(�Œ�C��)
FROM �s�s�ʋC�ۊϑ�

--�����̔N�ԍ~���ʂƁA�N�Ԃ̍ō��C���E�Œ�C���̕���
SELECT SUM(�~����), AVG(�ō��C��), AVG(�Œ�C��)
FROM �s�s�ʋC�ۊϑ�
WHERE �s�s�� = '����'

--�e�s�s�̍~���ʕ��ςƁA�ł��Ⴉ�����ō��C���A�ł��������Œ�C��
SELECT AVG(�~����), MIN(�ō��C��), MAX(�Œ�C��)
FROM �s�s�ʋC�ۊϑ�
GROUP BY �s�s��

--���ʂ̍~���ʁA�ō��C���A�Œ�C���̕���
SELECT AVG(�~����), AVG(�ō��C��), AVG(�Œ�C��)
FROM �s�s�ʋC�ۊϑ�
GROUP BY ��

--1�N�Ԃōł������ō��C����38�x�ȏ���L�^�������̂���s�s���Ƃ��̋C��
SELECT �s�s��, MAX(�ō��C��)
FROM �s�s�ʋC�ۊϑ�
GROUP BY �s�s��
HAVING MAX(�ō��C��) >= 38

--1�N�Ԃōł��Ⴂ�Œ�C����-10�x�ȉ����L�^�������̂���s�s�Ƃ��̋C��
SELECT �s�s��, MIN(�Œ�C��)
FROM �s�s�ʋC�ۊϑ�
GROUP BY �s�s��
HAVING MIN(�Œ�C��) <= -10