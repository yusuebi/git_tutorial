--ID��C02�̃f�[�^�𒊏o����
SELECT *
FROM �p�[�e�B�[
WHERE ID = 'C02'

--ID��A01��HP��120�ɍX�V����
UPDATE �p�[�e�B�[
SET HP = 120
WHERE ID = 'A01'

--HP��100�����̃f�[�^�ɂ���ID�A���́AHP�̈ꗗ�𒊏o����
SELECT ID, ����, HP
FROM �p�[�e�B�[
WHERE HP < 100

--MP��100�ȏ�̃f�[�^�ɂ���ID�A���́AMP�̈ꗗ�𒊏o����
SELECT ID, ����, MP
FROM �p�[�e�B�[
WHERE MP >= 100

--�^�C�v������łȂ��f�[�^�ɂ��āA�C�x���g�ԍ��A�C�x���g���́A�^�C�v�̈ꗗ�𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����, �^�C�v
FROM �C�x���g
WHERE �^�C�v <> '3'

--�C�x���g�ԍ���5�ȉ��̃f�[�^�ɂ��āA�C�x���g�ԍ��ƃC�x���g���̂𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����
FROM �C�x���g
WHERE �C�x���g�ԍ� <= 5

--�C�x���g�ԍ���20�𒴉߂��Ă���f�[�^�ɂ��āA�C�x���g�ԍ��ƃC�x���g���̂𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����
FROM �C�x���g
WHERE �C�x���g�ԍ� > 20

--�ʂ̃C�x���g�̃N���A��O��Ƃ��Ȃ��C�x���g�ɂ��āA�C�x���g�ԍ��ƃC�x���g���̂𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����
FROM �C�x���g
WHERE �O��C�x���g�ԍ� IS NULL

--���ɔ�������C�x���g�����߂��Ă���C�x���g�ɂ��āA�C�x���g�ԍ��A�C�x���g���́A�㑱�C�x���g�ԍ��𒊏o����
SELECT �C�x���g�ԍ�, �C�x���g����, �㑱�C�x���g�ԍ�
FROM �C�x���g
WHERE �㑱�C�x���g�ԍ� IS NOT NULL

--���̂Ƀ~���܂܂��p�[�e�B�e�[�u���̃f�[�^�ɂ��āA��ԃR�[�h�𖰂�ɍX�V����
UPDATE �p�[�e�B�[
SET ��ԃR�[�h = '01'
WHERE ���� LIKE '%�~%'

--HP��120�`160�͈̔͂ɂ���f�[�^�ɂ���ID�A���́AHP�̈ꗗ�𒊏o����
SELECT ID, ����, HP
FROM �p�[�e�B�[
WHERE HP BETWEEN 120 AND 160

--�E�Ƃ��E�ҁA��m�A�����Ƃ̂����ꂩ�ł���f�[�^�ɂ��āA���̂ƐE�ƃR�[�h�𒊏o����
SELECT ����, �E�ƃR�[�h
FROM �p�[�e�B�[
WHERE �E�ƃR�[�h IN ('01', '10', '11')

--��ԃR�[�h���ُ�Ȃ��ƋC��̂ǂ���ł��Ȃ��f�[�^�ɂ��āA���̂Ə�ԃR�[�h�𒊏o����
SELECT ����, ��ԃR�[�h
FROM �p�[�e�B�[
WHERE ��ԃR�[�h NOT IN ('00', '09')

--HP��MP���Ƃ���100�𒴂��Ă���f�[�^�𒊏o����
SELECT *
FROM �p�[�e�B�[
WHERE HP > 100
AND MP > 100

--ID��A�Ŏn�܂�A�E�ƃR�[�h��1�����ڂ�2�ł���f�[�^�𒊏o����
SELECT *
FROM �p�[�e�B�[
WHERE ID LIKE 'A%'
AND �E�ƃR�[�h LIKE '2%'

--�^�C�v�������Ŏ��O�ɃN���A���K�v�ȃC�x���g�ł����ɔ�������C�x���g���ݒ肳��Ă���f�[�^�𒊏o����
SELECT *
FROM �C�x���g
WHERE �^�C�v ='1'
AND �O��C�x���g�ԍ� IS NOT NULL
AND �㑱�C�x���g�ԍ� IS NOT NULL