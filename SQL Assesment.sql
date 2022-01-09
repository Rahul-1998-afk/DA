CREATE SCHEMA EMPLOYEE;


USE EMPLOYEE;


CREATE TABLE Employees(
		employee_id int,
        employee_name VARCHAR(30),
        department VARCHAR(20),
        salary DOUBLE,
        PRIMARY KEY(employee_id)
        );
        


SELECT * FROM Employees;



INSERT INTO Employees (employee_id, employee_name, department, salary)
	   VALUES(1001, "Vignesh", "Movies", 45200),
			 (1002, "Afnan", "Movies", 43000),
			 (1003, "Sumit", "Police", 27000),
		     (1004, "Imran", "Doctor", 52000),
             (1005, "Ritesh", "Agriculture", 30000),
             (1006, "Krishna", "Police", 26000),
             (1007, "Nadeem", "Movies", 45200),
             (1008, "Aryan", "Doctor", 52000),
             (1009, "Kasif", "Agriculture", 33000),
             (1010, "Manasi", "Police", 29500),
             (1011, "Sankar", "Doctor", 52000),
             (1012, "Manoj", "Agriculture", 29000),
             (1013, "Bharat", "Movies", 41000),
             (1014, "Suraj", "Police", 24000),
             (1015, "Prakash", "Police", 25000),
             (1016, "Salman", "Doctor", 49000),
             (1017, "Rakesh", "Agriculture", 26000),
             (1018, "Adil", "Movies", 34000),
             (1019, "Akash", "Agriculture", 27500),
             (1020, "Aman", "Police", 28000),
             (1021, "Amrit", "Doctor", 52000),
             (1022, "Zainul", "Movies", 23000),
             (1023, "Amit", "Doctor", 43000),
             (1024, "Subrat", "Police", 22000),
             (1025, "Sushmita", "Agriculture", 26000),
             (1026, "Harry", "Agriculture", 29000),
             (1027, "Malak", "Movies", 33000),
             (1028, "Arif", "Police", 20000),
             (1029, "Prashant", "Doctor", 50000),
             (1030, "Arnab", "Agriculture", 25000),
             (1031, "Sajal", "Movies", 43000),
             (1032, "Amartya", "Movies", 39000),
             (1033, "Pradeep", "Police", 26000);
             
 /* Question 1 
 .... Print the 3rd highest salary ....*/         

SELECT * FROM(SELECT *,DENSE_RANK() OVER(ORDER BY salary DESC) as rnk
 FROM Employees) as a
 WHERE a.rnk = 3;


/* Question 2
.... Print the 2nd highest and 4th highest Salary each department wise .... */


SELECT * FROM(SELECT *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rnk
FROM Employees) as a
WHERE a.rnk IN (2,4);










		