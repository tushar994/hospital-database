# Dumbledore's Army's Group Project Phase 4

- Abhijeeth Singam 2019101065
- Tushar Jain 2019101091
- Kunwar Maheep Singh 2019101075

## How to run script

Run the following from the project folder

- to load our database


The start command is
```
mysql -u <user_name> -p <password>
```

```
source ./final.sql;
```
Then exit the MySQL CLI
```
exit
```

- Required Libraries
PrettyTable
subprocess
pymysql


- Now we run the script
``` shell
python3 operations.py
```
- give your username, password, and port (for mysql), it assumed that it is on localhost.

## Changes made from Phase 3
- Major Changes:
    * Created a new table "BRANCH_HEAD" with columns "BRANCH_ID" and "MANAGER_ID" (which have foreign key constraints to the "BRANCH" and "MANAGER' tables respectively) to store which employee/manager manages a certain branch, and removed the manager_id attribute from the branch_id table. This was changed to remove the cyclic dependecy that was present between the tables "BRANCH", "MANAGER", and "EMPLOYEES".

- Minor Changes:
    * The column "PATIENT_AADHAR_NO" of the table "OUTPATIENT_DIAGNOSIS" now has a foreign key constraint with the "AADHAR_NO" column of the "OUTPATIENT" table, instead of its initial constraint with the column "AADHAR_NO" of the "PAST_TREATMENT_1" table.
    * In the "WORKS_UNDER" table, the foreign key constraints have been changed, and now we have a composite foreign key (consisting of the "BRANCH_ID" and "DEPARTMENT_NAME" columns of the "WORKS_UNDER" table) in a foreign key constraint with the "BRANCH_ID" and "DEPARTMENT_NAME" columns of the table "DEPT".
    * Reversed the foreignkey constraints between the tables "PAST_TREATMENT_1" AND "PAST_TREATMENT_2", and the tables "EMPLOYEES" and "PERSON_INFO".

- Naming Scheme Changes:
    * All spaces were replaced with '_' in the names of tables and columns in the database.



