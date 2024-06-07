-- Bài 2: Thiết kế CSDL
create database Ecommerce_DB;
use Ecommerce_DB;
create table customer(
	cID int primary key auto_increment,
    cName varchar(100) not null,
    cAge int check(cAge>0)
);
create table Product(
	pId char(5) primary key,
    pName varchar(100) not null unique,
    pPrice float check (pPrice>0)
);
create table Orders(
	oId int primary key auto_increment,
    cId int,
    foreign key(cId) references customer(cId),
    oDate date,
    oTotalPrice float
);
create table OrderDetail(
	oId int not null,
    foreign key(oId) references Orders(oId),
    pId char(5) not null,
    foreign key(pId) references Product(pId),
    primary key(oId,pId),
    odQTY int
);
-- 3. Thêm dữ liệu vào bảng customer
insert customer(cName,cAge)
values('Minh Quân',10),('Ngọc Oanh',20),('Hồng Hà',50);
select * from customer;
insert orders(cid,odate)
values(1,'2006-03-21'),(2,'2006-03-23'),(1,'2006-03-16');
select * from orders;
insert product
values('P01','Máy giặt',3),('P02','Tủ lạnh',5),
('P03','Điều hòa',7),('P04','Quạt',1),('P05','Bếp điện',2);
select * from product;
insert into orderdetail
values(1,'P01',3),(1,'P03',7),(1,'P04',2),(2,'P01',1),
(3,'P01',8),(2,'P05',4),(2,'P03',3);
select * from orderdetail;
-- Cập nhật hóa đơn chi tiết có oid là 1, pid là P01 có số lượng là 10
update OrderDetail
	set odQTY = 10
    where oid = 1 and pid='P01';
-- Xóa dữ liệu hóa đơn chi tiết có oId là 2 và pid là P05
delete from OrderDetail where oid = 2 and pId = 'P05';
-- Xóa dữ liệu bảng order có oid là 1
delete from orders where oid = 1; -- Không xóa được do có khóa ngoại đang tham chiếu tới oid=1




