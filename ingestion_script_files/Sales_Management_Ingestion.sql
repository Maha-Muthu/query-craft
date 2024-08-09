CREATE SCHEMA sales_management;

CREATE TABLE  sales_management.agents
   (	
    agent_code CHAR(6) PRIMARY KEY, 
	agent_name CHAR(40), 
	working_area CHAR(35), 
	commission DECIMAL(10,2), 
	phone_no CHAR(15)  
	);
	
INSERT INTO sales_management.agents VALUES 
('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763'),
('A003', 'Alex ', 'London', '0.13', '075-12458969'),
('A008', 'Alford', 'New York', '0.12', '044-25874365'),
('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874'),
('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644'),
('A012', 'Lucida', 'San Jose', '0.12', '044-52981425'),
('A005', 'Anderson', 'Brisban', '0.13', '045-21447739'),
('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674'),
('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964'),
('A006', 'McDen', 'London', '0.15', '078-22255588'),
('A004', 'Ivan', 'Torento', '0.15', '008-22544166'),
('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178');

CREATE TABLE sales_management.customer 
   (	
    code VARCHAR(6) PRIMARY KEY, 
	name VARCHAR(40) NOT NULL, 
	city CHAR(35), 
	working_area VARCHAR(35) NOT NULL, 
	country VARCHAR(20) NOT NULL, 
	grade INTEGER, 
	opening_amount DECIMAL(12,2) NOT NULL, 
	receive_amount DECIMAL(12,2) NOT NULL, 
	payment_amount DECIMAL(12,2) NOT NULL, 
	outstanding_amount DECIMAL(12,2) NOT NULL, 
	phone VARCHAR(17) NOT NULL, 
	agent_code CHAR(6) NOT NULL REFERENCES sales_management.agents
);

INSERT INTO sales_management.customer VALUES  ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003'),
('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008'),
('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008'),
('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011'),
('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006'),
('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003'),
('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008'),
('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005'),
('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005'),
('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010'),
('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002'),
('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010'),
('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002'),
('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005'),
('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006'),
('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004'),
('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009'),
('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007'),
('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012'),
('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004'),
('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004'),
('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002'),
('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001'),
('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007'),
('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');

CREATE TABLE sales_management.orders 
   (
    id DECIMAL(6,0) NOT NULL PRIMARY KEY, 
	amount DECIMAL(12,2) NOT NULL, 
	advance_amount DECIMAL(12,2) NOT NULL, 
	date DATE NOT NULL, 
	customer_code VARCHAR(6) NOT NULL REFERENCES sales_management.CUSTOMER, 
	agent_code CHAR(6) NOT NULL REFERENCES sales_management.agents, 
	description VARCHAR(60) NOT NULL
   );

INSERT INTO sales_management.orders VALUES  ('200100', '1000.00', '600.00', '08/01/2008', 'C00013', 'A003', 'SOD'),
('200110', '3000.00', '500.00', '04/15/2008', 'C00019', 'A010', 'SOD'),
('200107', '4500.00', '900.00', '08/30/2008', 'C00007', 'A010', 'SOD'),
('200112', '2000.00', '400.00', '05/30/2008', 'C00016', 'A007', 'SOD'), 
('200113', '4000.00', '600.00', '06/10/2008', 'C00022', 'A002', 'SOD'),
('200102', '2000.00', '300.00', '05/25/2008', 'C00012', 'A012', 'SOD'),
('200114', '3500.00', '2000.00', '08/15/2008', 'C00002', 'A008', 'SOD'),
('200122', '2500.00', '400.00', '09/16/2008', 'C00003', 'A004', 'SOD'),
('200118', '500.00', '100.00', '07/20/2008', 'C00023', 'A006', 'SOD'),
('200119', '4000.00', '700.00', '09/16/2008', 'C00007', 'A010', 'SOD'),
('200121', '1500.00', '600.00', '09/23/2008', 'C00008', 'A004', 'SOD'),
('200130', '2500.00', '400.00', '07/30/2008', 'C00025', 'A011', 'SOD'),
('200134', '4200.00', '1800.00', '09/25/2008', 'C00004', 'A005', 'SOD'),
('200108', '4000.00', '600.00', '02/15/2008', 'C00008', 'A004', 'SOD'),
('200103', '1500.00', '700.00', '05/15/2008', 'C00021', 'A005', 'SOD'),
('200105', '2500.00', '500.00', '07/18/2008', 'C00025', 'A011', 'SOD'),
('200109', '3500.00', '800.00', '07/30/2008', 'C00011', 'A010', 'SOD'),
('200101', '3000.00', '1000.00', '07/15/2008', 'C00001', 'A008', 'SOD'),
('200111', '1000.00', '300.00', '07/10/2008', 'C00020', 'A008', 'SOD'),
('200104', '1500.00', '500.00', '03/13/2008', 'C00006', 'A004', 'SOD'),
('200106', '2500.00', '700.00', '04/20/2008', 'C00005', 'A002', 'SOD'),
('200125', '2000.00', '600.00', '10/10/2008', 'C00018', 'A005', 'SOD'),
('200117', '800.00', '200.00', '10/20/2008', 'C00014', 'A001', 'SOD'),
('200123', '500.00', '100.00', '09/16/2008', 'C00022', 'A002', 'SOD'),
('200120', '500.00', '100.00', '07/20/2008', 'C00009', 'A002', 'SOD'),
('200116', '500.00', '100.00', '07/13/2008', 'C00010', 'A009', 'SOD'),
('200124', '500.00', '100.00', '06/20/2008', 'C00017', 'A007', 'SOD'), 
('200126', '500.00', '100.00', '06/24/2008', 'C00022', 'A002', 'SOD'),
('200129', '2500.00', '500.00', '07/20/2008', 'C00024', 'A006', 'SOD'),
('200127', '2500.00', '400.00', '07/20/2008', 'C00015', 'A003', 'SOD'),
('200128', '3500.00', '1500.00', '07/20/2008', 'C00009', 'A002', 'SOD'),
('200135', '2000.00', '800.00', '09/16/2008', 'C00007', 'A010', 'SOD'),
('200131', '900.00', '150.00', '08/26/2008', 'C00012', 'A012', 'SOD'),
('200133', '1200.00', '400.00', '06/29/2008', 'C00009', 'A002', 'SOD');

