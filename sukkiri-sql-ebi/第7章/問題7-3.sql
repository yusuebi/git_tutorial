--���猧�ʂɎ��瓪�����J�E���g�������ʂ𓪐��W�v�e�[�u���ɓo�^
INSERT INTO �����W�v
SELECT ���猧, COUNT(�̎��ʔԍ�)
FROM �̎���
GROUP BY ���猧

--�����W�v�e�[�u���ŁA���瓪���̑����ق�����3�̓s���{���Ŏ��炳��Ă��鋍�f�[�^���̎��ʃe�[�u������擾����
SELECT ���猧 AS �s���{����, �̎��ʔԍ�,
       CASE ���Y�R�[�h WHEN '1' THEN '�Y'
                     WHEN '2' THEN '��' END AS ���Y
FROM �̎���
WHERE ���猧 IN (SELECT ���猧 FROM �����W�v
                   ORDER BY ���� DESC
                     OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)

--�ꋍ�����p��ł��鋍�̈ꗗ���̎��ʃe�[�u������擾����
SELECT �̎��ʔԍ�,
       CASE �i��R�[�h WHEN '01' THEN '���p��'
                     WHEN '02' THEN '���p��'
                     WHEN '03' THEN '���G��' END AS �i��,
       �o����, �ꋍ�ԍ�
FROM �̎���
WHERE �ꋍ�ԍ� IN (SELECT �̎��ʔԍ� FROM �̎���
                    WHERE �i��R�[�h = '01')