Several approaches resolve the `Subquery returned more than 1 row` issue. Here are a few, applied to the example above:

**1. Using `IN`:**

```sql
SELECT * FROM employees WHERE salary IN (SELECT salary FROM employees WHERE department = 'Sales');
```
This approach correctly selects all employees whose salary matches any salary in the 'Sales' department.

**2. Using `ANY` or `ALL`:**

* `ANY`: Selects rows where the condition is true for at least one row in the subquery.
* `ALL`: Selects rows where the condition is true for all rows in the subquery.

```sql
-- Example using ANY
SELECT * FROM employees WHERE salary >= ANY (SELECT salary FROM employees WHERE department = 'Sales');

--Example using ALL
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department = 'Sales');
```

**3. Modifying the Subquery:**

If you only need one specific salary, change the subquery to limit its results. For example, you could order by salary and select only the highest or lowest salary.  Example of selecting the maximum salary:

```sql
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE department = 'Sales');
```

Choosing the best solution depends on your specific requirements.  Using `IN` is often the most straightforward solution if you want to match any of multiple values returned by the subquery.  `ANY` and `ALL` provide flexible comparison options.  Modifying the subquery is necessary when only a single specific value is required.