--���łɃN���A�����C�x���g�𒊏o����
SELECT E.���[�g�ԍ�, E.�C�x���g�ԍ�, M.�C�x���g����, E.�N���A����
FROM �o���C�x���g E
JOIN �C�x���g M
ON E.�C�x���g�ԍ� = M.�C�x���g�ԍ�
WHERE �N���A�敪 = '1'
ORDER BY E.���[�g�ԍ�

--�C�x���g�e�[�u������A�^�C�v�����̃C�x���g�ɂ��āA�C�x���g�ԍ��ƃC�x���g���́A�p�[�e�B�̃N���A�敪�𒊏o����
SELECT M.�C�x���g�ԍ�, M.�C�x���g����, E.�N���A�敪
FROM �C�x���g M
JOIN �o���C�x���g E
ON M.�C�x���g�ԍ� = E.�C�x���g�ԍ�
WHERE �^�C�v ='1'

--������̃C�x���g�𒊏o����
SELECT M.�C�x���g�ԍ�, M.�C�x���g����, COALESCE(E.�N���A�敪, '���N���A') AS �N���A�敪
FROM �C�x���g M
LEFT JOIN �o���C�x���g E
     ON M.�C�x���g�ԍ� = E.�C�x���g�ԍ�
WHERE �^�C�v ='1'

--���݃p�[�e�B�ɎQ�����Ă���L�����N�^�[�̈ꗗ��ID���ɒ��o����
SELECT P.ID, P.���� AS �Ȃ܂�,
       S.�R�[�h���� AS �E��, J.�R�[�h���� AS ���
FROM �p�[�e�B�[ P
JOIN (SELECT �R�[�h�l, �R�[�h����
      FROM �R�[�h
      WHERE �R�[�h��� ='1') S
ON P.�E�ƃR�[�h = S.�R�[�h�l
JOIN (SELECT �R�[�h�l, �R�[�h����
      FROM �R�[�h
      WHERE �R�[�h��� ='2') J
ON P.��ԃR�[�h = J.�R�[�h�l
ORDER BY ID

--���݃p�[�e�B�ɎQ�����Ă���L�����N�^�[�̈ꗗ�𒊏o����
SELECT P.ID,
       COALESCE(P.����, '���ԂɂȂ��Ă��Ȃ��I') AS �Ȃ܂�,
       S.�R�[�h���� AS �E��
FROM �p�[�e�B�[ P
RIGHT JOIN (SELECT �R�[�h�l, �R�[�h����
            FROM �R�[�h
            WHERE �R�[�h��� ='1') S
ON P.�E�ƃR�[�h = S.�R�[�h�l

--�o���C�x���g�e�[�u������A�Q���ς݃C�x���g�̃N���A���ʈꗗ�𒊏o����
SELECT E.�C�x���g�ԍ�, E.�N���A�敪,
       C.�R�[�h�l || '�F' || C.�R�[�h���� AS �N���A����
FROM �o���C�x���g E
FULL JOIN (SELECT �R�[�h�l, �R�[�h����
           FROM �R�[�h
           WHERE �R�[�h��� ='4') C
ON E.�N���A���� = C.�R�[�h�l

--�C�x���g�e�[�u������A�O��C�x���g���Z�悳��Ă���C�x���g�𒊏o����
SELECT E1.�C�x���g�ԍ�, E1.�C�x���g����,
       E1.�O��C�x���g�ԍ�, E2.�C�x���g���� AS �O��C�x���g����
FROM �C�x���g E1
JOIN �C�x���g E2
ON E1.�O��C�x���g�ԍ� = E2.�C�x���g�ԍ�
WHERE E1.�O��C�x���g�ԍ� IS NOT NULL

--�C�x���g�e�[�u������O��C�x���g�܂��͌㑱�C�x���g���ݒ肳��Ă���C�x���g�𒊏o����
SELECT E1.�C�x���g�ԍ�, E1.�C�x���g����,
       E1.�O��C�x���g�ԍ�, E2.�C�x���g���� AS �O��C�x���g����,
       E1.�㑱�C�x���g�ԍ�, E3.�C�x���g���� AS �㑱�C�x���g����
FROM �C�x���g E1
LEFT JOIN �C�x���g E2
     ON E1.�O��C�x���g�ԍ� = E2.�C�x���g�ԍ�
LEFT JOIN �C�x���g E3
     ON E1.�㑱�C�x���g�ԍ� = E3.�C�x���g�ԍ�
WHERE E1.�O��C�x���g�ԍ� IS NOT NULL
OR E1.�㑱�C�x���g�ԍ� IS NOT NULL

--�ق��̃C�x���g�̑O��ƂȂ��Ă���C�x���g�𒊏o����
SELECT E.�C�x���g�ԍ�, E.�C�x���g����, Z.�O��C�x���g�� 
FROM �C�x���g E
JOIN (SELECT �O��C�x���g�ԍ�,
      COUNT(�O��C�x���g�ԍ�) AS �O��C�x���g��
FROM �C�x���g
WHERE �O��C�x���g�ԍ� IS NOT NULL
GROUP BY �O��C�x���g�ԍ�) Z
ON E.�C�x���g�ԍ� = Z.�O��C�x���g�ԍ�
ORDER BY E.�C�x���g�ԍ�