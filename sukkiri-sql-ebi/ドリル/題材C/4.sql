--�A�C�e���E�C�̗�𑕔������Ƃ��̃L�����N�^�[��HP��K�؂ȗ��p���Ď擾����
SELECT ���� AS �Ȃ܂�, HP AS ���݂�HP, HP + 50 AS �������HP
FROM �p�[�e�B�[
WHERE �E�ƃR�[�h IN ('11', '21')

--IDA01��A03��MP���X�V����
UPDATE �p�[�e�B�[
SET MP = MP + 20
WHERE ID IN ('A01', 'A03')

--�����Ƃ̃X�b�L���p���`�͎�����HP��2�{�����|�C���g�̃_���[�W��^����
SELECT ���� AS �Ȃ܂�, HP AS ���݂�HP, HP * 2 AS �\�z�����_���[�W
FROM �p�[�e�B�[
WHERE �E�ƃR�[�h = '11'

--�p�[�e�B�[�ɂ���L�����N�^�[�̏󋵂ɂ��āA�K�؂ȗ��p���ĕʖ��ňꗗ���擾����
SELECT ���� AS �Ȃ܂�, HP || '�^' || MP AS HP��MP,
  CASE ��ԃR�[�h WHEN '00' THEN NULL
     WHEN '01' THEN '����'
     WHEN '02' THEN '��'
     WHEN '03' THEN '����'
     WHEN '04' THEN '����'
     WHEN '09' THEN '�C��'
  END AS �X�e�[�^�X
FROM �p�[�e�B�[

--�C�x���g�ꗗ���擾����
SELECT �C�x���g�ԍ�, �C�x���g����,
  CASE �^�C�v WHEN '1' THEN '����'
       WHEN '2' THEN '�t���['
       WHEN '3' THEN '����'
  END AS �^�C�v,
  CASE WHEN �C�x���g�ԍ� >= 1 AND �C�x���g�ԍ� <=10 THEN '����'
       WHEN �C�x���g�ԍ� >= 11 AND �C�x���g�ԍ� <=17 THEN '����'
       ELSE '�I��'
  END AS ��������
FROM �C�x���g

--�U�����󂯂����̃L�����N�^�[�̗\�z�_���[�W�����߂�
SELECT ���� AS �Ȃ܂�, HP AS ���݂�HP,
       LENGTH(����) * 10 AS �\�z�_���[�W
FROM �p�[�e�B�[

--��ԃR�[�h���X�V����
UPDATE �p�[�e�B�[
SET ��ԃR�[�h = '04'
WHERE HP % 4 = 0
OR MP % 4 = 0;

--�A�C�e�����w�������ۂ̎x���������z�����߂�
SELECT TRUNC(777 * 0.7, 0) AS �x���������z

--HP��MP���X�V����
UPDATE �p�[�e�B�[
SET HP = ROUND(HP * 1.3, 0),
    MP = ROUND(MP * 1.3, 0)

--3��U�������ۂ̍U���|�C���g���擾����
SELECT ���� AS �Ȃ܂�, HP,
       POWER(HP, 0) AS �U��1���,
       POWER(HP, 1) AS �U��2���,
       POWER(HP, 2) AS �U��3���
FROM �p�[�e�B�[
WHERE �E�ƃR�[�h = '10'

--��l���̃p�[�e�B�ɂ���L�����N�^�[�̏󋵂��擾����
SELECT ���� AS �Ȃ܂�, HP,�@��ԃR�[�h,
  CASE WHEN HP <= 50 THEN 3 + CAST(��ԃR�[�h AS INTEGER)
       WHEN HP >= 51 AND HP <= 100 THEN 2 + CAST(��ԃR�[�h AS INTEGER)
       WHEN HP >= 101 AND HP <= 150 THEN 1 + CAST(��ԃR�[�h AS INTEGER)
       ELSE CAST(��ԃR�[�h AS INTEGER) 
  END AS ���X�N�l
FROM �p�[�e�B�[
ORDER BY ���X�N�l DESC, HP

--�C�x���g�ꗗ���C�x���g�ԍ����Ɏ擾����
SELECT COALESCE(CAST(�O��C�x���g�ԍ� AS VARCHAR), '�O��Ȃ�') AS �O��C�x���g�ԍ�,
       �C�x���g�ԍ�,
       COALESCE(CAST(�㑱�C�x���g�ԍ� AS VARCHAR), '�㑱�Ȃ�') AS �㑱�C�x���g�ԍ�
FROM �C�x���g
ORDER BY �C�x���g�ԍ�