select * from tab;
select * from employees;
select * from employees where last_name='ostin';
select employee_id , last_name from employees where last_name='Jones';


desc employees;

select employee_id,salary from employees where last_name='Smith';
select employee_id,first_name, salary from employees where last_name='Smith';

select employee_id as "종업원 번호", salary as "월급" from employees;
select employee_id as "종업원 번호", salary as "월급" from employees where last_name= 'Smith';

select distinct last_name from employees where last_name='Smith';

select employee_id , first_name, last_name,salary from employees where salary>=5000;

select employee_id, first_name, last_name,hire_date from employees where hire_date >= '04/01/01';


/* and */
select employee_id,first_name, last_name ,job_id, department_id
from employees
where department_id =50 and job_id ='SH_CLERK';




/*not*/
select employee_id,first_name, last_name ,job_id, department_id
from employees
where not (department_id=50);
/*위아래는 같은것이다 not <=> <>*/
select employee_id,first_name, last_name ,job_id, department_id
from employees
where department_id<>50;



/*or*/
select employee_id,first_name, last_name ,job_id, department_id,manager_id
from employees
where department_id=50 or manager_id=100;

/*salary >=4000 <=8000사이 조회 between을 사용하여*/
select first_name ,last_name , salary from employees
where salary between 4000 and 8000;
/*salary and 를 사용하여*/
select first_name , last_name, salary from employees
where salary >=4000 and salary <=8000;

/*or을 간단하게 하자 여러개의 조건을 동시에 가져오고 싶다*/
select first_name, last_name, salary from employees
where salary in (4000,6000,13000);

/* like를 사용하여 first_name의 첫번째 문자가 D로 시작하는 어떤 글자든 상관없이 출력해보리기*/ 
select first_name, last_name, salary from employees
where first_name like 'D%';

/*like를 사용하여 first_name 의 마지막 문자가 d로 끝내는 어떤 글자든 상관없이 select 해오기*/
select first_name, last_name, salary from employees
where first_name like '%d';

/*2번째 first_name 중 a로 끝나는 단어를 얻어오고 싶을때*/
select first_name, last_name, salary from employees
where first_name like '_a%';
/*3번째 first_name 중 a로 끝나는 단어를 얻어오고 싶을때*/
select first_name, last_name, salary from employees
where first_name like '__a%';

/*commission_pct 보기 NULL과 비교할 때는 is를 쓰는 구나*/
select first_name, last_name, salary, commission_pct from employees
where commission_pct is NULL;

select first_name, last_name, salary, commission_pct from employees
where commission_pct is not NULL;

/*오름 차순으로 출력하기 생략을 하더라도 저절로 오름차순 정렬이다*/
select employee_id, first_name ,last_name from employees
order by employee_id ASC;

/*내림 차순으로 출력하기 .*/
select employee_id, first_name ,last_name from employees
order by employee_id DESC;

/*sum함수에 대해 알아보자*/
select sum(salary) from employees;

/*count함수에 대해 알아보자 이 값은 전체 레코드 수를 나타낸다.*/
select count(*) from employees;
select count(all employee_id) from employees;
select count(distinct employee_id) from employees;
select count(all last_name) from employees;/*중복허용*/
select count(distinct last_name) from employees;



/*avg함수에 대해 알아보자 평균값!*/
select avg(salary) from employees where department_id=50;

/*최대 최소 함수 max min */
select max(salary) from employees;
select min(salary) from employees;
select max(hire_date) from employees;
select min(hire_date) from employees;
/*where절 에서는 집계함수를 사용할 수 없다 group function is not allowed here -> max()
select employee_id, first_name from employees where salary=max(salary);*/

/*number function*/
/*abs()*/
select abs(-23) from dual;/*dual은 오라클에서 제공하는 dummy table이다. 열이 하나이다. 테이블이 없으면 그렇니까 그냥 오라클에서 제공해주는 테이블*/

/*sign() 양 음 0 판독 하기*/
select sign(23), sign(-23), sign(0) from dual;

/*round() 반올림 함수 인자도 있다.*/
select round(0.123), round(0.5), round(0.499) from dual;
select round(0.12345678,6) ,round(2.34567890,4) from dual;


/*trunc(n1,n2)함수에 대해 알아보자*/
select trunc(1234.1234567,0) from dual;
select trunc(12345.12342) zero from dual;
select trunc(12345.56712,2) from dual;
select trunc(1234.1234,-2) from dual;

/*ceil(a) 함수 32와 33에서 큰 정수의 값을 선택한다. 이것과 반대되는 함수가 floor */
select ceil(32.8)  ceil from dual;
select ceil(32.2) ceil from dual;
select floor(32.3) floor from dual;
select floor(32) floor from dual;

/*power() 함수에 대해 알아보자*/
select power(4,2) from dual;

/*mod()함수에 대해 알아보자*/
select mod(1234,13) from dual;

/*sqrt() 함수에 대해 알아보자 제곱근 구하는함수*/
select sqrt(2), sqrt(3), sqrt(4) from dual;


/*문자형 함수에 대해 알아보자*/
/*concat(char1,char2) 두 개의 문자열을 서로 합치는 것*/
select concat('hello','bye'),concat('good','bad') from dual;
select concat('good','bad') ,'good'||'bad' from dual;

/*initcap(char)안에 있는 문자열의 첫 단어와 공백 뒤의 단어의 다음 단어를 대문자로 만드는 역할,알파벳이 아닌것을 다 구분자로 생각하며, 그 뒤의 단어를 다 대문자로 바꾼다*/
select initcap('good/b,ad morning') from dual;

/*lower(char),upper(char) 소문자화 대문자화*/
select lower('GOOD'), upper('bad') from dual;


/*lpad(char) 6만큼 표현 하는 패드*/
select lpad('good_morning',6) "lpad" from dual;/* 결과 값 속성을 lpad로 표시하겠다*/
select lpad('good',6,'@') "lpad2" ,lpad('bad',8,'a') "lpad3" from dual;/* 결과 값 속성을 lpad2로 표시하겠다*/

/*rpad(char) */
select rpad('good_morning',6) "rpad" from dual;/* 결과 값 속성을 lpad로 표시하겠다*/
select rpad('good',6,'@') "rpad2" ,rpad('bad',8,'a') "rpad3" from dual;/* 결과 값 속성을 lpad2로 표시하겠다*/
/*주의 해야할 것은 한글은 2바이트 씩 계산을 해서 1바이트의 영어랑은 다르다*/
select lpad('한글',8,'#') from dual;


/*ltrim(), rtrim()*/
select ltrim('goodbye','g'),ltrim('goodbye','o'),
ltrim('goodbye','go')
from dual;/*특정 값을 지우게 되는구나, 하지만 중간에 끼인 문자는 지울 수가 없다. 왼쪽부터 시작해서 o가 이미 뒤에 또 있기때문에 bdye만 남게된다.*/
select rtrim('goodbye','g'),rtrim('goodbye','e') from dual;


/*substr() 함수에대해 알아보자*/
select substr('goodmorning jogn',8,4) from dual;/*8번째 위치에서부터 4글짜를 가져오겠다.*/
select substr('goodmorning jogn',8) from dual;/*8번째 위치에서부터 모두 가져오겠다.*/

select substr('goodmorning jogn',-4) from dual;/*-가 붙으면 오른쪽으로 부터 4글자 가져오겠다.*/
select substr('goodmorning jogn',-4,2) from dual;/*-4의 위치 즉, 오른쪽에서 4번재부터 2개만큼 가지고 오겠다*/

/*substrb() 함수는 byte만큼 가져오겠다는 의미이다. 영어일때는 문제가 되지 않지만, 한글일 때 문제가 된다 2바이트를 차지하기 때문에*/
select substrb('goodmorning jogn',-4) from dual;

/*replace() 함수*/
select replace('goodmorning','morning','evening') from dual;/*goodmorning에서 morning을 evening으로 교체하겠다.*/

/*translate() 함수*/
select replace('you are not alone','you','we') "replace", translate('you are not aloneuuuuuuuu','you','we') "translate" from dual;/*y->w o->e u->지워버리네*/

/*trim()*/
select trim(leading from 'good') from dual;
select length(trim(leading from ' good ')) from dual;/*왜 6이 아니고 5일까 trim을 이용해 leadingd옵션으로 앞의 공백문자를 제거했다*/
select trim(trailing from 'good') from dual;
select length(trim(trailing from'good ')) from dual;
select trim(both from 'good') from dual;
select length(trim(both from ' good '))from dual;

select trim(leading 'g' from 'good') from dual;
select trim(trailing 'o' from 'goo') from dual;
select trim(both 'g' from 'goodg') from dual;

/*ascii() 함수*/
select ascii('a') from dual;

/*instr() 함수*/
select instr('goodmorning john','orn',1) from dual;
select instr('goodmorning john','n',1,2) from dual;/*n의 위치를 알아내는 데 처음 글자부터 시작해서 2번째 n의 위치를 알아내겠다*/
select instr('goodmorning john', 'o',3,3) from dual;/*o의 위치를 알아내는 데 세번째 글자부터 시작해서 3번째 o의 위치를 알아내겠다*/