--���������������S�Ј��̈ꗗ�\
SELECT �Ј��ԍ�, S.���O AS ���O, B.���O AS ������
FROM �Ј� AS S
JOIN ���� AS B
ON S.����ID = B.����ID

--��i�̖��O�̓������S�Ј��̈ꗗ�\
SELECT S1.�Ј��ԍ�, S1.���O AS ���O, S2.���O AS ��i��
FROM �Ј� AS S1
LEFT JOIN �Ј� AS S2
ON S1.��iID = S2.�Ј��ԍ�

--�������ƋΖ��n���������Ј��ꗗ�\
SELECT �Ј��ԍ�, S.���O AS ���O,
       B.���O AS ������, K.���O AS �Ζ��n
FROM �Ј� AS S
JOIN ���� AS B
ON S.����ID = B.����ID
JOIN �x�X AS K
ON S.�Ζ��nID = K.�x�XID

--�x�X���Ƃ̎x�X�����ƎЈ����̈ꗗ�\
SELECT �x�XID AS �x�X�R�[�h, K.���O AS �x�X��,
       S.���O AS �x�X����, T. �Ј���
FROM �x�X AS K
JOIN �Ј� AS S
ON K.�x�X��ID = S.�Ј��ԍ�
JOIN (SELECT COUNT(*) AS �Ј���, �Ζ��nID
        FROM �Ј� GROUP BY �Ζ��nID) AS T
ON K.�x�XID = T.�Ζ��nID

--��i�ƈႤ�Ζ��n�̎Ј��ꗗ�\
SELECT S1.�Ј��ԍ� AS �Ј��ԍ�, S1.���O AS ���O,
       K1.���O AS �{�l�Ζ��n, K2.���O AS ��i�Ζ��n
FROM �Ј� AS S1
JOIN �Ј� AS S2
ON S1.��iID = S2.�Ј��ԍ�
AND S1.�Ζ��nID <> S2.�Ζ��nID
JOIN �x�X AS K1
ON S1.�Ζ��nID = K1.�x�XID
JOIN �x�X AS K2
ON S2.�Ζ��nID = K2.�x�XID