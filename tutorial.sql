CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR (15),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

DESCRIBE employee;

INSERT INTO employee
VALUES (100, 'David', 'Wallace', 19671117, 'M', 250000, NULL, 1);
INSERT INTO employee
VALUES (101, 'Jan', 'Levinson', 19610511, 'F', 110000, 100, 1);
INSERT INTO employee
VALUES (102, 'Michael', 'Scott', 19640315, 'M', 75000, 100, 2);
INSERT INTO employee
VALUES (103, 'Angela', 'Martin', 19710625, 'F', 63000, 102, 2);
INSERT INTO employee
VALUES (104, 'Kelly', 'Kapoor', 19800205, 'F', 55000, 102, 2);
INSERT INTO employee
VALUES (105, 'Stanley', 'Hudson', 19580219, 'M', 69000, 102, 2);
INSERT INTO employee
VALUES (106, 'Josh', 'Porter', 19690905, 'M', 78000, 100, 3);
INSERT INTO employee
VALUES (107,'Andy','Bernard',19730722,'M',65000,101,3);
INSERT INTO employee
VALUES (108, 'Jim', 'Halpert', 19781001, 'M', 71000, 106, 3);

SELECT * FROM employee;

CREATE TABLE branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(15),
    mgr_id INT,
    mgr_start_date DATE
);

INSERT INTO branch
VALUES(1, 'Corporate', 100, 20060209);
INSERT INTO branch
VALUES(2, 'Scranton', 102, 19920406);
INSERT INTO branch
VALUES (3, 'Stamford', 106, 19980213);

SELECT * FROM branch;

CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(30),
    branch_id INT
);

INSERT INTO client
VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client
VALUES(401, 'Lackawana Country', 2);
INSERT INTO client
VALUES(402, 'FedEx', 3);
INSERT INTO client
VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client
VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client
VALUES(405, 'Times Newspaper', 3);
INSERT INTO client
VALUES(406, 'FedEx', 2);

SELECT * FROM client;


ALTER TABLE branch ADD FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL;
DESCRIBE branch;

ALTER TABLE employee
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

ALTER TABLE client
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(30),
    supply_type VARCHAR(30),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

INSERT INTO works_with
VALUES(105, 400, 55000);
INSERT INTO works_with
VALUES(102, 401, 267000);
INSERT INTO works_with
VALUES(108,402,22500);
INSERT INTO works_with
VALUES(107,403,5000);
INSERT INTO works_with
VALUES(108,403,12000);
INSERT INTO works_with
VALUES(105,404,33000);
INSERT INTO works_with
VALUES(107,405,26000);
INSERT INTO works_with
VALUES(102,406,15000);
INSERT INTO works_with
VALUES(105,406,130000);

INSERT INTO branch_supplier
VALUES(2,'Hammer Mill', 'Paper');
INSERT INTO branch_supplier
VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier
VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier
VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier
VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier
VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier
VALUES(3, 'Stamford Labels', 'Custom Forms');

SELECT * FROM employee;

SELECT * FROM client;

SELECT * FROM employee
ORDER BY salary DESC;

SELECT * FROM employee
ORDER BY sex, last_name, first_name;

SELECT * FROM employee LIMIT 5;

SELECT first_name AS forename, last_name AS surname FROM employee;

SELECT DISTINCT branch_id FROM employee;

SELECT COUNT(emp_id) FROM employee
WHERE sex='F' AND birth_date > '1971-01-01';

SELECT AVG(salary) FROM employee WHERE sex='M';

SELECT SUM(salary) FROM employee;