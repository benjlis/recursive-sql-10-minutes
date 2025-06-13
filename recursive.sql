--
-- We *should* be able to write this type of hierarchy query in SQL.
--
-- BTW, this type of query is often referred to by other names:
--    * Transitive closure
--    * Bill of materials problem 
--    * Parts explosion problem
--
-- A robust solutions for hierarchical queries in SQL requires recursive SQL.
-- Not supported in the SQL standard was added in SQL:1999.
-- 
with recursive rl(empno, ename, job, mgr) as
(select empno, ename, job, mgr from emp where ename = 'ADAMS'
    union all
 select b.empno, b.ename, b.job, b.mgr from rl r join emp b on r.mgr = b.empno)
select * from rl;
-- 
--  Recursive CTE syntax and structure
--    requires keyword 
--    recursive CTE is always a union or union all of two queries
--    1st query (non-recursive select): 
--        * evaluated 1st 
--        * must be a non-recursive select that queries the hierarchy table
--    2nd query (recursive select): 
--        * evaluated 2nd - Nth times 
--        * join of the CTE to the hierarchy table
--
-- Recursive CTE Evaluation
--
--   
--   1. Execute non-recursive select
--   2. Add results to QR and WT
--   3. Repeat until WT is empty
--       a. Execute <recursive select> using WT data for <cte-name>
--       b. Add results to QR
--       c. Replace WT with results




