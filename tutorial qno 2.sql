
--Q.No 2(a)
SELECT employee_name FROM tbl_Works
WHERE company_name = 'First Bank Corporation';

--Q.No 2(b)
SELECT employee_name,city FROM tbl_Employee 
WHERE employee_name IN 
(SELECT employee_name FROM tbl_Works 
WHERE company_name = 'First Bank Corporation');

--Q.No 2(c)
SELECT *FROM tbl_Employee
WHERE employee_name IN
(SELECT employee_name FROM tbl_Works
WHERE company_name = 'Small Bank Corporation' AND salary>10000);

--Q.No 2(d)
SELECT tbl_Employee.employee_name, tbl_Works.company_name, tbl_Company.city
FROM tbl_Employee,tbl_Company,tbl_Works
WHERE tbl_Company.company_name=tbl_Works.company_name AND 
tbl_Employee.employee_name=tbl_works.employee_name AND 
tbl_company.city = tbl_Employee.city; 

--Q.No 2(f)
SELECT employee_name FROM tbl_Works
WHERE company_name != 'First Bank Corporation';

--Q.No 2(g)
SELECT employee_name FROM tbl_Works
WHERE salary > (SELECT MAX(SALARY) FROM tbl_Works
WHERE company_name = 'Small Bank Corporation');

--Q.No 2(i)
SELECT employee_name FROM tbl_Works
WHERE salary > Any (select AVG(salary) FROM tbl_Works group by (company_name))

--Q.No 2(j)
SELECT company_name FROM tbl_Works GROUP BY (company_name)
HAVING COUNT(employee_name) >= ALL
(SELECT COUNT(employee_name) FROM tbl_Works GROUP BY(company_name))
