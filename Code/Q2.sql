USED ORACLE LIVE SQL: https://livesql.oracle.com/

SELECT SYMPTOM_ID, SYMPTOM_NAME FROM SymptomType WHERE SYMPTOM_ID = (SELECT SYMPTOM_ID FROM (SELECT SYMPTOM_ID, COUNT(SYMPTOM_ID) AS "COUNT_OF_S_ID" FROM Symptom GROUP BY SYMPTOM_ID) S1 WHERE 1 = (SELECT COUNT(SYMPTOM_ID) FROM (SELECT SYMPTOM_ID, COUNT(SYMPTOM_ID) "COUNT_OF_S_ID" FROM Symptom GROUP BY SYMPTOM_ID) S2 WHERE S1.COUNT_OF_S_ID <= S2.COUNT_OF_S_ID));