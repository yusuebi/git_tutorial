--�p�[�e�B�̃L�����N�^�[��HP��MP�ɂ��āA�ő�l�A�ŏ��l�A���ϒl�����߂�
SELECT MAX(HP) AS �ő�HP, MIN(HP) AS �ŏ�HP, AVG(HP) AS ����HP,
       MAX(MP) AS �ő�MP, MIN(MP) AS �ŏ�MP, AVG(MP) AS ����MP
FROM �p�[�e�B�[

--�^�C�v�ʂɃC�x���g�̐����擾����
SELECT CASE �^�C�v WHEN '1' THEN '����'
        WHEN '2' THEN '�t���['
        WHEN '3' THEN '����'
       END AS �^�C�v,
COUNT(�C�x���g�ԍ�) AS �C�x���g��
FROM �C�x���g
GROUP BY �^�C�v

--�o���C�x���g�e�[�u������A�N���A�̌��ʕʂɃN���A�����C�x���g�̐����擾����
SELECT �N���A����, COUNT(�C�x���g�ԍ�) AS �C�x���g��
FROM �o���C�x���g
WHERE �N���A�敪 ='1'
GROUP BY �N���A����
ORDER BY �N���A����

--�U�����@�����Ȋ�Ղ����������̓G�̍s����\������
SELECT CASE WHEN SUM(MP) < 500 THEN '�G�͌��Ƃ�Ă���I'
         WHEN SUM(MP) >= 500 AND
              SUM(MP) < 1000 THEN '�G�͕�R�Ƃ��Ă���I'
         WHEN SUM(MP) >= 1000 THEN '�G�͂Ђꕚ���Ă���I'
       END AS �����Ȋ��
FROM �p�[�e�B�[

--�o���C�x���g�e�[�u������A�N���A�����C�x���g���ƎQ���������̂̂܂��N���A���Ă��Ȃ��C�x���g�̐����擾����
SELECT CASE �N���A�敪 WHEN '1' THEN '�N���A����'
          WHEN '0' THEN '�Q���������N���A���Ă��Ȃ�'
       END AS �敪,
COUNT(�C�x���g�ԍ�) AS �C�x���g��
FROM �o���C�x���g
GROUP BY �N���A�敪

--�E�ƃ^�C�v���Ƃ�HP��MP�̍ő�l�A�ŏ��l�A���ϒl���擾����
SELECT SUBSTRING(�E�ƃR�[�h, 1, 1) AS �E�ƃ^�C�v,
       MAX(HP) AS �ő�HP, MIN(HP) AS �ŏ�HP, AVG(HP) AS ����HP,
       MAX(MP) AS �ő�MP, MIN(MP) AS �ŏ�MP, AVG(MP) AS ����MP
FROM �p�[�e�B�[
GROUP BY SUBSTRING(�E�ƃR�[�h, 1, 1)

--ID��1�����ڂɂ���ăp�[�e�B�𕪗ނ��AHP�̕��ς�100�𒴂��Ă���f�[�^�𒊏o����
SELECT SUBSTRING(ID, 1, 1) AS ID�ɂ�镪��,
       AVG(HP) AS HP�̕���,
       AVG(MP) AS MP�̕���
FROM �p�[�e�B�[
GROUP BY SUBSTRING(ID, 1, 1)
HAVING AVG(HP) > 100

--�͂̔����J���邱�Ƃ̂ł�����̐������߂�
SELECT SUM(
  CASE WHEN HP < 100 THEN 1
       WHEN HP >= 100 AND HP < 150 THEN 2
       WHEN HP >= 150 AND HP < 200 THEN 3
       WHEN HP >= 200 THEN 5 END
  ) AS �J��������̐�
FROM �p�[�e�B�[