--FROM��ŕ��₢���킹�𗘗p����
SELECT SUM(SUB.�o���z) AS �o���z���v
FROM (SELECT ���t, ���, �o���z
	  FROM �ƌv��
	  UNION
	  SELECT ���t, ���, �o���z
	  FROM �ƌv��A�[�J�C�u
	  WHERE ���t >= '2018-01-01'
	  AND ���t <= '2018-01-31') AS SUB