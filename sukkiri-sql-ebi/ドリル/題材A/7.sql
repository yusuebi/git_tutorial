--����܂ł̎���̋L�^������e�[�u�����璊�o����
SELECT T.�����ԍ�, T.���t, J.������R��,
       COALESCE(T.�����z, T.�o���z) AS ������z
FROM ��� AS T
JOIN ������R AS J
ON T.������RID = J.������RID
WHERE T.�����ԍ� IN ('0311240', '1234161', '2750902')
ORDER BY T.�����ԍ�, T.����ԍ�

--�������Ƃ���܂ł̎�������ꗗ�Ƃ��Ē��o����
SELECT K.�����ԍ�, K.���`, K.�c��,
       T.���t, T.�����z, T.�o���z
FROM ���� AS K
JOIN ��� AS T
ON K.�����ԍ� = T.�����ԍ�
WHERE K.�����ԍ� = '0887132'
ORDER BY T.����ԍ�

--2016�N3��1���Ɏ���̂����������ԍ��̈ꗗ���擾����
SELECT T.�����ԍ�, K.���`, K.�c��
FROM ��� AS T
JOIN ���� AS K
ON T.�����ԍ� = K.�����ԍ�
WHERE T.���t = '2016-03-01'

--��񂳂ꂽ�������蒼������
SELECT T.�����ԍ�,
       COALESCE(K.���`, '���ς�') AS ���`,
       COALESCE(K.�c��, 0) AS �c��
FROM ��� AS T
LEFT JOIN ���� AS K
       ON T.�����ԍ� = K.�����ԍ�
WHERE T.���t = '2016-03-01'

--����e�[�u���̃f�[�^�𒊏o����
SELECT T.����ԍ�,
       CAST(J.������RID AS VARCHAR) || ':' || J.������R�� AS ������R,
       T.���t, T.�����ԍ�, T.�����z, T.�o���z
FROM ��� AS T
RIGHT JOIN ������R AS J
       ON T.������RID = J.������RID
       
--����e�[�u���Ǝ�����R�e�[�u�����������R�̈ꗗ�𒊏o����
SELECT DISTINCT T.������RID, J.������R��
FROM ��� AS T
FULL JOIN ������R J
     ON T.������RID = J.������RID

--������R�����ꗗ�\������
SELECT K.�����ԍ�, K.���`, K.�c��,
       T.���t, J.������R��, T.�����z, T.�o���z
FROM ���� AS K
JOIN ��� AS T
ON K.�����ԍ� = T.�����ԍ�
JOIN ������R AS J
ON T.������RID = J.������RID
WHERE K.�����ԍ� = '0887132'
ORDER BY T.����ԍ�

--����c����500���~�ȏ�̃f�[�^�𒊏o����
SELECT K.�����ԍ�, K.���`, K.�c��,
       T.���t, T.������RID, T.�����z, T.�o���z
FROM ���� AS K
JOIN ��� AS T
ON K.�����ԍ� = T.�����ԍ�
WHERE K.�c�� >= 5000000
AND (T.�����z >= 1000000 OR T.�o���z >= 1000000)
AND T.���t >= '2018-01-01'

--����̌����œ�������3��ȏ������ꂽ�����ԍ��Ɖ񐔂𒊏o����
SELECT K.�����ԍ�, T.��, K.���`
FROM ���� AS K
JOIN (SELECT �����ԍ�, COUNT(*) AS ��
        FROM ���
       GROUP BY �����ԍ�, ���t
      HAVING COUNT(*) >= 3) AS T
ON K.�����ԍ� = T.�����ԍ�

--�������`�ŕ����̌����ԍ������ڋq�𒊏o����
SELECT DISTINCT K1.���`, K1.�����ԍ�,
       K1.���, K1.�c��, K1.�X�V��
FROM ���� AS K1
JOIN ���� AS K2
ON K1.���` = K2.���`
WHERE K1.�����ԍ� <> K2.�����ԍ�
ORDER BY K1.���`, K1.�����ԍ�;