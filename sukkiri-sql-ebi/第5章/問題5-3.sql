--�˗����ꂽ�����͉����������߂�
UPDATE ��
SET ������ = LENGTH(REPLASE(����, ' ',''))

--�󒍓��e�ꗗ��\������
SELECT �󒍓�,��ID,������
       CASE COALESCE(���̃R�[�h '1')
	      WHEN '1' THEN '�u���b�N��'
		  WHEN '2' THEN '�M�L��'
		  WHEN '3' THEN '������' END AS ���̖�,
	   CASE COALESCE(���̃R�[�h '1')
	      WHEN '1' THEN 100
		  WHEN '2' THEN 150
		  WHEN '3' THEN 200 END AS �P��,
	   CASE WHEN ������ > 10 THEN 500
	   ELSE 0 END AS ���ʉ��H����
FROM ��

--�����̕ύX�˗����e�ɍ��킹�čX�V����
UPDATE ��
SET ���� = REPLACE(����,' ','��')
WHERE ��ID = '113'