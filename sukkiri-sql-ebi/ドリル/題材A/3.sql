--�����ԍ����ɂ��ׂẴf�[�^�𒊏o����
SELECT �����ԍ�, ���`, ���, �c��, �X�V��
FROM ����
ORDER BY �����ԍ�

--���`�ꗗ���擾����
SELECT DISTINCT ���`
FROM ����
ORDER BY ���`

--�c���̑傫�����ɂ��ׂẴf�[�^�𒊏o����
SELECT �����ԍ�, ���`, ���, �c��, �X�V��
FROM ����
ORDER BY 4 DESC, 1

--�X�V�����ߋ��̓��t����10�����o����
SELECT �X�V��
FROM ����
WHERE �X�V�� IS NOT NULL
ORDER BY �X�V��
OFFSET 0
FETCH FIRST 10 ROWS ONLY

--�X�V���Ǝc�����c���̏���������11�`20���̂ݒ��o����
SELECT �X�V��, �c��
FROM ����
WHERE �c�� > 0
AND �X�V�� IS NOT NULL
ORDER BY �c��, �X�V�� DESC
OFFSET 10
FETCH FIRST 10 ROWS ONLY

--�����ԍ��������ԍ����ɒ��o����
SELECT �����ԍ�
FROM ����
UNION
SELECT �����ԍ�
FROM �p�~����
ORDER BY 1

--�p�~�����e�[�u���ɂ͑��݂��Ȃ����`�𒊏o����
SELECT ���`
FROM ����
EXCEPT
SELECT ���`
FROM �p�~����
ORDER BY 1 DESC

--�����e�[�u���Ɣp�~�����e�[�u�������ɓo�^����Ă��閼�`�𒊏o����
SELECT ���`
FROM ����
INTERSECT
SELECT ���`
FROM �p�~����
ORDER BY 1

--�����ԍ��Ǝc���̈ꗗ���擾����
SELECT �����ԍ�, �c��
FROM ����
WHERE �c�� = 0
UNION
SELECT �����ԍ�, ��񎞎c��
FROM �p�~����
WHERE ��񎞎c�� <> 0
ORDER BY 1

--�����ԍ��Ɩ��`�̈ꗗ���擾����A�L���Ȍ����ɂ́Z�p�~���������ɂ́~������
SELECT �����ԍ�, ���`, '��' AS �����敪
FROM ����
UNION
SELECT �����ԍ�, ���`, '�~' AS �����敪
FROM �p�~����
ORDER BY ���`