--�p�[�e�B�̌��݂̏�ԃR�[�h�̈ꗗ���擾����
SELECT DISTINCT ��ԃR�[�h
FROM �p�[�e�B�[

--ID�Ɩ��̂�ID�̏����ɒ��o����
SELECT ID, ����
FROM �p�[�e�B�[
ORDER BY ID

--���̂ƐE�ƃR�[�h�𖼏̂̍~���ɒ��o����
SELECT ����, �E�ƃR�[�h
FROM �p�[�e�B�[
ORDER BY ���� DESC

--���́AHP�A��ԃR�[�h����ԃR�[�h�̏�������HP�̍������ɒ��o����
SELECT ����, HP, ��ԃR�[�h
FROM �p�[�e�B�[
ORDER BY ��ԃR�[�h, HP DESC

--�^�C�v�A�C�x���g�ԍ��A�C�x���g���́A�O��C�x���g�ԍ��A�㑱�C�x���g�ԍ����^�C�v�̏������C�x���g�ԍ��̏����ɒ��o����
SELECT �^�C�v, �C�x���g�ԍ�, �C�x���g����, �O��C�x���g�ԍ�, �㑱�C�x���g�ԍ�
FROM �C�x���g
ORDER BY 1, 2

--HP�̍�������3�����o����
SELECT *
FROM �p�[�e�B�[
ORDER BY HP DESC
OFFSET 0
FETCH FIRST 3 ROWS ONLY

--MP��3�Ԗڂɍ����f�[�^�𒊏o����
SELECT *
FROM �p�[�e�B�[
ORDER BY MP DESC
OFFSET 2
FETCH FIRST 1 ROWS ONLY

--�ꗗ�𒊏o����
SELECT CASE WHEN �E�ƃR�[�h LIKE '1%' THEN 'S'
            WHEN �E�ƃR�[�h LIKE '2%' THEN 'M'
            ELSE 'A'
       END AS �E�Ƌ敪,
�E�ƃR�[�h, ID, ����
FROM �p�[�e�B�[
ORDER BY �E�ƃR�[�h

--�C�x���g�e�[�u���ƌo���C�x���g�e�[�u������A�܂��Q�����Ă��Ȃ��C�x���g�̔ԍ��𒊏o����
SELECT �C�x���g�ԍ�
FROM �C�x���g
EXCEPT
SELECT �C�x���g�ԍ�
FROM �o���C�x���g
ORDER BY 1

--�C�x���g�e�[�u���ƌo���C�x���g�e�[�u������A���łɃN���A���ꂽ�C�x���g�̂����^�C�v���t���[�̃C�x���g�ԍ��𒊏o����
SELECT �C�x���g�ԍ�
FROM �o���C�x���g
WHERE �N���A�敪 ='1'
INTERSECT
SELECT �C�x���g�ԍ�
FROM �C�x���g
WHERE �^�C�v ='2'