
-- 2.	Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select r.name, count(*)

from users as u

join roles as r on u.role_id = r.id

group by r.name;