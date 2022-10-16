create database kavya123
use kavya123 
---customer table---
create table customer(Id int primary key, FirstName nvarchar(40) not null , Lastname nvarchar(40), city nvarchar(40),country nvarchar(40), phone int);
insert into customer values(01,'Amrutha','kavya','Rajahmundry','India',9988774455);
 insert into customer values(02,'Haritha','ch','Hyderabad','America',9663322551);
 insert into customer values(03,'Nita','hello','Amalapuram','africa',8225544611);
 insert into customer values(04,'Navya','Th','Ravulapalem','Asia',8020401020);
 insert into customer values(05,'satya','Nanda','Bangolore','england',7554551211);
 
select * from customer;
--order table--
create table Ord
(
Id int primary key ,
orddate datetime not null,
ordnumber nvarchar(10),
customerid int  references customer(id),
TotalAmount decimal(12,2),
);
insert into ord values('11',2022/08/02,'11223344','04','330');
insert into ord values('12',2022/09/05,'22558844','03','11');
insert into ord values('17',2022/09/02,'45123344','02','13');
insert into ord values('14',2022/10/09,'88993344','01','380');
insert into ord values('16',2022/08/12,'11223445','05','560');
select *from ord
--product table--  
create Table product
(
Id int primary key ,
productname nvarchar(50),
unitprice decimal(12,2),
package nvarchar(30),
Isdiscontinued bit
);
insert into product values(1, 'shampoo','400.22','200p',1);
insert into product values(2,'hairoil','587.22','500p',2);
insert into product values(3, 'soap','15.66', '30g',4);
insert into product values(4,'bathpowder','11','44g',1);
---orderitem table---
create table Orderitem
(
Id int primary key,
Orderid int references Ord(id),
productId int references product(id),
Unitprice decimal(12,2),
Quantity int
);
insert into Orderitem values(1,11,1,13.88,20);
insert into Orderitem values(2,12,2,200,300);
insert into orderitem values(3,17,3,20,70);
insert into orderitem values(4,14,4,19,400);

 
select *from customer where country like 'A%';
select *from customer where country like 'I%';
select *from customer where country='germany';
select Firstname+Lastname from customer;
select id,firstName,Lastname,city,country,phone from customer where firstname like '_u%';
select *from orderitem where unitprice>10  and unitprice<20;
select *from ord inner join customer on ord.customerid=customer.id;
select *from ord inner join orderitem on ord.id=orderitem.orderid where unitprice>10 and unitprice<20;
select *from ord inner join orderitem on ord.id=orderitem.orderid order by orddate