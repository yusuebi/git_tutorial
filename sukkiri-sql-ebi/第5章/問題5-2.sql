--���[���A�h���X�����ɍ�����\������
UPDATE �񓚎�
SET ���� = CASE SUBSTRING(TRIM(���[���A�h���X),
					      LENGTH(TRIM(���[���A�h���X))-1,2)
			WHEN 'jp' THEN '���{'
			WHEN 'uk' THEN '�C�M���X'
			WHEN 'cn' THEN '����'
			WHEN 'fr' THEN '�t�����X'
			WHEN 'vn' THEN '�x�g�i��'
			END

--�����𖞂������[���A�h���X�A���ʁA�N���\������
SELECT TRIM(���[���A�h���X) AS ���[���A�h���X,
  CASE WHEN �N�� >= 20 AND �N�� < 30 THEN '20��'
       WHEN �N�� >= 30 AND �N�� < 40 THEN '30��'
	   WHEN �N�� >= 40 AND �N�� < 50 THEN '40��'
	   WHEN �N�� >= 50 AND �N�� < 60 THEN '50��' END
	   || ':' ||
  CASE ���� WHEN 'M' THEN '�j��'
            WHEN 'F' THEN '����' END AS ����
FROM �񓚎�