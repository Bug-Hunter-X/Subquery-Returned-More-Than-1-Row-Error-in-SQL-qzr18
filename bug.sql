In SQL, a common error is `Subquery returned more than 1 row`. This happens when a subquery designed to return a single value (e.g., in a WHERE or SELECT clause) actually returns multiple rows.  Consider this example:

```sql
SELECT * FROM employees WHERE salary = (SELECT salary FROM employees WHERE department = 'Sales');
```

If multiple employees in the 'Sales' department have the same salary, the subquery will return multiple rows, causing the error. 