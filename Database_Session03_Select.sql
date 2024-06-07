create database Select_DB;
use select_db;
create table ClassStudent(
	class_id int primary key auto_increment,
    class_name varchar(100) not null unique,
    class_status bit
);
create table Student(
	student_id char(5) primary key,
    student_name varchar(100) not null,
    age int,
    address text,
    class_id int,
    foreign key(class_id) references ClassStudent(class_id),
    student_status bit
);
insert into ClassStudent(class_name,class_status)
values('JV240403',1),('JV240219',1),('JV240408',1),('JS240610',0);
insert into ClassStudent(class_name,class_status)
values('JS230913',1);
select * from classStudent;
insert into Student
values('SV001','Nguyễn Văn A',18,'Hà Nội',1,1),
('SV002','Nguyễn Văn B',20,'Đà Nẵng',1,1),
('SV003','Nguyễn Văn C',20,'Hà Nội',2,1),
('SV004','Nguyễn Văn D',20,'Hà Nội',3,1),
('SV005','Nguyễn Văn F',25,'HCM',1,1),
('SV006','Nguyễn Văn E',22,'Hà Nội',2,0),
('SV007','Nguyễn Văn G',23,'HCM',1,0),
('SV008','Nguyễn Văn H',21,'Hà Nội',3,1),
('SV009','Nguyễn Văn Bình',19,'Hà Nội',2,1),
('SV010','Nguyễn Văn An',20,'Hà Nội',2,1);

insert into Student
values('SV011','Nguyễn Văn Ánh',22,'Hà Nội',null,1),
('SV012','Nguyễn Văn Anh',20,'Đà Nẵng',null,1);

insert into Student
values('SV013','Trần Văn Cao',24,'Hà Nội',2,1),
('SV014','Lê Thanh Thùy',20,'Đà Nẵng',2,1);

select * from Student;

-- 1. Lấy tất thông tin sinh viên
select * from student;
-- 2. Lấy thông tin sinh viên gồm các thông tin: mã sinh viên, tên sinh viên và tuổi
select st.student_id, st.student_name, st.age
from student st;
-- 3. lấy tuổi nhỏ nhất, lớn nhât, tuổi trung bình, tổng tuổi của các sinh viên
select min(st.age) as 'Min',max(st.age) as 'Max',avg(st.age) as 'AVG',sum(st.age) as 'SUM'
from student st;
-- 4. Lấy thông tin sinh viên gồm mã sinh viên, tên sinh viên và tuổi + 10
select st.student_id,st.student_name, st.age+10
from student st;
-- 5. Lấy ra các mã lớp của các sinh viên
select distinct st.class_id
from student st;
-- 6. Lấy ra thông tin sinh viên gồm mã sinh viên, tên sinh viên, tên lớp
select * from student;
select st.student_id, st.student_name, c.class_name
from student st inner join classStudent c on st.class_id = c.class_id;
select st.student_id,st.student_name, c.class_name
from student st left join classStudent c on st.class_id = c.class_id;
select st.student_id,st.student_name, c.class_name
from student st right join classStudent c on st.class_id = c.class_id;
-- 6. Lấy thông tin sinh viên có tuổi từ 19 đến 22 gồm mã sinh viên, tên sinh viên, tuổi, địa chỉ
select st.student_id, st.student_name, st.age, st.address
from student st
-- where st.age >=19 and st.age<=22;
where st.age between 19 and 22;
-- 7. Lấy thông tin sinh viên có tuổi 19 hoặc 21 hoặc 25 gồm mã, tên, tuổi
select st.student_id, st.student_name, st.age
from student st
where st.age in (19,21,25);
-- 8. Lấy thông tin sinh viên có tên là Lê Thanh Thùy
select *
from student st
where st.student_name like 'Lê Thanh Thùy';
-- 9. Lấy thông tin sinh viên có tên bắt đầu là T
select *
from student st
where st.student_name like 'T%';
-- 10. Lấy thông tin sinh viên có ký tự thứ 2 là e
select *
from student st
where st.student_name like '_e%';
-- 11. Tính trung bình tuổi của các sinh viên trong cùng lớp
select st.class_id, avg(st.age)
from student st
group by st.class_id;
-- 12. Lấy lớp có tuổi trung bình lớn hơn 21
select st.class_id, avg(st.age)
from student st
group by st.class_id
having avg(st.age)>21;
-- 13. lấy thông tin sinh viên gồm mã, tên, tuổi và được sắp xếp theo tuổi giảm dần
select st.student_id, st.student_name, st.age
from student st
order by st.age DESC;
/*
	14. lấy thông tin sinh viên gồm mã, tên, tuổi và được sắp xếp theo tuổi giảm dần
    những sinh viên có tuổi bằng nhau thì sắp xếp theo tên tăng dần
*/
select st.student_id, st.student_name, st.age
from student st
order by st.age DESC, st.student_name;
-- 15. Lấy thông tin 5 sinh viên đầu tiên
select *
from student st
limit 5;
-- 16. Lấy thông tin 3 sinh viên từ sinh viên thứ 2
select *
from student st
limit 3 offset 2;
