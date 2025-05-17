show databases;
use mysql;
use world;
show tables;
use world;
use sql_intro;
show databases;
show tables;

create database world;
describe emp_details;

create table emp_details(
Name varchar(255), Age int, sex char(1), doj date, city varchar(255), salary float 
);

INSERT INTO  emp_details(`Name`,`Age`,`sex`,`dog`,`city_name`,`salary`)
values('test',30,'M','12-5-09','Sailum',40000),
('rohit', 20 , 'M','17-5-23','combitore',950000),
('sheenu', 22 , 'F','16-05-23','dhaka',650000),
('toni', 24 , 'F','14-06-20','japan',450000),
('upen', 30 , 'M','18-03-10','africa',550000);

select distinct city from emp_details;
select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select avg(salary) avg_salary from emp_details;
select name,age, city from emp_details;
select * from emp_details where age>30;
select name,sex,city from emp_details where sex='F';
select * from emp_details where city='chicago' or city = 'Austin';
select * from emp_details where city IN ('chicago','Austin');
select * from emp_details where doj between '2012-05-09' and '2016-05-09';
select * from emp_details where age>30 and sex = 'M';
select sex, sum(salary) as total_sal from emp_details group by sex;
select * from emp_details order by salary desc;
select (10+20) as sum;
select (30-10) as substract;
select length('India') as t_lenth;
select repeat('@', 10);
select upper('gjhdjds');
select lower('GHJKJKJA'); 
select curdate();
select day(curdate());
select now();
select stud_name, character_length(stud_name) as size_of_student from students;
select * from students;
select concat("india", "is","in","asia") as merged;
select stud_id,stud_name, concat(stud_name,"",age) as name_age from students;
select stud_id, stud_name, concat(stud_name,"",city) as name_with_city from students;
select reverse('india');
select reverse(stud_name) as stud_reverse from students;
select replace("orange is a vegetable","vegetable","fruits");
select length("              India             ");
select length(trim("              India             "));
select length(ltrim("              India             "));
select length(rtrim("              India             "));
-- removing leading spaces triling spaces ltrim or rtrim;-- 
select position("fruit" in "Orange is a fruit") as name;
select ascii('4');
show databases;
use sql_intro;
show tables;
describe employee;
select * from employee;
insert into employee(`Employee_id`,`Emp_name`,`Age`,`gender`,`Doj`,`city`,`salary`) 
  values(1,'test',39,'M','12-5-09','chicago',40000),
		(2,'rohit',20,'M','17-5-23','usa',950000),
		(3,'sheenu',22,'F','16-05-23','Boston',650000),
		(4,'toni',24,'F','14-06-20','Austin',450000),
		(5,'upen',30,'M','18-03-10','africa',550000),
		(6,'raju',29,'M','27-5-23','uk',1950000),
		(7,'keshavv',32, 'F','26-05-23','china',680000),
		(8,'aoohi',44,'F','24-06-20','indonessia',850000),
		(9,'sheetal',40,'F','17-03-10','nepal',750000);

select distinct city from employee;
select distinct dept from employee; 
select avg(age) from employee;
select dept, avg(age) as avg_age from employee group by dept;
select dept, round(avg(age),1) as avg_aage from employee group by dept;
select dept , sum(salary) as total_salary from employee group by dept;
select count(Employee_id), city as emp_city from employee group by city order by count(Employee_id) desc;
select year(Doj) as year_count, count(Employee_id) from employee group by year(Doj);
select product_id, sum(sell_price * quantity) as revenue from sales group by product_id;
desc c_product;
select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit from 
sales as s inner join c_product as c where s.product_id = c.product_id group by c.product_id;
select * from employee;
select Dept,avg(salary) as dept_salary from employee group by Dept having avg(salary) >750000;
select city, sum(salary) as city_sal from employee group by city having sum(salary) >20000;
select Dept, count(*) as count_data from employee group by Dept  having count(*) > 2;
select city, count(*) as c_count from employee where city !='Houstan' group by city having count(*) >2 ;
select Dept, count(*) as emp_count from employee group by Dept having avg(salary) > 7000;
describe sales;
select * from employee;
use classicmodels;
show tables;
desc products;
desc productlines;
select * from productlines;
insert into productlines(`productline`,`textdescription`,`htmldescription`,`image`)
		values('classic cars','Attention Cars Enthustices','',''),
        ('Motorcycles','our motorcycles are statment','',''),
        ('Planes','unique or diecast aeroplane','',''),
        ('ships','The perfect holiday or aero city gurugram','',''),
        ('Trains','Models Trains are rewards','',''),
        ('yacht','Best way to tour in yacht','','');
        
select product_code, product_name, textdescription from products inner join productlines using(productline);     
select * from orders;
desc orders;
insert into orders(`OrderNumber`,`orderDate`,`required_date`,`ShippedDate`,`status`,`comments`,`CustomerNumber`)
				  values(10100,    '2004-01-06',  '2003-01-13',   '2003-01-10',   'shipped', '', 363),
						(10101,    '2006-01-09',  '2003-01-18',   '2003-01-11',   'shipped','Check Availability',128),
						(10102,    '2007-01-10',  '2003-01-17',   '2003-01-14',   'shipped','',181),
						(10103,    '2008-01-29',  '2003-01-07',   '2003-01-02',   'shipped','',121),
						(10104,    '2009-01-14',  '2003-01-04',   '2003-01-09',   'shipped','',141),
						(10105,    '2003-01-20',  '2003-01-28',   '2003-01-04',   'shipped','',187);
                        
create table orderdetails(
	OrderNumber int primary key,
    product_code int,
    quantityOrdered int,
    priceEach float,
    orderLineNumber int
);
desc orderdetails;
alter table orderdetails modify OrderNumber int;
ALTER TABLE user_customer_permission DROP PRIMARY KEY;
 insert into orderdetails(`OrderNumber`,`product_code`,`quantityOrdered`,`priceEach`,`orderLineNumber`)
				  values(10100,    'S_10_1678',  '90',   '138.00',   '5'),
                  (10100,    'S_10_1688',  '30',   '136.00',   '3'),
                  (10100,    'S_10_1949',  '50',   '55.09',   '2'),
                  (10100,    'S_10_2016',  '22',   '75.46',   '6'),
                  (10101,    'S_10_4698',  '49',   '35.29',   '1'),
                  (10100,    'S_10_4353',  '25',   '108.06',   '7');
	
    INSERT INTO orderdetails (OrderNumber, product_code, quantityOrdered, priceEach, orderLineNumber)
VALUES
    (10100, 'S18_1756', 90, 138.00, 5),
    (10100, 'S18_1749', 30, 136.00, 3),
    (10100, 'S18_2248', 50, 55.09, 2),
    (10100, 'S18_4409', 22, 75.46, 4),
    (10101, 'S18_3969', 49, 35.29, 1),
    (10100, 'S18_2325', 25, 108.06, 4);
    select * from products;
  Drop table orderdetails;  
 CREATE TABLE orderdetails (
    OrderNumber INT,
    product_code VARCHAR(15),  -- Adjust size to match product_code type in products table
    quantityOrdered INT,
    priceEach FLOAT,
    orderLineNumber INT,
    PRIMARY KEY (OrderNumber, orderLineNumber),  -- Composite primary key
    FOREIGN KEY (OrderNumber) REFERENCES orders(OrderNumber),
    FOREIGN KEY (product_code) REFERENCES products(product_code)
);          
desc orders;
select * from products;
desc orderdetails;
desc products;
select * from productlines;
use classicmodels;
show tables;
select o.OrderNumber, o.status, p.product_name, sum(quantityOrdered * priceEach) as revenue from orders as o inner join 
orderdetails as od on o.OrderNumber=od.OrderNumber inner join products as p on p.product_code = od.product_code group by o.OrderNumber,p.product_name;



create table city(
id int auto_increment primary key,
Name varchar(50),
Countrycode varchar(255),
Distict varchar(255),
population int
);
use world;
select * from city;
INSERT INTO  city(`id`,`Name`,`Countrycode`,`Distict`,`population`) 
values(2,'tamilnadu','TLL12', 'Sailum',40000),
(3,'luckhnow','MMBL12', 'Dadar',550000), 
(4,'bherampur','SFBL12', 'Malvyia',650000);
 show create table city;
 describe city;
 show tables;
 create database sql_into;
 show databases;
 create table emp_details(
 Name varchar(25),
 Age int,
 sex char(1),
 dog date,
 city_name varchar(50),
 salary float
 );
show databases;
use sql_joins;
show tables;
desc cricket;
desc football;
select * from cricket;
select * from football;
select * from cricket as c inner join football as f on  c.name=f.name; 
select * from cricket as c inner join football as f on c.name=f.name;
select c.cricket_id,  c.name , f.football_id, f.name from cricket as c inner join football as f on c.name=f.name;
use classicmodels;
show databases;
show tables;
describe students;
use sql_intro;
show tables;
insert into students(`stud_id`,`stud_name`,`age`,`gender`,`doa`,`city`)
	values(2,'eiru','18','F','xyz','Delhi'),
    (3,'diru','38','F','abc','china'),
    (4,'vsiru','48','M','def','hongkong'),
    (5,'niru','58','F','ghu','netherland'),
    (6,'imru','68','M','amu','denmark');
    
drop table emp_details;
describe emp_details;
INSERT INTO  emp_details(`Name`,`Age`,`sex`,`dog`,`city_name`,`salary`)
values('test',30,'M','12-5-09','Sailum',40000),
('rohit', 20 , 'M','17-5-23','combitore',950000),
('sheenu', 22 , 'F','16-05-23','dhaka',650000),
('toni', 24 , 'F','14-06-20','japan',450000),
('upen', 30 , 'M','18-03-10','africa',550000);

select distinct city_name from  emp_details;
select * from emp_details;
show databases;
use sql_intro;
use world;
show tables;
select * from city;
describe city;
drop database sql_into;
show databases;
use world;
create table emp_details(
	name varchar(25),
    Age int,
    sex char(1),
    doj date,
    city varchar(15),
    salary float
);
describe emp_details;

insert into emp_details(`name`,`Age`,`sex`,`doj`,`city`,`salary`) 
  values('test',39,'M','12-5-09','chicago',40000),
		('rohit',20,'M','17-5-23','usa',950000),
		('sheenu',22,'F','16-05-23','Boston',650000),
		('toni',24,'F','14-06-20','Austin',450000),
		('upen',30,'M','18-03-10','africa',550000),
		('raju',29,'M','27-5-23','uk',1950000),
		('keshavv',32, 'F','26-05-23','china',680000),
		('aoohi',44,'F','24-06-20','indonessia',850000),
		('sheetal',40,'F','17-03-10','nepal',750000);
select * from emp_details;        
select city from emp_details;
select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select avg(salary) as avg_salary from emp_details;
select name,age,city from emp_details;
select * from emp_details where age > 30;
select name,age,sex,city from emp_details where sex = 'F';
select * from emp_details where city = 'chicago' or city='nepal';
select * from emp_details where city in('chicago','Boston');
select * from emp_details where doj between '2017-05-23' and '2024-06-20';
select * from emp_details where age > 30 and sex = 'M';
select sex, sum(salary) as total_salary from emp_details group by sex;
select * from emp_details order by salary DESC;
select (10+20) as addition;
select (10-20) as substract;
select length('India') as total_length;	
select repeat('@',20);
select upper('india');
select lower('LOWER');
select curdate();
select day(curdate());
select now();

-- mysql string function -- 
select upper('india') as upper_case;
select lower('INDIA') as lower_case;
select lcase('INDIA') as lower_case;
select stud_name, character_length(stud_name) as total_length from students;
select stud_name, char_length(stud_name) as total_length from students;
select concat('india',' is',' in asia') as  merged;
select stud_id, stud_name, concat(stud_name, " ",age) as name_age from students;
select reverse('india');
select reverse(stud_name) from students;
select replace("orange is a vegetable","vegetable","fruits");
select replace("orange is a vegetable","orange","Manngo");
select length(rtrim("      india       "));
select length(ltrim("      india       ")); 
-- both leading space remove or trealing space reove -- 
select length("      india      ");
select position("fruit" in "Orange is a fruit") as name;
select ascii('a');
select ascii(4);

create table employee(
Employee_id int primary key,
Emp_name varchar(25),
Age int,
gender char(1),
Doj date,
Dept varchar(20),
city varchar(25),
salary float
);
describe employee;
insert into employee(`Employee_id`,`Emp_name`,`Age`,`gender`,`Doj`,`city`,`salary`) 
  values(1,'test',39,'M','12-5-09','chicago',40000),
		(2,'rohit',20,'M','17-5-23','usa',950000),
		(3,'sheenu',22,'F','16-05-23','Boston',650000),
		(4,'toni',24,'F','14-06-20','Austin',450000),
		(5,'upen',30,'M','18-03-10','africa',550000),
		(6,'raju',29,'M','27-5-23','uk',1950000),
		(7,'keshavv',32, 'F','26-05-23','china',680000),
		(8,'aoohi',44,'F','24-06-20','indonessia',850000),
		(9,'sheetal',40,'F','17-03-10','nepal',750000);

select * from employee;
update employee set Dept = case
when Employee_id = 1 then fi
when Employee_id = 2 then sales
when Employee_id = 3 then it
when Employee_id = 4 then ec
when Employee_id = 5 then ed
when Employee_id = 6 then projectmanager
when Employee_id = 7 then manager
when Employee_id = 8 then emu
else Dept
End
where Employee_id in(1,2,3,4,5,6,7,8);

UPDATE employee
SET Dept = CASE
    WHEN Employee_id = 1 THEN 'fi'
    WHEN Employee_id = 2 THEN 'sales'
    WHEN Employee_id = 3 THEN 'it'
    WHEN Employee_id = 4 THEN 'ec'
    WHEN Employee_id = 5 THEN 'ed'
    WHEN Employee_id = 6 THEN 'projectmanager'
    WHEN Employee_id = 7 THEN 'manager'
    WHEN Employee_id = 8 THEN 'emu'
    ELSE Dept
END
WHERE Employee_id IN (1, 2, 3, 4, 5, 6, 7, 8);
select distinct city from employee;
select distinct dept from employee;
select avg(age) from employee;
select dept, round(avg(age),1) as age_average from employee group by dept;
select dept, sum(salary) as final_salary from employee group by dept;
select  count(Employee_id), city from employee group by city order by count(employee_id) desc;     
select count(employee_id), city from employee group by city order by count(employee_id) asc;
select year(doj) as year, count(employee_id) from employee group by year(doj); 
create table sales(
product_id int,
sell_price float,
quantity int,
state varchar(20));
select * from sales;
insert into sales (`product_id`,`sell_price`,`quantity`,`state`)
values(121,320.0,5,'califronia'),
(121,320.0,6,'Texas'),
(121,320.0,3,'alaska'),
(121,440.0,4,'texas'),
(123,520.0,2,'california'),
(123,120.0,7,'russia'),
(122,280.00,3,'azerbezan');
select product_id,sum(sell_price * quantity) as revenue from sales group by product_id;
create table c_product(
produt_id int,
cost_price float
);
select * from c_product;
describe c_product;
alter table c_product change column product_id product_id int;
insert into c_product(`produt_id`,`cost_price`)
values('121',270.0),
		('123', 250.0);
select c.product_id,sum((s.sell_price - cost_price) * s.quantity) as profit 
from sales as s inner join c_product as c where s.product_id = c.product_id group by c.product_id;
describe sales;
select  * from employee;
select Dept, avg(salary) as avg_sal from employee group by Dept having avg(salary) > 40000;
select city, sum(salary) as total_sal from employee group by city having sum(salary) >20000;
select Dept, count(*) as emp_count from employee group by Dept having count(*)>2; 
select city,count(*) as emp_count from employee where city != "chicago" group by city having count(*) >2;
select Dept, count(*) as emp_count from employee group by Dept having avg(salary) > 40000;

create database sql_joins;
show databases;
use sql_joins;
show tables;
create table cricket(
cricket_id int auto_increment,
name varchar(30), primary key(cricket_id)
);
insert into cricket(name)
values('staurat'),('Michael'),('johnson'),('hyden'),('fleming');
select * from cricket;
insert into football(name)
values('staurat'),('johnson'),('hyden'),('langer'),('Astle');
select * from football;

select * from cricket as c inner join 
football as f on c.name=f.name; 

select c.cricket_id, c.name, f.football_id,f.name from cricket as
c inner join football as f on c.name=f.name;

select c.c_id,c.name, f.f_id,f.name 
from circket as c inner join football as f on c.name=f.name;

select c.cricket_id,c.name, f.football_id,f.name 
from cricket as c inner join football as f on c.name=f.name;
select c.cricket_id,c.name,f.football_id,f.name from cricket
as c inner join football as f on f.name=c.name;

select * from cricket as c inner join football as f on c.name=f.name;
select * from cricket as c inner join  football as f on c.name=f.name;

create table football(
football_id int auto_increment,
name varchar(30), primary key(football_id)
);

create table orders(
	Orderid int primary key,
    OrderDate date,
    ShippedDate date,
    ProductName varchar(255),
    statusofDelivery char(1),
    Quantity int,
    priceOfproduct float
);
show tables;
create database classicmodels;
create table products(
product_code varchar(255) unique,
product_name varchar(255),
productline varchar(120),
productscale float,
productvendor varchar(255),
productDescription varchar(255),
quantityinstock int,
buyprice float,
msrp float
);
desc products;
select * from productlines;
select * from products;
select product_code, product_name, textdescription from products 
inner join productslines using (productline);
insert into products
values('S10_1678','1969 Harley Davisdon','Motorcycles',1:10,
'Min Lin Diecast','this replica features words',7933,48.81,95.70),
('S10_1949','1952 Alpine Renault 1300','classic cars',1:10,
'Min Lin Diecast','Turnable font wheels ',7933,48.81,95.70)
('S11_2016','1996 Moto guzzi 1100i','Motorcycles',1:10,
'Min Lin Diecast','official moto guzzi locals',7933,48.81,95.70)
('S10_4698','2003 Bullet classic','Motorcycles',1:10,
'Min Lin Diecast','model features other officials',7933,48.81,95.70) 
create table productlines(
productline varchar(255) primary key,
textdescription varchar(255),
htmldescription varchar(200),
image char
);
desc productlines;
create table Customers(
	Orderid int,
    Customerid int,
    phonenumber int,
    customername varchar(255),
    address varchar(255)
);

select o.ordernumber, o.status,p.productname,
sum(quanityordered*priceeach) as 
revenue from orders as o 
inner join orderdetails as od on o.ordernumber=od.ordernumber inner join products
as p on p.productcode = od.productcode group by ordernumber;

create database subquery;
use subquery;
create table employees(
Emp_id int primary key,
Emp_name varchar(255),
Age int,
Gender char(1),
Doj date,
Dept varchar(20),
city varchar(25),
salary float
);

insert into employees(`Emp_id`,`Emp_name`,`Age`,`gender`,`Doj`,`Dept`,`city`,`salary`) 
  values(1,'test',39,'M','12-5-09','sales','chicago',40000),
		(2,'rohit',20,'M','17-5-23','Marketing','usa',950000),
		(3,'sheenu',22,'F','16-05-23','Product','Boston',650000),
		(4,'toni',24,'F','14-06-20','Tech','Austin',450000),
		(5,'upen',30,'M','18-03-10','Sales','africa',550000),
		(6,'raju',29,'M','27-5-23','Data analyst','uk',1950000),
		(7,'keshavv',32, 'F','26-05-23','operators','china',680000),
		(8,'aoohi',44,'F','24-06-20','salesperson','indonessia',850000),
		(9,'sheetal',40,'F','17-03-10','manager','nepal',750000);
        
        select * from employees;
        select emp_name,dept,salary from employees where salary <(select avg(salary) from employees); 
        select emp_name, dept, salary from employees where salary < (select avg(salary) from employees);
        
       # update subquery #
        create table products(
        prod_id int, 
        item varchar(255),
        sell_price float,
        product_type varchar(30)
        );

select * from products;
insert into products(`prod_id`,`item`,`sell_price`,`product_type`) 
  values(101,'jewellery',1800,'Luxuary'),
		(102,'Tshirt',100,'non-luxuary'),
		(103,'Laptop',1300,'Luxuary'),
		(104,'table',400,'non-luxuary');
        select * from products;
        
        create table orders(
        order_id int,
        product_sold varchar(30),
        selling_price float
        );
       
    insert into orders select prod_id, item, sell_price from products where prod_id in 
    (select prod_id from products where sell_price>1000);
    
    
    insert into orders select prod_id, item, sell_price from products where prod_id in
    (select prod_id from products where sell_price>1000);
    
    select * from orders;
    
    -- update subquery --
    
    CREATE TABLE employee_b LIKE employees;
    INSERT INTO employee_b SELECT * FROM employee;
    select * from employees	;
    show tables;
    update employees
    set salary = salary * 0.35
    where age in (select age from employee_b where age>=27);

    select * from employees;	
    select * from employee_b;
    
	-- Delete subquery -- 
    delete from employees 
    where age in (select age from employee_b where age <=32);
    create database triggers; 
    use triggers;
    show tables;
    create table customers(
    cust_id int,
    age int,
    name varchar(30)
    );
    
    delimiter  //
    create trigger age_verify
    before insert on customers
    for each row 
    if new.age < 0 then 	set new.age = 0;
    end if; //
    
    delimiter //
    
    create trigger age_check
    before insert on customers
    for each row
    if new.age < 0 then set new.age=0;
    end if;
    delimiter //
    insert into  customers 
    values(101,27, "james"),
    (102,-40, "Ammy"),
    (103,32, "Ben"),
    (104,-39, "Anjala");
    
    select * from customers;
    truncate table customers;
  --  after insert trigger --   
create table customer1(
id int auto_increment primary key,
name varchar(40) not null,
email varchar(30),
birthdata date );

create table message(
id int auto_increment,
messageid int,
message varchar(300) not null, primary key (id, messageid));

alter table customers1 modify birthdata  birthdate date;
ALTER TABLE customers1
CHANGE birthdata birthdate date;
ALTER TABLE student CHANGE COLUMN address  email varchar(20);

Delimiter //
create trigger check_null_dob
after insert 
on customer1 
for each row
begin 
if new.birthdata is null then 
insert into message(messageid,message)
value(new.id, concat('hi', new.name, ',Please update your date of birth.'));
End if;
 end //
 delimiter //
 
 
 
 show tables;
 
 select * from customer1;
 insert into customer1 (`name`,`email`,`birthdata`)
 values('nancy','nancy@abc.com',null),
 ('ronald','ronal@xyz.com','1998-11-16'),
 ('krish','krish@xyz.com','1997-08-21'),
 ('Alice','alice@abc.com',NULL);
 
 select * from message;
 
 befor update -- 

create table employees(
emp_id int primary key,
emp_name varchar(25),
age int,
salary float);

show tables;
drop table employees;
insert into employees 
values(101,"jimmy",35,70000),
(102,"shane",30,55000),
(103,"Marry",28,62000),
(104,"Dwayne",37,57000),
(105,"sara",32,72000),
(106,"Ammy",35,80000),
(107,"jack",40,100000);
select * from employees;


delimiter //
create trigger upd_trigger
before update
on employees
for each row 
begin 
if new.salary=10000 then
set new.salary=85000;
elseif new.salary < 10000 then 
set new.salary = 72000;
end if;
end //
delimiter ; 

update employees set salary = 8000;
show databases;
use mysql;
use world;
show tables;
use subquery;
A subquery is a select query that is enclosed inside  another query the inner select query is usually used to determine the result of the outer select select query 
A subquery is a select query that enclosed inside a another query the inner select  query usually used to  determine the result of outer query 
show tables;
select * from employees;
select emp_name,dept, salary from employees where salary < (select avg(salary) from employees);
select emp_name,dept,salary from employees where salary < (select avg(salary) from employees);
# update subquery #-- 
create table products(
product_id int ,
itme varchar(30),
sell_price float,
product_type varchar(30)

); 
 
 insert into products 
 values(101,'Jewellery',1800,'luxuary'),
 (102,'T-shairt',100,'Non-Luxuary'),
 (103,'Laptop',700,'Non-Luxuary'),
 (104,'Table',1300,'Non-Luxuary'),
 (105,'Mobile',400,'Non-Luxuary');
 select * from orders;
 create table orders(
 order_id int,
 product_sold varchar(30),
 selling_price float);
 create table products(
product_id int ,
itme varchar(30),
sell_price float,
product_type varchar(30)

); 
 insert into orders select prod_id, item, sell_price from products  where prod_id in (select prod_id from products where sell_price>1000);
 
--  update subquery --
select * from employees;
create table employees_b LIKE employees;
INSERT INTO employees_b SELECT * FROM employees;
truncate table employees_b;
update employees set salary = salary * 0.35 where Age in (select Age from employees_b where Age>=27); 
select * from employees; 

 
SET SQL_SAFE_UPDATES = 0;
-- Triggers -- 
create Database triggers;
show Databases;
use triggers;
#before insert triggers #
create table customers(cust_id int, age int ,name varchar(30) );
select * from customers;

delimiter //
create trigger age_verify 
before insert on customers
for each row
if new.age < 0 then set new.age = 0;
end if; //

insert into customers
values(101,27,"james"),
(102,-40,"Ammy"),
(103,32,"Ben"),
(104,-39,"Anjela");
Drop table customers1;
create table customers1(id int auto_increment primary key, name varchar(40) not null, email varchar(30), birthdate date);
create table message (
id int auto_increment,
messageId int,
message varchar(300) not null,
primary key (id,messageId));
select * from customers1;
show tables;

Delimiter //
create trigger 
check_null_dob
after insert 
on customers1 
for each row 
begin 
if new.birthdate is null then 
insert into message (messageId, message) 
values (new.id, concat('hii', new.name ,'plz update your date of birth'));
end if;
end // 
# delimiter ;
truncate table customers1;
insert into customers1(name, email, birthdate)
values("nancy","nancy@abc.com", null),
("Ronald","ronald@xyz.com","1998-11-16"), 
("chris","chris@xyz.com","1997-08-20"),    
("alish","alish@abc.com",null);      
select * from message;
#before update 
create table employees (emp_id int primary key, emp_name varchar(25), age int, salary float);
insert into employees
values (101,"jimmy",35,70000),
(102,"shane",30,550000),
(103,"Marry",28,62000),
(104,"Dwayne",37,57000),
(105,"sara",32,72000),
(106,"Ammy",35,80000),
(107,"jack",40,10000);

delimiter //
create trigger upd_trigger 
before update 
on employees
for each row
begin 
if new.salary = 10000 then set new.salary = 85000;
elseif new.salary < 10000 then 
set new.salary = 72000;
end if;
end //
delimiter ;
SET SQL_SAFE_UPDATES = 0;
update employees set salary = 8000;

select * from employees;
# before delete

create table salary (eid int primary key,
validfrom date not null,
amount float not null   
);
insert into salary(eid,validfrom,amount)
values(101,'2005-05-01',55000),
(102,'2007-08-01',68000),
(103,'2006-09-01',75000);
select * from salary;
create table salarydel(id int primary key auto_increment, eid int, validfrom date not null, amount float not null, deletedate timestamp default now());

drop table salary;
delimiter $$
create trigger salary_delete 
before delete 
on salary
for each row 
begin
insert into salarydel(eid, validfrom,amount)
values(old.eid, old.validfrom,old.amount);
end$$
delimiter ;
select * from salary;
delete from salary where eid = 103;
select * from salarydel;
use sql_intro;
show tables;
select * from employee;
show databases;
use classicmodels;




























