--�W�v��\������DML(�ƌv�Ǘ�DB����}�j���A�����)
SELECT U.���p�Җ� , H.��ږ� , S.���v���z
FROM (
  SELECT K.���p��ID, M.���ID, SUM(M.���z) AS ���v���z 
    FROM ���o������ AS M
    JOIN ��� AS H
    ON M.���ID = H.���ID
    JOIN ���o���s�� AS K
    ON M.���o���s��ID = K.���o���s��ID
    GROUP BY K.���p��ID, M.���ID
   ) AS S
JOIN ���p�� AS U
ON S.���p��ID = U.���p��ID 
JOIN ��� AS H
ON S.���ID = H.���ID