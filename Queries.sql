-------------------------------------------------------
-- 4) QUERIES
-------------------------------------------------------
-- List all tasks with user and category
SELECT t.task_id, t.title, t.status, u.username, c.category_name
FROM tasks t
JOIN users u ON t.user_id = u.user_id
JOIN categories c ON t.category_id = c.category_id
ORDER BY t.task_id;

-- List all expenses with user and category
SELECT e.expense_id, u.username, c.category_name, e.amount, e.expense_date, e.description
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN categories c ON e.category_id = c.category_id
ORDER BY e.expense_id;

-- Total expense per user
SELECT u.username, NVL(SUM(e.amount),0) AS total_expense
FROM users u
LEFT JOIN expenses e ON u.user_id = e.user_id
GROUP BY u.username;

-- Total expenses per category
SELECT c.category_name, NVL(SUM(e.amount),0) AS total_expense
FROM categories c
LEFT JOIN expenses e ON c.category_id = e.category_id
GROUP BY c.category_name;

-- Remaining budget per user for a given month
SELECT u.username, b.month, b.amount AS budget_amount, NVL(SUM(e.amount),0) AS spent,
       b.amount - NVL(SUM(e.amount),0) AS remaining_budget
FROM budgets b
JOIN users u ON b.user_id = u.user_id
LEFT JOIN expenses e ON e.user_id = u.user_id AND TO_CHAR(e.expense_date,'Month YYYY','NLS_DATE_LANGUAGE=English') = b.month
GROUP BY u.username, b.month, b.amount;