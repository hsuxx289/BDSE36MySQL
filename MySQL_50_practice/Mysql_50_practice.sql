SHOW databases;

USE mysql_50;

SHOW tables;

#1 查詢學生表的 前10條資料
SELECT * FROM student LIMIT 10;

#2 查詢成績表所有成績的最低分,平均分,總分
SELECT 
	MIN(score),
	AVG(score),
    SUM(score)
FROM sc;

#3 查詢老師 “諶燕” 所帶的課程設數量
SELECT count(*)
FROM course AS c 
	LEFT JOIN teacher AS t
		ON c.tno = t.tno
WHERE tname = '諶燕';

#4 查詢所有老師所帶 的課程 數量
SELECT 
	tname,
    count(*)
FROM course AS c 
	LEFT JOIN teacher AS t
		ON c.tno = t.tno
GROUP BY tname;

#5 查詢姓”張”的學生名單
SELECT * 
FROM student
WHERE sname like '張%';

#6 查詢課程名稱為'Oracle'且分數低於60 的學號和分數
SELECT
	sno,
    sname 
FROM sc
	LEFT JOIN student AS s
		ON sc.sno = s.sno
	LEFT JOIN course AS c
		on sc.cno = c.cno
WHERE 
	cname = 'Oracle' 
	AND score < 60;

#7 查詢所有學生的選課 課程名稱
SELECT
	sname,
	cname
FROM student AS s
	LEFT JOIN sc
		ON s.sno = sc.sno
	LEFT JOIN course AS c
		ON sc.cno = c.cno;

#8 查詢任何一門課程成績在70 分以上的學生姓名.課程名稱和分數
SELECT
	sc.sno,
    s.sname,
    c.cname,
    sc.score
FROM sc
	LEFT JOIN student AS s
		ON sc.sno = s.sno
	LEFT JOIN course AS c
		ON sc.cno = c.cno
WHERE sc.score >= 70;

#9 查詢不及格的課程,並按課程號從大到小排列 學號,課程號,課程名,分數
SELECT
	sc.sno,
    c.cno,
    c.cname,
    sc.score
FROM sc
	LEFT JOIN student AS s
		ON sc.sno = s.sno
	LEFT JOIN course AS c
		ON sc.cno = c.cno
WHERE sc.score < 60
ORDER BY c.cno DESC;

#10 查詢沒學過”諶燕”老師講授的任一門課程的學號,學生姓名
SELECT 
	sno,
    sname
FROM student
WHERE sno NOT IN
(
	SELECT DISTINCT s.sno
	FROM course AS c
		LEFT JOIN teacher AS t
			ON c.tno = t.tno
		LEFT JOIN sc
			ON c.cno = sc.cno
		LEFT JOIN student AS s
			ON sc.sno = s.sno
	WHERE t.tname = '諶燕'
);

#11 查詢兩門以上不及格課程的同學的學號及其平均成績
SELECT 
  sc.sno,
  ROUND(AVG(sc.score), 2) AS avg_score
FROM sc
WHERE sc.sno IN (
  SELECT sno
  FROM sc
  WHERE score < 60
  GROUP BY sno
  HAVING COUNT(*) >= 2
)
GROUP BY sc.sno;

#檢索'c004'課程分數小於60,按分數降序排列的同學學號
SELECT sno
FROM sc
WHERE cno = 'c004'
	AND score < 60
ORDER BY sno DESC;

#查詢'c001'課程比'c002'課程成績高的所有學生的學號



#查詢平均成績大於60 分的同學的學號和平均成績

#查詢所有同學的學號.姓名.選課數.總成績

#查詢姓”劉”的老師的個數

#查詢只學”諶燕”老師所教的課的同學的學號:姓名

#查詢學過”c001″並且也學過編號”c002″課程的同學的學號.姓名

#查詢學過”諶燕”老師所教的所有課的同學的學號:姓名

#查詢課程編號”c004″的成績比課程編號”c001″和”c002″課程低的所有同學的學號.姓名

#查詢所有課程成績小於60 分的同學的學號.姓名

#查詢沒有學課的同學的學號.姓名

#查詢與學號為”s001″一起上過課的同學的學號和姓名

#查詢跟學號為”s005″所修課程完全一樣的同學的學號和姓名

#查詢各科成績最高和最低的分 顯示:課程ID,最高分,最低分

#按各科平均成績和及格率的百分數 照平均從低到高顯示

#查詢每個課程的老師及平均分從高到低顯示 老師名稱,課程名稱,平均分數

#統計列印各科成績,各分數段人數:課程ID,課程名稱,verygood[100-86], good[85-71], bad[<60]

#查詢各科成績前三名的記錄:(不考慮成績並列情況)

#查詢每門課程被選修的學生數

#查詢出只選修了兩門課程的全部學生的學號和姓名

#查詢男生.女生人數

#   32-1. 查詢每個課程的男生女生總數
#查詢同名同姓學生名單,並統計同名人數

#查詢年紀最小跟最大的學生名單(注:Student 表中Sage 列的型別是int)

#查詢每門課程的平均成績,結果按平均成績升序排列,平均成績相同時,按課程號降序排列

#查詢平均成績大於85 的所有學生的學號.姓名和平均成績

#查詢課程編號為c001 且課程成績在80 分以上的學生的學號和姓名

#檢索每課程第二高分的學號 分數(考慮成績並列)

#求選了課程的學生人數

#查詢選修”諶燕”老師所授課程的學生中,成績最高的學生姓名及其成績

#查詢不同課程成績有相同的學生的學號.課程號.學生成績

#所有課程排名成績(不考慮並列) 學號,課程號,排名,成績 照課程,排名排序

#所有課程排名成績(考慮並列) 學號,課程號,排名,成績 照課程,排名排序

#做所有學生顯示學生名稱,課程名稱,成績,老師名稱的視圖

#查詢上過所有老師教的課程的學生 學號,學生名

#查詢包含數字的課程名

#查詢只有英文的課程名

#查詢所有學生的平均成績 並排名 , 學號,學生名,排名,平均成績(不考慮並列) 對平均成績高到低及學號低到高排序
SELECT 
  s.sno,
  s.sname,
  ROW_NUMBER() OVER (ORDER BY AVG(sc.score) DESC, s.sno ASC) AS rank1,
  ROUND(AVG(sc.score), 2) AS avg_score
FROM student s
JOIN sc ON s.sno = sc.sno
GROUP BY s.sno, s.sname
ORDER BY rank1;
#查詢所有學生的平均成績 並排名 , 學號,學生名,排名,平均成績(考慮並列) 對平均成績高到低及學號低到高排序
SELECT 
  s.sno,
  s.sname,
  DENSE_RANK() OVER (ORDER BY AVG(sc.score) DESC) AS rank1,
  ROUND(AVG(sc.score), 2) AS avg_score
FROM student s
JOIN sc ON s.sno = sc.sno
GROUP BY s.sno, s.sname
ORDER BY rank1;
#查詢課程有學生的成績是其他人成績兩倍的學號 學生名