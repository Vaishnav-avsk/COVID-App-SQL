USED ORACLE LIVE SQL: https://livesql.oracle.com/
Question: Select employees who have self-reported all the symptoms.

Inserting such employee:
INSERT INTO Symptom VALUES (109, 6027, '15-AUG-21', 1);
INSERT INTO Symptom VALUES (110, 6027, '15-AUG-21', 2);
INSERT INTO Symptom VALUES (111, 6027, '15-AUG-21', 3);
INSERT INTO Symptom VALUES (112, 6027, '15-AUG-21', 4);
INSERT INTO Symptom VALUES (113, 6027, '15-AUG-21', 5);
SELECT * FROM Symptom;

Main Query/Solution:
SELECT Employee.EMP_ID, Employee.EMP_NAME FROM Employee INNER JOIN Symptom ON Employee.EMP_ID = Symptom.EMP_ID GROUP BY Employee.EMP_ID, Employee.EMP_NAME HAVING COUNT(*) = (SELECT COUNT(*) FROM SymptomType);

Query using Table Division:
SELECT * FROM Symptom WHERE SYMPTOM_ID NOT IN ( SELECT SYMPTOM_ID FROM ((SELECT SYMPTOM)_ID, EMP_ID FROM (SELECT EMP_ID FROM Employee ) AS em CROSS JOIN (SELECT DISTINCT SYMPTOM_ID FROM Symptom) AS sy) EXCEPT (SELECT SYMPTOM_ID , EMP_ID FROM Symptom) ) AS sx ); 