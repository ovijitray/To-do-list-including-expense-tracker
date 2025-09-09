-------------------------------------------------------
-- 2) TABLES
-------------------------------------------------------
CREATE TABLE users (
    user_id     NUMBER PRIMARY KEY,
    username    VARCHAR2(50) NOT NULL,
    email       VARCHAR2(150) NOT NULL UNIQUE,
    password    VARCHAR2(100) NOT NULL
);

CREATE TABLE categories (
    category_id   NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL,
    category_type VARCHAR2(10) CHECK (category_type IN ('task','expense'))
);

CREATE TABLE tasks (
    task_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    title VARCHAR2(100) NOT NULL,
    description VARCHAR2(100),
    category_id NUMBER,
    status VARCHAR2(10) DEFAULT 'pending' CHECK (status IN ('pending','completed')),
    due_date DATE,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_tasks_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_tasks_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE expenses (
    expense_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    category_id NUMBER NOT NULL,
    task_id NUMBER,
    amount NUMBER(10,2) NOT NULL,
    description VARCHAR2(100),
    expense_date DATE,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_exp_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_exp_category FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CONSTRAINT fk_exp_task FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

CREATE TABLE budgets (
    budget_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    month VARCHAR2(30) NOT NULL,
    amount NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_budget_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);


