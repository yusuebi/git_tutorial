--�c���̍��v�A�ő�A�ŏ��A���ρA�o�^����Ă���f�[�^�̌��������߂�
SELECT SUM(�c��) AS ���v, MAX(�c��) AS �ő�, MIN(�c��) AS �ŏ�,
       AVG(�c��) AS ����, COUNT(*) AS ����
FROM ����

--��ʂ����ʈȊO�A�c����100���~�ȏ�A�X�V����2017�N�ȑO�̃f�[�^�̌��������߂�
SELECT COUNT(*) AS ����
FROM ����
WHERE ��� <> '1'
AND �c�� >= 1000000
AND �X�V�� < '2018-01-01'

--�X�V�����o�^����Ă��Ȃ��f�[�^���������߂�
SELECT COUNT(*) - COUNT(�X�V��) AS �X�V�����o�^����Ă��Ȃ�����
FROM ����

--���`�̍ő�l�ƍŏ��l�����߂�
SELECT MAX(���`), MIN(���`)
FROM ����

--�X�V���̍ő�l�ƍŏ��l�����߂�
SELECT MAX(�X�V��), MIN(�X�V��)
FROM ����

--��ʂ��Ƃ̎c���̍��v�A�ő�A�ŏ��A���ρA�o�^����Ă���f�[�^���������߂�
SELECT ���, SUM(�c��) AS ���v, MAX(�c��) AS �ő�, MIN(�c��) AS �ŏ�,
       AVG(�c��) AS ����, COUNT(*) AS ����
FROM ����
GROUP BY ���

--�����ԍ��̉�1���ڂ����������ł�����̂��O���[�v�Ƃ��A���ꂲ�Ƃ̌��������߂�
SELECT SUBSTRING(�����ԍ�, 7, 1) AS �����ԍ��O���[�v, COUNT(*) AS ����
FROM ����
GROUP BY SUBSTRING(�����ԍ�, 7, 1)
ORDER BY ���� DESC

--�X�V���̔N���Ƃ̎c���̍��v�A�ő�A�ŏ��A���ρA�o�^����Ă���f�[�^�̌��������߂�
SELECT SUBSTRING(COALESCE(CAST(�X�V�� AS VARCHAR), 'XXXX'), 1, 4) AS �X�V�N,
       SUM(�c��) AS ���v, MAX(�c��) AS �ő�, MIN(�c��) AS �ŏ�,
       AVG(�c��) AS ����, COUNT(*) AS ����
FROM ����
GROUP BY SUBSTRING(COALESCE(CAST(�X�V�� AS VARCHAR), 'XXXX'), 1, 4)

--��ʂ��Ƃ̎c���̍��v�ƃf�[�^���������߂�
SELECT ���, SUM(�c��) AS ���v, COUNT(*) AS ����
FROM ����
GROUP BY ���
HAVING SUM(�c��) > 3000000

--���`��1�����ڂ������O���[�v���ƂɃf�[�^�����Ɩ��`�������̕��ς����߂�
SELECT SUBSTRING(���`, 1, 1) AS ���`,
COUNT(���`) AS ����,
	AVG(LENGTH(REPLACE(���`, '�@', ''))) AS �������̕���
FROM ����
GROUP BY SUBSTRING(���`, 1, 1)
HAVING COUNT(���`) >= 10
OR AVG(LENGTH(REPLACE(���`, '�@', ''))) > 5