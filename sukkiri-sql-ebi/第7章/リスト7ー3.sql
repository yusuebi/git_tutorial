--SET��ŕ��₢���킹�𗘗p����
UPDATE �ƌv��W�v
SET ���� = (SELECT AVG(�o���z)
		      FROM �ƌv��A�[�J�C�u
		     WHERE �o���z > 0
		       AND ��� = '�H��')
WHERE ��� = '�H��'