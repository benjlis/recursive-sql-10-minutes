-- Available at https://github.com/benjlis/recursive-sql-10-minutes
-- Create a toy HR schema for learning purposes based on the classic Oracle example tables.
create table dept(
    deptno     integer     primary key,
    dname      varchar(14) not null,
    loc        varchar(13) not null
);

create table emp(
    empno    integer      primary key,
    ename    varchar(10)  not null,
    job      varchar(9)   not null,
    mgr      integer      references emp,
    hiredate date         not null,
    sal      numeric(7,2) not null,
    comm     numeric(7,2),
    deptno   integer      not null references dept
);
-- Populate the tables with some test data
insert into dept(deptno, dname, loc) values
    (10, 'ACCOUNTING', 'NEW YORK'), (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'), (40, 'OPERATIONS', 'BOSTON');
--
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7839, 'KING', 'PRESIDENT', null, '2011-11-17', 5000, null, 10);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7698, 'BLAKE', 'MANAGER', 7839, '2011-05-01', 2850, null, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7782, 'CLARK', 'MANAGER', 7839, '2011-09-06', 2450, null, 10);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7566, 'JONES', 'MANAGER', 7839, '2011-04-02', 2975, null, 20);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7788, 'SCOTT', 'ANALYST', 7566, '2017-07-13', 3000, null, 20);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7902, 'FORD', 'ANALYST', 7566, '2011-03-12', 3000, null, 20);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7369, 'SMITH', 'ASSOCIATE', 7902, '2010-12-17', 800, null, 20);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7499, 'ALLEN', 'SALESPERSON', 7698, '2011-02-20', 1600, 300, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7521, 'WARD', 'SALESPERSON', 7698, '2011-02-21', 1250, 500, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7654, 'MARTIN', 'SALESPERSON', 7698, '2011-09-28', 1250, 1400, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7844, 'TURNER', 'SALESPERSON', 7698, '2011-08-09',1500, 0, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7876, 'ADAMS', 'ASSOCIATE', 7788, '2017-07-13', 1100, null, 20);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7900, 'JAMES', 'ASSOCIATE', 7698, '2011-03-12', 950, null, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7934, 'MILLER', 'ASSOCIATE', 7782, '2012-01-23', 1300, null, 10);
-- View the data
select * from dept;

select * from emp natural join dept;
-- Employees and their manager
select e.ename, e.job, b.ename mgr, b.job mgr_job
    from emp e left join emp b on (e.mgr = b.empno);

-- Employees, their manager, and the manager's manager
select e.ename, e.job, b.ename mgr, bb.ename mgr_mgr
    from emp e left join emp b on (e.mgr = b.empno)
               left join emp bb on (b.mgr = bb.empno);

