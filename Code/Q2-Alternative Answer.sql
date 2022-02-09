USED ORACLE LIVE SQL: https://livesql.oracle.com/

SELECT * FROM Symptom;

SELECT * FROM SymptomType;

SELECT MAX(COUNT(SYMPTOM_ID)) AS "Maximum_Self_Reported_Symptom" FROM Symptom GROUP BY SYMPTOM_ID;

CREATE VIEW COUNT_OF_SELF_REPORTED_SYMPTOMS AS SELECT SYMPTOM_ID, COUNT(SYMPTOM_ID) AS "SYMPTOM_ID_COUNT" FROM Symptom GROUP BY SYMPTOM_ID ORDER BY SYMPTOM_ID;

SELECT * FROM COUNT_OF_SELF_REPORTED_SYMPTOMS;

SELECT SymptomType.SYMPTOM_ID, SymptomType.SYMPTOM_NAME, COUNT_OF_SELF_REPORTED_SYMPTOMS.SYMPTOM_ID_COUNT FROM SymptomType INNER JOIN COUNT_OF_SELF_REPORTED_SYMPTOMS ON SymptomType.SYMPTOM_ID = COUNT_OF_SELF_REPORTED_SYMPTOMS.SYMPTOM_ID;

CREATE VIEW COUNT_OF_SELF_REPORTED_SYMPTOMS_WITH_NAMES AS SELECT SymptomType.SYMPTOM_ID, SymptomType.SYMPTOM_NAME, COUNT_OF_SELF_REPORTED_SYMPTOMS.SYMPTOM_ID_COUNT FROM SymptomType INNER JOIN COUNT_OF_SELF_REPORTED_SYMPTOMS ON SymptomType.SYMPTOM_ID = COUNT_OF_SELF_REPORTED_SYMPTOMS.SYMPTOM_ID;

SELECT * FROM COUNT_OF_SELF_REPORTED_SYMPTOMS_WITH_NAMES;

SELECT * FROM COUNT_OF_SELF_REPORTED_SYMPTOMS_WITH_NAMES WHERE SYMPTOM_ID_COUNT = (SELECT MAX(SYMPTOM_ID_COUNT) FROM COUNT_OF_SELF_REPORTED_SYMPTOMS_WITH_NAMES);