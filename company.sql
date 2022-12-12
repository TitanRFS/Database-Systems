SELECT cust_id,cust_name,cust_surname
from customers
where cust_date_start='&ENTER DATE';
--where cust_date_start='01/01/19';

------------QUESTION 2-------------
select item_id,item_description
from items
where item_type='HARDWARE';

----------QUESTION 3--------------
select item_id,item_description
from company.items
where item_qnt<'&ENTER_QUANTITY';
----------QUESTION 4--------------
select item_id,item_description,item_qnt
from company.items
--where unit_price >'&min_price' AND unit_price< '&max_price';
where unit_price between '&min_price' AND '&max_price';--εναλλακτικός τρόπος
----------QUESTION 5--------------
select ord_id,cust_id,emp_id
from company.orders
where ord_date between '&FROM_DATE' AND '&TO_DATE';
----------QUESTION 6--------------
select ord_id,cust_id,emp_id
from company.orders
--where emp_id between '&min_number' AND '&Max_number';
where emp_id IN (1,4);
----------QUESTION 7--------------
--1os tropos
select emp_id,emp_surname,dep_id,dep_name,dep_location
from employees natural join departments;
--2o tropos 
select emp_id,emp_surname,dep_id,dep_name,dep_location
from employees join departments using(dep_id);
--3os tropos
select emp_id,emp_surname,employees.dep_id,dep_name,dep_location
from employees join departments
on employees.dep_id=departments.dep_id;
--4os tropos
select emp_id,emp_surname,employees.dep_id,dep_name,dep_location
from employees , departments
where employees.dep_id = departments.dep_id;
----------QUESTION 8---------------
select emp_id,emp_surname,emp_address,dep_location
from employees natural join departments
where dep_location='&LOCATION';
----------QUESTION 10   -----------------
select *
from employees natural join orders
where emp_id= 1 or emp_id=4;
-----Inside Class-----
select * 
from user_constraints
where table_name='EMPLOYEES';
-----QUESTION 11------
select e.ord_id,e.emp_id,e.ord_rec_date,od.item_id,od.item_descr,od.item_qnt,od.total_price,od.tot_pri_disc
from orders e join order_details od
on e.ord_id = od.ord_id;

----QUESTION 12-------
select o.ord_id,o.emp_id,o.ord_rec_date,od.item_id,od.item_descr,od.item_qnt,od.total_price,od.tot_pri_disc
from orders o join order_details od
on o.ord_id = od.ord_id
where o.ord_id='&ENTER_ID';
------QUESTION 13------
select e.emp_id,e.emp_surname,o.ord_id,o.emp_id,e.emp_address,o.ord_rec_date,d.dep_id
from employees e JOIN departments d on e.dep_id= d_dep.id
join orders o on e.emp_id= o.emp_id;

-----QUESTION 14--------
--prosorina ta afinoyme------
-----QUESTION 17--------
select dep_id,count(*) AS PLITHOS
from employees
group by dep_id
order by PLITHOS desc;
----QUESTION 18----------
select dep_id,avg(salary) 
from employees 
group by dep_id
--------QUESTION 19--------
select dep_id,emp_position,sum(salary)
from employees
group by dep_id,emp_position
order by dep_id;
-------QUESTION 20 ---------
select dep_id,max(salary)
from employees
group by dep_id
having max(salary) > 1600;
