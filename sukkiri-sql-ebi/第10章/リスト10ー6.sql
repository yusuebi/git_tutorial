--デフォルト値が設定されていれば、エラーにならない
--メモを明示的に指定してINSERT → '家賃'が入る
INSERT INTO 家計簿 (日付,費目ID,メモ,入金額,出金額)
VALUES ('2018-04-04',2,'家賃',0,60000);
--メモを省略してINSERT → '不明'が入る
INSERT INTO 家計簿 (日付,費目ID,入金額,出金額)
VALUES ('2018-04-05',3,0,1350);