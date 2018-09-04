/*sysdate() �ý����� ��¥�� ���ؿ��� ���� �� �� �ִ�.*/
select employee_id from employees;
select sysdate from dual;
/*months_between(date1, date2) �� ��¥ ���̿� ���� ã�� ���*/ 
select * from employees;
select first_name, last_name ,months_between(sysdate,hire_date)from employees 
where months_between(sysdate,hire_date)>180;

/*add_months()*/
select add_months(sysdate,4) from dual;
/*next_day()���� ����� �ش� ������ ��¥�� �˻����� */
select next_day(sysdate,'�Ͽ���') from dual;
select next_day(sysdate,'������') from dual;

/*last_day() �ش� ���� ������ ��¥�� ������*/
select last_day(sysdate) from dual;

/*to_char() ���ڿ� ���·� �����ͷ� �ٲ��ش�.*/
select to_char(sysdate,'yyyy/mm/dd') from dual;

/*to_date() ���ڸ� ��¥���·� �ٲ��ش�.*/
select to_date('1994/09/04','yyyy/mm/dd') from dual;

/*nvl(): �ΰ��� �ٸ� �����ͷ� ���� �ϴ� �Լ��̴�*/
select * from employees;
select first_name, last_name, nvl(commission_pct,0)"NO_commission"from employees;

/*decode() : switch���� ���� ������ �ϴ� �Լ�*/
select * from departments;

select department_id, decode(department_id,90,'�ӿ��μ�',60,'����',80,'�Ǹ�','�Ϲ�')/*�����ؾ��Ұ��� '�Ϲ�'�� default�� �ϴ� ���� �˾Ƶд�.*/
from employees;

/*case() : else if���� ����� ������ �Ѵ�*/
select first_name, last_name, department_id,
case when department_id = 60 then '����'
     when department_id = 90 then '�ӿ�'
     when department_id = 80 then '�Ǹ�'
     else '�Ϲ�' 
     end "�μ���"/*�Ӽ� ������ �μ����� �ο��� �־���.*/
from employees;