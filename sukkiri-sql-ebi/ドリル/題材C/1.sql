--��l���̃p�[�e�B�[�ɂ���L�����N�^�[�̑S�f�[�^�𒊏o����
SELECT ID, ����, �E�ƃR�[�h, HP, MP, ��ԃR�[�h
FROM �p�[�e�B�[

--���́AHP�AMP�A���擾����
SELECT ���� AS �Ȃ܂�, HP AS ���݂�HP, MP AS ���݂�MP
FROM �p�[�e�B�[

--���ݐݒ肳��Ă���C�x���g�̑S�f�[�^���C�x���g�e�[�u�����璊�o����
SELECT *
FROM �C�x���g

--�C�x���g�ԍ��ƃC�x���g���̂��擾����
SELECT �C�x���g�ԍ� AS �ԍ�, �C�x���g���� AS ���
FROM �C�x���g

--3�̃f�[�^��ǉ�����
INSERT INTO �p�[�e�B�[(ID, ����, �E�ƃR�[�h, HP, MP, ��ԃR�[�h)
VALUES ('A01', '�X�K����', '21', 131, 232, '03');
INSERT INTO �p�[�e�B�[(ID, ����, �E�ƃR�[�h, HP, MP, ��ԃR�[�h)
VALUES ('A02', '�I�[�G', '10', 156, 84, '00');
INSERT INTO �p�[�e�B�[(ID, ����, �E�ƃR�[�h, HP, MP, ��ԃR�[�h)
VALUES ('A03', '�C�Y�~', '20', 84, 190, '00');