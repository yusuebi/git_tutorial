--�擾�Ƃ����肷�邻�̑��̕��@

--LIMIT�̗��p
   �iDb2�AMySQL�APostgreSQL�ASQLite�AH2 Database�j
SELECT ���, �o���z
FROM �ƌv��
ORDER BY �o���z DESC LIMIT 3

--ROW_NUMBER()�̗��p
SELECT K.���, K.�o���z
  FROM (
    SELECT *,
           ROW_NUMBER() OVER(ORDER BY �o���z DESC) RN
      FROM �ƌv��
  ) K
 WHERE K.RN >= 1 AND K.RN <= 3
 
--ROWNUM�̗��p�iOracle DB�j
SELECT ���, �o���z
  FROM (
    SELECT K.*, ROWNUM AS RN
      FROM (
        SELECT * FROM �ƌv��
         ORDER BY �o���z DESC
      ) K
  )
 WHERE RN >= 1 AND RN <= 3
 
--TOP�̗��p�iSQL Server�j
SELECT TOP(3) ���, �o���z FROM �ƌv�� ORDER BY �o���z DESC