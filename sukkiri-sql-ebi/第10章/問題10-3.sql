--�w���e�[�u���ƃ����[�V�����V�b�v�����w���e�[�u�������
CREATE TABLE �w�� (
�w�Дԍ� CHAR(8) PRYMARY KEY,
���O VARCHAR(30) NOT NULL,
���N���� DATE NOT NULL,
���t�^ CHAR(2) CHECK(
   ���t�^ IN ('A','B','O','AB') OR
   ���t�^ IS NULL
   ),
�w��ID CHAR(1) REFERENCES �w��(ID)
)