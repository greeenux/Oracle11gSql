select * from tab;
select * from employees;
select * from employees where last_name='ostin';
select employee_id , last_name from employees where last_name='Jones';


desc employees;

select employee_id,salary from employees where last_name='Smith';
select employee_id,first_name, salary from employees where last_name='Smith';

select employee_id as "������ ��ȣ", salary as "����" from employees;
select employee_id as "������ ��ȣ", salary as "����" from employees where last_name= 'Smith';

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
/*���Ʒ��� �������̴� not <=> <>*/
select employee_id,first_name, last_name ,job_id, department_id
from employees
where department_id<>50;



/*or*/
select employee_id,first_name, last_name ,job_id, department_id,manager_id
from employees
where department_id=50 or manager_id=100;

/*salary >=4000 <=8000���� ��ȸ between�� ����Ͽ�*/
select first_name ,last_name , salary from employees
where salary between 4000 and 8000;
/*salary and �� ����Ͽ�*/
select first_name , last_name, salary from employees
where salary >=4000 and salary <=8000;

/*or�� �����ϰ� ���� �������� ������ ���ÿ� �������� �ʹ�*/
select first_name, last_name, salary from employees
where salary in (4000,6000,13000);

/* like�� ����Ͽ� first_name�� ù��° ���ڰ� D�� �����ϴ� � ���ڵ� ������� ����غ�����*/ 
select first_name, last_name, salary from employees
where first_name like 'D%';

/*like�� ����Ͽ� first_name �� ������ ���ڰ� d�� ������ � ���ڵ� ������� select �ؿ���*/
select first_name, last_name, salary from employees
where first_name like '%d';

/*2��° first_name �� a�� ������ �ܾ ������ ������*/
select first_name, last_name, salary from employees
where first_name like '_a%';
/*3��° first_name �� a�� ������ �ܾ ������ ������*/
select first_name, last_name, salary from employees
where first_name like '__a%';

/*commission_pct ���� NULL�� ���� ���� is�� ���� ����*/
select first_name, last_name, salary, commission_pct from employees
where commission_pct is NULL;

select first_name, last_name, salary, commission_pct from employees
where commission_pct is not NULL;

/*���� �������� ����ϱ� ������ �ϴ��� ������ �������� �����̴�*/
select employee_id, first_name ,last_name from employees
order by employee_id ASC;

/*���� �������� ����ϱ� .*/
select employee_id, first_name ,last_name from employees
order by employee_id DESC;

/*sum�Լ��� ���� �˾ƺ���*/
select sum(salary) from employees;

/*count�Լ��� ���� �˾ƺ��� �� ���� ��ü ���ڵ� ���� ��Ÿ����.*/
select count(*) from employees;
select count(all employee_id) from employees;
select count(distinct employee_id) from employees;
select count(all last_name) from employees;/*�ߺ����*/
select count(distinct last_name) from employees;



/*avg�Լ��� ���� �˾ƺ��� ��հ�!*/
select avg(salary) from employees where department_id=50;

/*�ִ� �ּ� �Լ� max min */
select max(salary) from employees;
select min(salary) from employees;
select max(hire_date) from employees;
select min(hire_date) from employees;
/*where�� ������ �����Լ��� ����� �� ���� group function is not allowed here -> max()
select employee_id, first_name from employees where salary=max(salary);*/

/*number function*/
/*abs()*/
select abs(-23) from dual;/*dual�� ����Ŭ���� �����ϴ� dummy table�̴�. ���� �ϳ��̴�. ���̺��� ������ �׷��ϱ� �׳� ����Ŭ���� �������ִ� ���̺�*/

/*sign() �� �� 0 �ǵ� �ϱ�*/
select sign(23), sign(-23), sign(0) from dual;

/*round() �ݿø� �Լ� ���ڵ� �ִ�.*/
select round(0.123), round(0.5), round(0.499) from dual;
select round(0.12345678,6) ,round(2.34567890,4) from dual;


/*trunc(n1,n2)�Լ��� ���� �˾ƺ���*/
select trunc(1234.1234567,0) from dual;
select trunc(12345.12342) zero from dual;
select trunc(12345.56712,2) from dual;
select trunc(1234.1234,-2) from dual;

/*ceil(a) �Լ� 32�� 33���� ū ������ ���� �����Ѵ�. �̰Ͱ� �ݴ�Ǵ� �Լ��� floor */
select ceil(32.8)  ceil from dual;
select ceil(32.2) ceil from dual;
select floor(32.3) floor from dual;
select floor(32) floor from dual;

/*power() �Լ��� ���� �˾ƺ���*/
select power(4,2) from dual;

/*mod()�Լ��� ���� �˾ƺ���*/
select mod(1234,13) from dual;

/*sqrt() �Լ��� ���� �˾ƺ��� ������ ���ϴ��Լ�*/
select sqrt(2), sqrt(3), sqrt(4) from dual;


/*������ �Լ��� ���� �˾ƺ���*/
/*concat(char1,char2) �� ���� ���ڿ��� ���� ��ġ�� ��*/
select concat('hello','bye'),concat('good','bad') from dual;
select concat('good','bad') ,'good'||'bad' from dual;

/*initcap(char)�ȿ� �ִ� ���ڿ��� ù �ܾ�� ���� ���� �ܾ��� ���� �ܾ �빮�ڷ� ����� ����,���ĺ��� �ƴѰ��� �� �����ڷ� �����ϸ�, �� ���� �ܾ �� �빮�ڷ� �ٲ۴�*/
select initcap('good/b,ad morning') from dual;

/*lower(char),upper(char) �ҹ���ȭ �빮��ȭ*/
select lower('GOOD'), upper('bad') from dual;


/*lpad(char) 6��ŭ ǥ�� �ϴ� �е�*/
select lpad('good_morning',6) "lpad" from dual;/* ��� �� �Ӽ��� lpad�� ǥ���ϰڴ�*/
select lpad('good',6,'@') "lpad2" ,lpad('bad',8,'a') "lpad3" from dual;/* ��� �� �Ӽ��� lpad2�� ǥ���ϰڴ�*/

/*rpad(char) */
select rpad('good_morning',6) "rpad" from dual;/* ��� �� �Ӽ��� lpad�� ǥ���ϰڴ�*/
select rpad('good',6,'@') "rpad2" ,rpad('bad',8,'a') "rpad3" from dual;/* ��� �� �Ӽ��� lpad2�� ǥ���ϰڴ�*/
/*���� �ؾ��� ���� �ѱ��� 2����Ʈ �� ����� �ؼ� 1����Ʈ�� ������� �ٸ���*/
select lpad('�ѱ�',8,'#') from dual;


/*ltrim(), rtrim()*/
select ltrim('goodbye','g'),ltrim('goodbye','o'),
ltrim('goodbye','go')
from dual;/*Ư�� ���� ����� �Ǵ±���, ������ �߰��� ���� ���ڴ� ���� ���� ����. ���ʺ��� �����ؼ� o�� �̹� �ڿ� �� �ֱ⶧���� bdye�� ���Եȴ�.*/
select rtrim('goodbye','g'),rtrim('goodbye','e') from dual;


/*substr() �Լ������� �˾ƺ���*/
select substr('goodmorning jogn',8,4) from dual;/*8��° ��ġ�������� 4��¥�� �������ڴ�.*/
select substr('goodmorning jogn',8) from dual;/*8��° ��ġ�������� ��� �������ڴ�.*/

select substr('goodmorning jogn',-4) from dual;/*-�� ������ ���������� ���� 4���� �������ڴ�.*/
select substr('goodmorning jogn',-4,2) from dual;/*-4�� ��ġ ��, �����ʿ��� 4������� 2����ŭ ������ ���ڴ�*/

/*substrb() �Լ��� byte��ŭ �������ڴٴ� �ǹ��̴�. �����϶��� ������ ���� ������, �ѱ��� �� ������ �ȴ� 2����Ʈ�� �����ϱ� ������*/
select substrb('goodmorning jogn',-4) from dual;

/*replace() �Լ�*/
select replace('goodmorning','morning','evening') from dual;/*goodmorning���� morning�� evening���� ��ü�ϰڴ�.*/

/*translate() �Լ�*/
select replace('you are not alone','you','we') "replace", translate('you are not aloneuuuuuuuu','you','we') "translate" from dual;/*y->w o->e u->����������*/

/*trim()*/
select trim(leading from 'good') from dual;
select length(trim(leading from ' good ')) from dual;/*�� 6�� �ƴϰ� 5�ϱ� trim�� �̿��� leadingd�ɼ����� ���� ���鹮�ڸ� �����ߴ�*/
select trim(trailing from 'good') from dual;
select length(trim(trailing from'good ')) from dual;
select trim(both from 'good') from dual;
select length(trim(both from ' good '))from dual;

select trim(leading 'g' from 'good') from dual;
select trim(trailing 'o' from 'goo') from dual;
select trim(both 'g' from 'goodg') from dual;

/*ascii() �Լ�*/
select ascii('a') from dual;

/*instr() �Լ�*/
select instr('goodmorning john','orn',1) from dual;
select instr('goodmorning john','n',1,2) from dual;/*n�� ��ġ�� �˾Ƴ��� �� ó�� ���ں��� �����ؼ� 2��° n�� ��ġ�� �˾Ƴ��ڴ�*/
select instr('goodmorning john', 'o',3,3) from dual;/*o�� ��ġ�� �˾Ƴ��� �� ����° ���ں��� �����ؼ� 3��° o�� ��ġ�� �˾Ƴ��ڴ�*/