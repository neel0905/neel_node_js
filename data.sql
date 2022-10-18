--  create table client_master(
--  Clientno varchar(50) primary key,
--  Name varchar(50),
--  city varchar(50),
--  pincode numeric(38),
--  state varchar(50),
--  baldue numeric(38)
--  );
--  insert into client_master values('C00001', 'Ivan', 'Bombay', 400054, 'Maharashtra', 15000);
--  insert into client_master values('C00002', 'Vandana', 'Madras', 780001, 'Tamilnadu', 0);
--  insert into client_master values('C00003', 'Pramada', 'Bombay', 400057, 'Maharashtra', 5000);
--  insert into client_master values('C00004', 'Basu', 'Bombay', 400056, 'Maharashtra', 0);
--  insert into client_master values('C00005', 'Ravi', 'Delhi', 100001, '', 2000);
--  insert into client_master values('C00006', 'Rukmini', 'Bombay', 400050, 'Maharashtra', 0);

-- ===============================================================================================================================================
 
-- create table product_master(
--  productno varchar(50) primary key,
-- description varchar(50), 
-- profitpercent numeric(38,2),
-- unitmeasured varchar(50),
-- qtyonhand numeric(38),
-- recorderlvl numeric(38),
-- sellprice numeric(38),
-- costprice numeric(38)
-- );


-- insert into product_master values ('P00001','1.44floppies',5, 'piece', 100, 20, 525,500);
-- insert into product_master values ('P03453', 'Monitors', 6, 'piece', 10, 3, 12000, 11200);
-- insert into product_master values ('P06734', 'Mouse',5, 'piece', 20, 5, 1050, 500);
-- insert into product_master values ('P07865', '1.22 floppies',5, 'piece', 100, 20, 525, 500);
-- insert into product_master values ('P07868', 'Keyboards', 2, 'piece', 10, 3, 3150, 3050);
-- insert into product_master values ('P07885', 'CD Drive',2.50, 'piece',10,3,5250,5100);
-- insert into product_master values ('P07965', '540 HDD',4, 'piece',10,3,8400, 8000);
-- insert into product_master values ('P07975', '1.44 Drive',5, 'piece', 10, 3, 1050, 1000);
-- insert into product_master values ('P08865', '1.22 Drive',5, 'piece',2,3, 1050, 1000);

-- =============================================================================================================================================

-- create table salesman_master( 
--     salesman_no varchar(50) primary key,
--  salesmanname varchar(50),
--   address1 varchar(50),
--   address2 varchar(50), 
--   city varchar(50),
--    pincode numeric(38),
--     state varchar(50), 
--     salamt numeric(38),
--      tgttoget numeric(38),
--       ytdsale numeric(38),
--       remark varchar(38)
--        );

-- insert into salesman_master values ('S00001', 'Kiran', 'A/14 worli',"a/15 east ", 'Bombay', 400002, 'Mah', 3000, 100, 50, 'Good');
--  insert into salesman_master values ('S00002', 'Manish', '65, nariman',"20 dahisar", 'Bombay',400001, 'Mah', 3000, 200, 100, 'Good');
--   insert into salesman_master values ('S00003', 'Ravi', 'P-7 Bandra',"k-8 borivali", 'Bombay', 400032, 'Mah', 3000, 200, 100, 'Good'); 
--   insert into salesman_master values ('S00004', 'Ashish', 'A/5 Juhu',"9,filmcity", 'Bombay', 400044, 'Mah', 3500, 200, 150, 'Good');

-- =============================================================================================================================================

-- create table sales_order(
-- order_no varchar(10),
-- Client_no varchar(10),
-- order_date date,
-- delyaddr varchar(25),
-- salesman_no varchar(20),
-- delytype char(20),
-- billyn char(20),
-- DELYDATE DATE,
-- orderstatus varchar(20),
-- constraint pk_sales_order primary key(order_no),
-- constraint FK_Category FOREIGN KEY (Client_no) REFERENCES client_master(Clientno),
-- constraint FK1_Category FOREIGN KEY (salesman_no) REFERENCES salesman_master(salesman_no)

-- );

-- insert into sales_order values('O19001','C00001','2004-06-12','chikuwadi','S00001','F','N','2002-07-20','in process');
-- insert into sales_order values('O19002','C00002','2004-06-25','varachha','S00002','P','N','2002-06-27','cancelled');
-- insert into sales_order values('O46865','C00003','2004-02-18','punagam','S00003','F','Y','2002-02-20','fullfilled');
-- insert into sales_order values('O19003','C00001','2004-04-03','yogichowk','S00001','F','Y','2002-04-07','fullfilled');
-- insert into sales_order values('O46866','C00004','2004-05-20','mahavir','S00002','P','N','2002-05-22','cancelled');
-- insert into sales_order values('O19008','C00005','2004-05-24','jakatnaka','S00004','F','N','2002-07-26','in process');

-- ================================================================================================================================

create table sales_order_details(
    order_no varchar(10),
    productno varchar(6),
    qtyordered numeric,
    qtydisp numeric,
    productrate numeric,
    constraint pk_sales_order_details FOREIGN key (order_no) REFERENCES sales_order(order_no),
    constraint pk1_sales_order_details FOREIGN key (productno) REFERENCES product_master(productno)
);

insert into sales_order_details values('O19001', 'P00001', 4, 4, 525);
insert into sales_order_details values('O19001', 'P07965', 2, 1, 8400);
insert into sales_order_details values('O19001', 'P07885', 2, 1, 5250);
insert into sales_order_details values('O19002', 'P00001', 10, 0, 525);
insert into sales_order_details values('O46865', 'P07868', 3, 3, 3150);
insert into sales_order_details values('O46865', 'P07885', 3, 1, 5250);
insert into sales_order_details values('O46865', 'P00001', 10, 10, 525);
insert into sales_order_details values('O46865', 'P0345', 4, 4, 1050);
insert into sales_order_details values('O19003', 'P03453', 2, 2, 1050);
insert into sales_order_details values('O19003', 'P06734', 1, 1, 12000);
insert into sales_order_details values('O46866', 'P07965', 1, 0, 8400);
insert into sales_order_details values('O46866', 'P07975', 1, 0, 1050);
insert into sales_order_details values('O19008', 'P00001', 10, 5, 525);
insert into sales_order_details values('O19008', 'P07975', 5, 3, 1050);


select * from client_master limit 2;

select * from client_master limit 5;

select distinct city,state from client_master;

select distinct city from client_master;

select city from client_master;

select * from client_master where name like 'ravi';

select * from client_master where name like 'i';

select * from client_master where name like '__';

select * from client_master where name like '__';

select * from client_master where name like '___';

select * from client_master where name like 'a_';

select * from client_master where name like 'r';

select * from client_master where name like '%r%';

select * from client_master where name like '%a%';

select * from client_master where name like '%d%';

select * from client_master where name like '%n_';

select * from client_master where name like '_a%';

select * from client_master where name like '%A';

select * from client_master where name like 'R%';

select * from client_master where name like 'A%';

select * from product_master where qtyonhand not in(10,2);

select * from salesman_master order by salesmanname,salesman_no;

select * from salesman_master order by salesmanname desc;

select * from product_master order by description;



select * from client_master where name like'_a%';
select  name from client_master where city like'm%';
select * from client_master where state in('bangalore','mangalore');
select * from client_master where baldue>1000;
select * from sales_order where orderdate like'%6%';
select * from sales_order where client_no in('C00001','C00002');
select * from product_master where sellprice>500 and sellprice<=750;
alter table product_master add column new_price int;
update product_master set new_price=(sellprice*0.15)+sellprice where sellprice>500;
select name,city,state  from client_master where state<>'maharashtra';
select count(order_no) from sales_order;
select avg(sellprice) from product_master;
select min(sellprice) as minmum,max(sellprice) as maximum from product_master;
select count(sellprice)  from product_master where sellprice<500;
select description from product_master where qtyonhand<recorderlvl