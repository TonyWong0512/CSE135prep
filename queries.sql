-- Example query
SELECT  c_others.name,first_name,last_name
FROM    classes AS c_135, enrollment AS e_135,
        students, enrollment AS e_others, classes AS c_others
WHERE   c_135.number = 'CSE135' 
		AND c_135.id = e_135.class 
		AND e_135.student = students.id
        AND students.id = e_others.student   
        AND e_others.class = c_others.id AND NOT (c_others.number = 'CSE135');
        
-- Example Query with Joins
SELECT	c_others.name,first_name,last_name
FROM    classes AS c_135
		JOIN enrollment AS e_135 ON c_135.id = e_135.class
		JOIN students ON e_135.student=students.id
		JOIN enrollment AS e_others ON students.id = e_others.student
		JOIN classes AS c_others ON e_others.class = c_others.id 
WHERE   c_135.number = 'CSE135'
		AND NOT (c_others.number = 'CSE135');

-- Example Query with Subqueries
SELECT	c_others.name, students.first_name,students.last_name
FROM    enrollment AS e_others
		JOIN classes AS c_others ON e_others.class = c_others.id
		JOIN students ON e_others.student=students.id
WHERE   NOT (c_others.number = 'CSE135')
		AND students.id IN (
			SELECT	e_135.student
			FROM	classes AS c_135
					JOIN enrollment AS e_135 ON c_135.id = e_135.class
			WHERE c_135.number = 'CSE135'
		);


