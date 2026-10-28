create database bankingsystem;
use bankingsystem;
create table customers(
      customer_id int primary key,
      name varchar(100) not null,
      address varchar(255) not null,
      phone varchar(15) unique check(length(phone)=10),
      email varchar(100) unique not null,
      dob date not null);
desc customers;
create table branches(
      branch_id int primary key,
      branch_name varchar(100) not null,
      location varchar(255) not null);
desc branches;
create table accounts(
      account_id int primary key,
      customers_id int not null,
      foreign key(customers_id) references customers(customer_id),
      branch_id int not null,
      foreign key(branch_id) references branches(branch_id),
      account_type varchar(20) not null,
      balance decimal(12,2) not null,
      created_at datetime not null);
desc accounts;
create table transactions(
      transaction_id int primary key,
      account_id int,
      foreign key(account_id) references accounts(account_id),
      amount decimal(12,2) not null,
      type enum('credit','debit') not null,
      date datetime not null);
desc transactions;
create table loans(
      loan_id int primary key,
      customer_id int not null,
      foreign key(customer_id) references customers(customer_id),
      amount decimal(12,2) not null,
      loan_type varchar(50) not null,
      interest_rate decimal(5,2) not null,
      start_date date not null,
      end_date date not null);
desc loans;
create table employees(
      employee_id int primary key,
      branch_id int not null,
      foreign key(branch_id) references branches(branch_id),
      name varchar(50) not null,
      designation varchar(50) not null,
      salary decimal(10,2) not null);
desc employees;
-- customers table insertion

insert into customers values(1,'rani','parvathipuram','7671874705','rani@gmail.com','2001-09-21');
insert into customers values(2,'raju','vizag','9440727846','raju@gmail.com','2005-10-11');
insert into customers values(3,'lahari','vijayawada','9493245510','lahari@gmail.com','2000-11-15');
insert into customers values(4,'ravi','guntur','9440786981','ravi@gmail.com','2004-12-04');
insert into customers values(5,'gayathri','nellimarla','9789072436','gayathri@gmail.com','2001-06-23');
insert into customers values(6,'yamini','ongole','9789092436','yamini@gmail.com','2008-04-24');
insert into customers values(7,'sindhu','hyderabad','9779072436','sindhu@gmail.com','2005-08-16');
insert into customers values(8,'ramana','elwinpeta','9769072436','ramana@gmail.com','1999-06-12');
insert into customers values(9,'rahul','bobbili','9789072136','rahul@gmail.com','2010-05-27');
insert into customers values(10,'yaswanth','vizianagaram','9789872436','yaswanth@gmail.com','2004-03-13');
select * from customers;

-- branches table insertion
insert into branches values(1,'parvathipuram branch','parvathipuram');
insert into branches values(2,'vizag branch','vizag');
insert into branches values(3,'vijayawada branch','vijayawada');
insert into branches values(4,'guntur branch','guntur');
insert into branches values(5,'nellimarla branch','nellimarla');
insert into branches values(6,'ongole branch','ongole');
insert into branches values(7,'hyderabad branch','hyderabad');
insert into branches values(8,'elwinpeta branch','elwinpeta');
insert into branches values(9,'bobbili branch','bobbili');
insert into branches values(10,'vizianagaram branch','vizianagaram');
select * from branches;

-- accounts table insertion
insert into accounts values(1,1,1,'savings',25000.00,now());
insert into accounts values(2,2,2,'current',4000.00,'2026-08-24 10:30:00');
insert into accounts values(3,3,3,'savings',35000.00,now());
insert into accounts values(4,4,4,'current',55000.00,'2026-02-21 01:13:12');
insert into accounts values(5,5,5,'savings',15000.00,now());
insert into accounts values(6,6,6,'current',2000.00,'2025-06-17 11:30:32');
insert into accounts values(7,7,7,'savings',5000.00,'2024-05-11 08:23:02');
insert into accounts values(8,8,8,'savings',85000.00,now());
insert into accounts values(9,9,9,'current',45000.00,'2026-05-11 07:33:56');
insert into accounts values(10,10,10,'savings',2500.00,now());
select * from accounts;

-- transactions table insertion
insert into transactions values(1,1,3500.00,'credit','2025-05-11 07:33:56');
insert into transactions values(2,2,500.00,'debit',now());
insert into transactions values(3,3,26000.00,'credit','2024-12-11 05:13:46');
insert into transactions values(4,4,1500.00,'debit','2015-10-04 13:35:59');
insert into transactions values(5,5,6700.00,'credit','2026-07-08 07:23:56');
insert into transactions values(6,6,33000.00,'debit','2024-05-11 07:33:56');
insert into transactions values(7,7,45600.00,'credit','2015-05-11 07:33:56');
insert into transactions values(8,8,35070.00,'credit','2005-05-11 07:53:56');
insert into transactions values(9,9,5400.00,'debit','2006-04-11 23:23:56');
insert into transactions values(10,10,1500.00,'credit','2004-05-11 15:23:59');
select * from transactions;

-- loans table insertion
insert into loans values(1,1,200000.00,'home loan',10.50,'2026-09-21','2030-09-21');
insert into loans values(2,2,500000.00,'personal loan',8.50,'2026-08-11','2035-08-11');
insert into loans values(3,3,1000000.00,'education loan',5.50,'2016-10-27','2033-10-27');
insert into loans values(4,4,2000000.00,'car loan',6.50,'2026-05-11','2032-05-11');
insert into loans values(5,5,700000.00,'gold loan',4.50,'2026-04-21','2031-04-21');
insert into loans values(6,6,580000.00,'business loan',11.50,'2026-02-13','2030-02-13');
insert into loans values(7,7,260000.00,'vehicle loan',5.50,'2026-09-21','2033-09-21');
insert into loans values(8,8,450000.00,'medical loan',6.50,'2026-07-30','2035-07-30');
insert into loans values(9,9,900000.00,'home loan',9.50,'2026-07-21','2034-07-21');
insert into loans values(10,10,150000.00,'gold loan',7.50,'2026-05-23','2030-05-23');
select * from loans;

-- employees table insertion
insert into employees values(1,1,'parvathi','manager',60000.00);
insert into employees values(2,2,'rukhmini','cashier',35000.00);
insert into employees values(3,3,'yamini','clerk',30000.00);
insert into employees values(4,4,'revathi','accountant',42000.00);
insert into employees values(5,5,'hema','assistant manager',45000.00);
insert into employees values(6,6,'rani','loan officer',40000.00);
insert into employees values(7,7,'lakshmi','manager',62000.00);
insert into employees values(8,8,'haima','assistant manager',55000.00);
insert into employees values(9,9,'pavani','cashier',50000.00);
insert into employees values(10,10,'prasanna','manager',65000.00);
select * from employees;

-- 1. Display the name, phone number, and email of all customers. 
select name,phone,email from customers;

-- 2. Display all customers who are from Hyderabad.
 select * from customers where address='hyderabad';
 
-- 3. Display all accounts whose account_type is Savings. 
select * from accounts where account_type='savings';

-- 4. Display all accounts having a balance greater than ₹50,000.
select * from accounts where balance > 50000; 

-- 5. Display all transactions where the transaction type is credit. 
select * from transactions where type='credit';

-- 6. Display all employees whose salary is greater than ₹40,000.
select * from employees where salary > 40000; 

-- 7. Display all customers born after 1998-01-01. 
select * from customers where dob > '1998-01-01'; 

-- 8. Display all accounts in descending order of their balance. 
select * from accounts order by balance desc;

-- 9. Find the total number of customers in the bank. 
select count(customer_id) as total_customers from customers;

-- 10. Find the total balance of all accounts.
select sum(balance) as total_balance from accounts; 

-- 11. Find the average account balance.
select avg(balance) as average_balance from accounts;

-- 12. Find the highest and lowest account balance.
select max(balance) as highest_balance,min(balance) as least_balance from accounts; 

-- 13. Display the number of accounts for each account_type. 
select account_type,count(account_type) as number_of_accounts 
from accounts
group by account_type;

-- 14. Display each account type and its total balance, but show only account types whose total balance is greater than ₹80,000. 
select account_type,sum(balance) as total_balance 
from accounts
group by account_type
having sum(balance) > 80000;

-- 15. Display the customer name, account ID, account type, and balance using Customers and Accounts. 
select name,account_id,account_type,balance
from customers c
left join accounts a
on c.customer_id=a.customers_id;

-- 16. Display the customer name, transaction ID, transaction amount, and transaction type using Customers, Accounts, and Transactions. 
select name,transaction_id,amount,type
from customers c 
left join accounts a
on c.customer_id=a.customers_id
left join transactions t
on a.account_id=t.account_id;

-- 17. Display the customer name, loan type, loan amount, and interest rate using Customers and Loans. 
select name,loan_type,amount,interest_rate
from customers c
left join loans l
on c.customer_id=l.customer_id;

-- 18. Display the employee name, designation, branch name, and branch location using Employees and Branches. 
select name,designation,branch_name,location 
from employees e
left join branches b 
on e.branch_id=b.branch_id;

-- 19. Display the names of customers whose account balance is greater than the average balance of all accounts.
select name
from customers c
left join accounts a
on c.customer_id=a.customers_id
where a.balance > (
	 select avg(balance)
     from accounts
);
-- 20. Display the customer name and age of each customer based on their date of birth.
select name,timestampdiff(year, dob, curdate()) as age
from customers;

-- 21. Display the names of customers who have accounts and employees who work at branches in Vizag, in a single list without duplicate names.
select c.name
from customers c 
inner join accounts a
on c.customer_id=a.customers_id
union
select e.name 
from employees e
inner join branches b
on e.branch_id=b.branch_id
where b.location='vizag' ;

-- 22. Create a view that displays names from customers,branch name from branches and accounts  
-- with a balance greater than ₹50,000, and then retrieve the records from that view.
create view highest_balance_accounts as
select c.name,a.customers_id,a.account_id,a.account_type,a.balance,b.branch_name
from customers c
left join accounts a
on c.customer_id=a.customers_id
left join branches b
on a.branch_id=b.branch_id
where balance > 50000;
select * from highest_balance_accounts;

-- 23. Create a stored procedure to display customer details based on the customer ID.
delimiter //
create procedure get_customer(in cust_id int)
begin
    select name, address, phone, email
    from customers
    where customer_id = cust_id;
end //
delimiter ;
call get_customer(1);

-- 24. Temporarily deduct ₹1,000 from account ID 1, check the updated balance, and then undo the change.
start transaction;
update accounts
set balance = balance - 1000
where account_id = 1;
select account_id, balance
from accounts
where account_id = 1;
rollback;
select account_id, balance
from accounts
where account_id = 1;

-- 25. Create a trigger if an employee's salary is less than ₹10,000, set it to ₹10,000 automatically.
drop trigger before_employee_insert; 
delimiter //
create trigger before_branches_insert
before insert on branches
for each row
begin
    if new.branch_id < 1 then
        set new.branch_id = 11;
    end if;
end //
delimiter ;
insert into branches values(0,'kurupam branch','kurupam');
select * from branches;

