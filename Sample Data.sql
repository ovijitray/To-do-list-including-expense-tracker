-------------------------------------------------------
-- 3) SAMPLE DATA
-------------------------------------------------------
-- Users
INSERT INTO users VALUES (1,'Alice','alice@example.com','pass123');
INSERT INTO users VALUES (2,'Bob','bob@example.com','pass123');
INSERT INTO users VALUES (3,'Charlie','charlie@example.com','pass123');
INSERT INTO users VALUES (4,'Diana','diana@example.com','pass123');
INSERT INTO users VALUES (5,'Eve','eve@example.com','pass123');

-- Categories
INSERT INTO categories VALUES (1,'Work','task');
INSERT INTO categories VALUES (2,'Personal','task');
INSERT INTO categories VALUES (3,'Food','expense');
INSERT INTO categories VALUES (4,'Transport','expense');
INSERT INTO categories VALUES (5,'Shopping','expense');

-- Tasks
INSERT INTO tasks VALUES (1,1,'Complete project','Finish SQL project',1,'pending',DATE '2025-09-10',SYSTIMESTAMP);
INSERT INTO tasks VALUES (2,2,'Buy groceries','Weekly shopping',2,'completed',DATE '2025-08-20',SYSTIMESTAMP);
INSERT INTO tasks VALUES (3,3,'Team meeting','Discuss milestone',1,'pending',DATE '2025-08-27',SYSTIMESTAMP);
INSERT INTO tasks VALUES (4,4,'Gym workout','Leg day session',2,'completed',DATE '2025-08-22',SYSTIMESTAMP);
INSERT INTO tasks VALUES (5,5,'Call client','Project discussion',1,'pending',DATE '2025-08-30',SYSTIMESTAMP);

-- Expenses
INSERT INTO expenses VALUES (1,1,3,NULL,250.00,'Lunch at cafe',DATE '2025-08-21',SYSTIMESTAMP);
INSERT INTO expenses VALUES (2,2,4,NULL,120.50,'Taxi fare',DATE '2025-08-19',SYSTIMESTAMP);
INSERT INTO expenses VALUES (3,3,5,NULL,500.00,'Concert ticket',DATE '2025-08-20',SYSTIMESTAMP);
INSERT INTO expenses VALUES (4,4,3,NULL,90.00,'Snacks',DATE '2025-08-18',SYSTIMESTAMP);
INSERT INTO expenses VALUES (5,5,4,NULL,300.00,'Bus pass',DATE '2025-08-15',SYSTIMESTAMP);

-- Budgets
INSERT INTO budgets VALUES (1,1,'August 2025',3000.00);
INSERT INTO budgets VALUES (2,2,'August 2025',2500.00);
INSERT INTO budgets VALUES (3,3,'August 2025',4000.00);
INSERT INTO budgets VALUES (4,4,'August 2025',3500.00);
INSERT INTO budgets VALUES (5,5,'August 2025',2000.00);


