--�O���L�[����̎w��
CREATE TABLE �ƌv�� (
���t DATE NOT NULL,
���ID INTEGER REFERENCES ���(ID),
���� VARCHAR(100) DEFAULT '�s��' NOT NULL,
�����z INTEGER DEFAULT 0 CHECK(�����z >= 0),
�o���z INTEGER DEFAULT 0 CHECK(�o���z >= 0)
)