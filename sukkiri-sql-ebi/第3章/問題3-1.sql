--6���̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �� = 6

--6���ȊO�̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �� <> 6

--�~���ʂ�100�����̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �~���� < 100

--�~���ʂ�200��葽���f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �~���� > 200

--�ō��C����30�ȏ�̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �ō��C�� >= 30

--�Œ�C����0�ȉ��̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �Œ�C�� <= 0

--3���A5���A7���̃f�[�^(IN���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE �� IN (3,5,7)

--3���A5���A7���̃f�[�^(OR���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE �� = 3
OR �� = 5
OR �� = 7

--3���A5���A7���ȊO�̃f�[�^(IN���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE NOT IN (3,5,7)

--3���A5���A7���ȊO�̃f�[�^(OR���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE �� <> 3
OR �� <> 5
OR �� <> 7

--�~���ʂ�100�ȉ��ŁA���x��50���Ⴂ�f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �~���� <= 100
AND ���x < 50

--�Œ�C����5�������A�ō��C����35��荂���f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �Œ�C�� < 5
OR �ō��C�� > 35

--���x��60�`79�͈̔͂ɂ���f�[�^(BETWEEN���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE ���x BETWEEN 60 AND 79

----���x��60�`79�͈̔͂ɂ���f�[�^(AND���g�p)
SELECT *
FROM �C�ۊϑ�
WHERE ���x >= 60
AND ���x <= 79

--�ϑ��f�[�^�̂Ȃ���̂��錎�̃f�[�^
SELECT *
FROM �C�ۊϑ�
WHERE �~���� IS NULL
OR �ō��C�� IS NULL
OR �Œ�C�� IS NULL
OR ���x IS NULL