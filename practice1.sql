create table bw(
std_id number Primary Key,
std_name varchar2(20),
fees_paid Number,
total_fees Number default 350000,
mock_test_given INT
);


select * from bw;

INSERT INTO bw values(01,'Suraj Jadhav', 160000,350000,4)
INSERT INTO bw values(02,'Sanket Prabhu', 120000,350000,3)
INSERT INTO bw values(03,'Gopal Varma', 100000,350000,4)
INSERT INTO bw values(04,'Pranita Jadhav', 160000,350000,5)

