--�c����100���~�ȏ�̌����ԍ��Ǝc���𒊏o����
SELECT �����ԍ�, �c�� / 1000
AS ��~�P�ʂ̎c��
FROM ����
WHERE �c�� >= 1000000

--�����e�[�u����3�̃f�[�^��o�^����
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('0652281', '�^�J�M�@�m�u�I', '1', 100000 + 3000, '2018-04-01');
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('1026413', '�}�c���g�@�T���R', '1', 300000 + 3000, '2018-04-02');
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('2239710', '�T�T�L�@�V�Q�m��', '1', 1000000 + 3000, '2018-04-03');

--�o�^�����f�[�^���C������
UPDATE ����
SET �c�� = (�c�� - 3000) * 1.003
WHERE �����ԍ� IN ('0652281','1026413', '2239710')

--�X�V����2016�N�ȑO�̃f�[�^��ΏۂɌ����ԍ��A�X�V���A�ʒ��������𒊏o����
SELECT �����ԍ�, �X�V��, �X�V�� + 180 AS �ʒ�������
FROM ����
WHERE �X�V�� < '2017-01-01'

--��ʂ��ʒi�̃f�[�^�ɂ��Č����ԍ��Ɩ��`�𒊏o����
SELECT DISTINCT ��� AS ��ʃR�[�h,
CASE ��� WHEN '1' THEN '����'
	WHEN '2' THEN '����'
	WHEN '3' THEN '�ʒi' END AS ��ʖ�
FROM ����

--�o�^����Ă����ʂ̈ꗗ���擾����
SELECT DISTINCT ��� AS ��ʃR�[�h,
CASE ��� WHEN '1' THEN '����'
	WHEN '2' THEN '����'
	WHEN '3' THEN '�ʒi' END AS ��ʖ�
FROM ����

--�����ԍ��A���`�A�c�������N���擾����
SELECT �����ԍ�, ���`,
CASE WHEN �c�� < 100000 THEN 'C'
	WHEN �c�� >= 100000
	 AND �c�� < 1000000 THEN 'B'
	ELSE 'A' END AS �c�������N
FROM ����

--�����ԍ��A���`�c���̕������𒊏o����
SELECT LENGTH(�����ԍ�), LENGTH(REPLACE(���`, '�@', '')), LENGTH(CAST(�c�� AS VARCHAR))
FROM ����

--���`��1�`5�����ڂɃJ�����܂܂��f�[�^�𒊏o����
SELECT *
FROM ����
WHERE SUBSTRING(���`, 1, 5) LIKE '%�J��%'

--�c���̌�����4���ȏ�ŁA1000�~�����̒[���̂Ȃ��f�[�^�𒊏o����
SELECT *
FROM ����
WHERE LENGTH(CAST(�c�� AS VARCHAR)) >= 4
AND SUBSTRING(CAST(�c�� AS VARCHAR), LENGTH(CAST(�c�� AS VARCHAR))-2, 3) = '000'

--�����ԍ��A�c���A���z���c���̍~���ɒ��o����
SELECT �����ԍ�, �c��, TRUNC(�c�� * 0.0002, 0) AS ����
FROM ����
ORDER BY �c�� DESC

--�����ԍ��A�c���A�c�������𒊏o����
SELECT �����ԍ�, �c��,
CASE WHEN �c�� < 500000 THEN TRUNC(�c�� * 0.0001, 0)
	WHEN �c�� >= 500000
	 AND �c�� < 2000000 THEN TRUNC(�c�� * 0.0002, 0)
	WHEN �c�� >= 2000000 THEN TRUNC(�c�� * 0.0003, 0)
	  END AS �c���ʗ���
FROM ����
ORDER BY �c���ʗ��� DESC, �����ԍ�

--�����e�[�u����3�̃f�[�^��o�^����
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('0351262', '�C�g�J���@�_�C', '2', 635110, CURRENT_DATE);
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('1015513', '�A�L�c�@�W�����W', '1', 88463, CURRENT_DATE);
INSERT INTO ����(�����ԍ�, ���`, ���, �c��, �X�V��)
VALUES ('1739298', '�z�V�m�@�T�g�~', '1', 704610, CURRENT_DATE);

--�X�V����2018�N�ȍ~�̃f�[�^�𒊏o����
SELECT �����ԍ�, ���`, ���, �c��,
SUBSTRING(CAST(�X�V�� AS VARCHAR), 1, 4) || '�N' ||
SUBSTRING(CAST(�X�V�� AS VARCHAR), 6, 2) || '��' ||
SUBSTRING(CAST(�X�V�� AS VARCHAR), 9, 2) || '��' AS �X�V��
FROM ����
WHERE �X�V�� >= '2018-01-01'

--�X�V���𒊏o����B�X�V�����ݒ肳��Ă��Ȃ��ꍇ�͐ݒ�Ȃ��ƕ\�L����
SELECT COALESCE(CAST(�X�V�� AS VARCHAR), '�ݒ�Ȃ�') AS �X�V��
FROM ����