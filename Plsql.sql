-------------------------------------------------------
-- 5) PL/SQL PROCEDURES & FUNCTION
-------------------------------------------------------
-- Add Task
CREATE OR REPLACE PROCEDURE add_task (
  p_user_id IN NUMBER,
  p_title IN VARCHAR2,
  p_desc IN VARCHAR2,
  p_category_id IN NUMBER,
  p_due_date IN DATE,
  p_status IN VARCHAR2 DEFAULT 'pending'
) AS
BEGIN
  INSERT INTO tasks (task_id, user_id, title, description, category_id, due_date, status)
  VALUES (tasks_seq.NEXTVAL, p_user_id, p_title, p_desc, p_category_id, p_due_date, p_status);
  COMMIT;
END;
/

-- Add Expense
CREATE OR REPLACE PROCEDURE add_expense (
  p_user_id IN NUMBER,
  p_category_id IN NUMBER,
  p_task_id IN NUMBER,
  p_amount IN NUMBER,
  p_desc IN VARCHAR2,
  p_exp_date IN DATE
) AS
BEGIN
  INSERT INTO expenses (expense_id, user_id, category_id, task_id, amount, description, expense_date)
  VALUES (expenses_seq.NEXTVAL, p_user_id, p_category_id, p_task_id, p_amount, p_desc, p_exp_date);
  COMMIT;
END;
/

-- Update Task Status
CREATE OR REPLACE PROCEDURE set_task_status (
  p_task_id IN NUMBER,
  p_status IN VARCHAR2
) AS
BEGIN
  UPDATE tasks
     SET status = p_status
   WHERE task_id = p_task_id;
  COMMIT;
END;
/

-- Upsert Budget
CREATE OR REPLACE PROCEDURE set_budget (
  p_user_id IN NUMBER,
  p_month IN VARCHAR2,
  p_amount IN NUMBER
) AS
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM budgets
  WHERE user_id = p_user_id AND UPPER(TRIM(month)) = UPPER(TRIM(p_month));

  IF v_exists = 0 THEN
    INSERT INTO budgets (budget_id, user_id, month, amount)
    VALUES (budgets_seq.NEXTVAL, p_user_id, p_month, p_amount);
  ELSE
    UPDATE budgets
       SET amount = p_amount
     WHERE user_id = p_user_id AND UPPER(TRIM(month)) = UPPER(TRIM(p_month));
  END IF;
  COMMIT;
END;
/

-- Remaining Budget Function
CREATE OR REPLACE FUNCTION get_remaining_budget (
  p_user_id IN NUMBER,
  p_month IN VARCHAR2
) RETURN NUMBER IS
  v_budget NUMBER := 0;
  v_spent NUMBER := 0;
  v_month_start DATE;
BEGIN
  v_month_start := TRUNC(TO_DATE(p_month, 'Month YYYY', 'NLS_DATE_LANGUAGE=English'), 'MM');

  SELECT NVL(SUM(b.amount),0) INTO v_budget
  FROM budgets b
  WHERE b.user_id = p_user_id AND TRUNC(TO_DATE(b.month,'Month YYYY','NLS_DATE_LANGUAGE=English'),'MM') = v_month_start;

  SELECT NVL(SUM(e.amount),0) INTO v_spent
  FROM expenses e
  WHERE e.user_id = p_user_id AND TRUNC(e.expense_date,'MM') = v_month_start;

  RETURN v_budget - v_spent;
END;
/


