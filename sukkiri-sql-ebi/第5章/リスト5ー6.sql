--CASE���Z�q���g����SELECT��
SELECT ���,�����z,
   CASE WHEN �����z < 5000 THEN '��������'
        WHEN �����z < 100000 THEN '�ꎞ����'
		WHEN �����z < 300000 THEN '����'
		ELSE '�z��O�̎����ł�'
	END AS �����̕���
FROM �ƌv��
WHERE �����z > 0