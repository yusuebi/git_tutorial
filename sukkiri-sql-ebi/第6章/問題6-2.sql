--���ݓ������̎Ј������擾����
SELECT COUNT(*) AS �Ј���
FROM ���ގ��Ǘ�
WHERE �ގ� IS NULL

--�Ј����Ƃ̓����񐔂��A�񐔂̑������Ɏ擾����
SELECT �Ј���, COUNT(*) AS ������
FROM ���ގ��Ǘ�
GROUP BY �Ј���
ORDER BY 2 DESC

--���R�敪���Ƃ̓����񐔂��擾�B���R�敪�͂킩��₷���\�L�Ƃ���
SELECT CASE ���R�敪 WHEN '1' THEN '�����e�i���X'
                     WHEN '2' THEN '�����[�X���'
					 WHEN '3' THEN '��Q�Ή�'
					 WHEN '9' THEN '���̑�'
	   END AS ���R,
	   COUNT (*) AS ������
FROM ���ގ��Ǘ�
GROUP BY ���R�敪

--�����񐔂�10��𒴉߂���Ј��ɂ��āA�Ј����Ɠ����񐔂��擾����
SELECT �Ј���, COUNT(*) ������
FROM ���ގ��Ǘ�
GROUP BY �Ј���
HAVING COUNT(*) > 10

--��Q�������������t�Ƃ��ꂼ��̏�Q�ɑΉ������Ј������擾����
SELECT ���t, COUNT(�Ј���) AS �Ή��Ј���
FROM���ގ��Ǘ�
WHERE ���R�敪 = '3'
GROUP BY���t