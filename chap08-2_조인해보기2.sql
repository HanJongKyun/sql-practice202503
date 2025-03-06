
-- 이너(내부) 조인
SELECT 
    e.first_name,
    e.department_id, 
    d.department_name
FROM employees e 
JOIN departments d -- JOIN 이라고만 써도 INNER JOIN
ON e.department_id = d.department_id
WHERE e.department_id = 50;

-- 아우터(외부) 조인
SELECT 
    e.first_name, 
    d.department_name
FROM employees e, departments d LEFT OUTER JOIN departments d
WHERE e.department_id = d.department_id(+);

-- 풀 아우터 조인(좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부 조인
SELECT 
    e.first_name, 
    d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+);

SELECT 
    e.first_name, 
    d.department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id(+);

-- 풀 아우터 조인(좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부조인
-- LEFT + RIGHT JOIN

SELECT 
    e.first_name, 
    d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;

SELECT 
    e.first_name, 
    d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;

SELECT
    *
FROM employees
CROOS JOIN departments;

SELECT * FROM employees, departments;

-- 여러 개 테이블 조인 -> 조인 조건에 사용할 키 값을 찾아
-- 연결해서 쓰면 됩니다.
SELECT
    *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;

-- SELF JOIN이란 동일 테이블 사이의 조인을 말합니다.
-- 동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올 때 사용합니다.

SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;

-- 각 매니저가 담당하는 사원의 명수.
-- 매니저 아이디, 매니저 이름, 사원수

SELECT
    m.employee_id AS manager_id,
    m.first_name AS manager_name,
    COUNT(e.employee_id) AS 사원수
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name;



