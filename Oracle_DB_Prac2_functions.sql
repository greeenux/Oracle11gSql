/*sysdate() 시스템의 날짜를 구해오는 것을 할 수 있다.*/
select employee_id from employees;
select sysdate from dual;
/*months_between(date1, date2) 두 날짜 사이에 월을 찾는 경우*/ 
select * from employees;
select first_name, last_name ,months_between(sysdate,hire_date)from employees 
where months_between(sysdate,hire_date)>180;

/*add_months()*/
select add_months(sysdate,4) from dual;
/*next_day()가장 가까운 해당 요일의 날짜를 검색해줌 */
select next_day(sysdate,'일요일') from dual;
select next_day(sysdate,'수요일') from dual;

/*last_day() 해당 달의 마지막 날짜를 구해줌*/
select last_day(sysdate) from dual;

/*to_char() 문자열 형태로 데이터로 바꿔준다.*/
select to_char(sysdate,'yyyy/mm/dd') from dual;

/*to_date() 문자를 날짜형태로 바꿔준다.*/
select to_date('1994/09/04','yyyy/mm/dd') from dual;

/*nvl(): 널값을 다른 데이터로 변경 하는 함수이다*/
select * from employees;
select first_name, last_name, nvl(commission_pct,0)"NO_commission"from employees;

/*decode() : switch문과 같은 역할을 하는 함수*/
select * from departments;

select department_id, decode(department_id,90,'임원부서',60,'전산',80,'판매','일반')/*주의해야할것이 '일반'을 default로 하는 것을 알아둔다.*/
from employees;

/*case() : else if문과 비슷한 역할을 한다*/
select first_name, last_name, department_id,
case when department_id = 60 then '전산'
     when department_id = 90 then '임원'
     when department_id = 80 then '판매'
     else '일반' 
     end "부서명"/*속성 명으로 부서명을 부여해 주었다.*/
from employees;