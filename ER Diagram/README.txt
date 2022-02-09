Let’s iterate through all the 8 entities in the ER-diagram and their relationships:

ATTRIBUTES:-

EMPLOYEE:
The identifier of this table is “Employee_ID”, which is the primary key. It is unique, i.e., every employee in the company has a unique ID assigned ti him/her. The other attributes that it holds are the employees First_Name, Last_Name, Phone_Number, Address and Email-ID (which is an optional attribute) 
Note that all mandatory and required attributes are in bold in the ER-diagram (rule of crow’s foot notation)

REGISTRATIONS:
In this entity/table, the “Employee_ID” from the EMPLOYEE table acts as the foreign key, and it is also a primary key of this table, as it has dependent tables that have a strong relationship with it. It also has another unique identifier, i.e., Registration_ID, which is given to each employee whenever they make a registration for COVID testing. The other attributes that it holds are the type of registration (Registration_type) which indicates if he/she is going for an on-site test or drop-off of their sample for testing and Registration_location which indicates the location (if there are multiple test centers/drop-off centers in the company or if they are testing outside the company)

TEMPERATURE SCAN:
Here the “Employee_ID” is the foreign key which comes from two other entities which is uniquely used to identify an employee. Other attributes are Temperature which indicates the number in degrees Celsius or degrees Fahrenheit and if it is higher than a specific number then the boolean value is_high is set to true, else it remains false.

COVID TESTING:
In this entity, “Employee_ID” is the foreign key and it also serves as a primary key for the table. Other attributes include the Test_Result, which indicates if COVID is detected or not detected, Lab_name which is the name of the lab where the test was performed and the Reference_range which is an optional attribute and is indicated only if COVID is detected in a particular sample.

COVID APP:
This entity contains "Employee_ID" as the primary key identifier. It also contains a couple of boolean attributes like Is_sick and Tested_positive, the values of which would be true/false. It also has Alerts attribute which need not have a value at all times, it holds values only when there is a alert that is to be displayed to the employees. It also has an attribute to indicate if the employee was in close proximity of an affected person which holds the values yes, no and maybe. The attribute symptoms is used when the employee self-reports if he is suffering from any of the symptoms. The Location_floor_record and the Meeting_rooms attributes holds the locations/floors and meeting rooms the employee has visited in the past 10 working days. The status attribute holds the status of the employee which indicates if he is sick, hospitalized or well.

MEETINGS:
The unique identifier (primary key) for this entity is "Meeting_timestamp" which holds the date and time of the meeting that took place in a particular room. For instance Date: 09/12/2021, Time: 5:35pm and room number: 005, then Meeting_timestamp: 09122021535005. It also has a separate attribute called Room_Number, and other attributes include Floor and List_of _employees that attended a particular meeting.

HR DEPARTMENT:
This entity is a subset of EMPLOYEE table for most of the companies. Every HR in its department also has a unique work ID which we refer here as HR_ID - the primary key for this entity. It also holds the basic information such as Full_Name, Phone, and other attributes like Meeting_details which contains all the meetings info in the company and also the Details_of_employees_who_are_tested_positive.

QUARANTINE:
This entity has a foreign key "Employee_ID" and also holds attributes like Number_of_days the employee was in quarantine, his/her Sickness_scale and a boolean value to indicate if he/her has recovered(Is_recovered).

RELATIONSHIPS:-

1. has: One (mandatory: i.e., everyone) employee can have 0 or multiple registrations
2. installs: One (mandatory: i.e., everyone) employee can install one COVID app
3. Randomly gets: An employee may or may not get temperature scan randomly
4. is high: If the temperature of one scanned employee is high he undergoes COVID testing
5. signed out: That single employee who was randomly scanned and temperature is not high may also undergo testing
6. offers: If an employee is registered for testing that ID offers him/her one COVID test
7. result is reported: Each employee's 0 or multiple test results is/are reported to the COVID app
8. if positive, goes to: If the tested employee result is positive, the employee goes to quarantine
9. self-report symptoms: Employees can self-report if they suffer from any symptoms
10. Self-reported employees undergo: Self-reported employees undergo a COVID test
11. attends: Multiple employees can attend multiple meetings
12. are noted in: all those meetings details are noted in the app
13. are reported to: All those meetings are also reported to any one of the HR
14. affected employees report to: All the affected employees also report to HR by the app
15. calls: The HR then immediately calls all the employees who were in meeting/proximity of affected employee
16. updates: The HR also updates all those employees the alerts to be sent in the app
17. if in close proximity of affected people app alerts: The app then alerts all the employees who were in close proximity of affected employees 
18. alerts if in same floor of affected person: The app also alerts all the employees who were in same floor as the affected person
19. notified employees get: All the notified employees get tested 
20. goes to: All those employees then go to quarantine  
21. maintains record: The HR department maintains record of all those employees who are in quarantine
22. reports daily: The employees in quarantine report their status daily to the app
23. if in same floor of affected person: All the employees who were in same floor of affected person may or may not undergo testing   