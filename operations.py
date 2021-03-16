import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate



def show_doctors_in_a_dep():
    """
    this is for showing all doctors that work in a certain department
    """
    try:
        dep = input("Enter the required department: ")
        dep = dep.capitalize()
        query = "select STAFF_ID,JOB_TYPE,SALARY,START_DATE,TERMINATION_DATE,AADHAR_NO,EMPLOYEES.BRANCH_ID,DEPARTMENT_NAME from EMPLOYEES INNER JOIN WORKS_UNDER ON EMPLOYEES.STAFF_ID = WORKS_UNDER.DOCTOR_ID WHERE WORKS_UNDER.DEPARTMENT_NAME='%s' AND EMPLOYEES.TERMINATION_DATE IS NULL" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def show_technicians_in_a_branch():
    try:
        dep = input("Enter the required Branch Name: ")
        query = "select EMPLOYEES.STAFF_ID,EMPLOYEES.JOB_TYPE,EMPLOYEES.SALARY,EMPLOYEES.START_DATE,EMPLOYEES.TERMINATION_DATE,EMPLOYEES.AADHAR_NO,BRANCH.BRANCH_NAME from EMPLOYEES INNER JOIN BRANCH ON EMPLOYEES.BRANCH_ID = BRANCH.BRANCH_ID WHERE BRANCH.BRANCH_NAME='%s' AND EMPLOYEES.TERMINATION_DATE IS NULL AND EMPLOYEES.JOB_TYPE='TECHNICIAN'" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def show_equipment_in_a_branch():
    try:
        dep = input("Enter the required Branch Name: ")
        query = "select EQUIPMENT.EQUIPMENT_COMPANY,EQUIPMENT.EQUIPMENT_MODEL,EQUIPMENT.EQUIPMENT_ID,BRANCH.BRANCH_NAME from EQUIPMENT INNER JOIN BRANCH ON EQUIPMENT.OWNER_ID = BRANCH.BRANCH_ID WHERE BRANCH.BRANCH_NAME='%s'" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def show_patient_above_certain_height():
    try:
        dep = input("Enter the required Height in cm: ")
        dep = int(dep)
        query = "select * from PATIENT WHERE PATIENT.HEIGHT > %d" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)


def show_patient_above_certain_weight():
    try:
        dep = input("Enter the required Weight in kg: ")
        dep = int(dep)
        query = "select * from PATIENT WHERE PATIENT.WEIGHT > %d" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def show_doctors_with_salary_above():
    try:
        dep = input("Enter the required Salary: ")
        dep = int(dep)
        query = "select * from EMPLOYEES WHERE EMPLOYEES.SALARY > %d AND EMPLOYEES.JOB_TYPE='DOCTORS'" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

#not tested from here

def show_stock_of_medicine():
    try:
        dep = input("Enter the required medicine name: ")
        query = "select * from MEDICINE WHERE MEDICINE.MEDICINE_NAME = '%s'" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def show_equipment_of_certain_model():
    try:
        dep = input("Enter the required model: ")
        query = "select * from EQUIPMENT WHERE EQUIPMENT.EQUIPMENT_MODEL = '%s'" % (dep)
        print(query)
        no_row=cur.execute(query)
        result = cur.fetchall()
        field_names = [i[0] for i in cur.description]
        # print(field_names)
        entry = []
        for y in range(no_row):
            entry.append([result[y-1][x] for x in field_names])
            # print(entry[y-1])
        print(tabulate(entry, headers=field_names, tablefmt='psql'))
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

#########
#inserts

def insert_new_medicine():
    try:
        name = input("Enter the required name of the medicine: ")
        branch_id = input("Enter the branch ID of the branch this  medicine is in: ")
        branch_id = int(branch_id)
        stock = input("Enter the current stock of this medicine in the branch: ")
        stock = int(stock)
        query = "INSERT INTO MEDICINE(MEDICINE_NAME, STOCK, BRANCH_ID) VALUES ('%s', %d, %d)" % (name,stock,branch_id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)
def insert_new_ambulance():
    try:
        state = input("Enter the required registration state of the ambulance: ")
        branch_id = input("Enter the branch ID of the branch this  ambulance is in: ")
        branch_id = int(branch_id)
        reg_no = input("Enter the registration number of the ambulance: ")
        reg_no = int(reg_no)
        model = input("Enter the model of the ambulance: ")
        query = "INSERT INTO AMBULANCE(AMBULANCE_MODEL, REGISTRATION_STATE, REGISTRATION_NUMBER, OWNER_ID) VALUES ('%s','%s', %d, %d)" % (model,state, reg_no,branch_id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)
def insert_new_patient():
    try:
        aadhar=input("Enter patient Aadhar number: ")
        name=input("Enter patient name: ")
        dob=input("Enter date of birth of patient(YYYY-MM-DD): ")
        phone_no=input("Enter phone number: ")
        gender=input("Enter gender as (Male, Female, Transgender): ")
        height=input("Enter height in cm: ")
        if height == "":
            height=None
        else :
            height=int(height)
        weight=input("Enter weight in cm: ")
        if weight == "":
            weight=None
        else :
            weight=int(weight)
        if weight!=None and height!=None:
            query = "INSERT INTO PATIENT(AADHAR_NO, NAME, DOB, PHONE_NO, GENDER, HEIGHT, WEIGHT) VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d)" % (aadhar, name, dob, phone_no, gender, height, weight)
        elif weight==None and height!=None:
            query = "INSERT INTO PATIENT(AADHAR_NO, NAME, DOB, PHONE_NO, GENDER, HEIGHT) VALUES ('%s', '%s', '%s', '%s', '%s', %d)" % (aadhar, name, dob, phone_no, gender, height)
        elif weight!=None and height==None:
            query = "INSERT INTO PATIENT(AADHAR_NO, NAME, DOB, PHONE_NO, GENDER, WEIGHT) VALUES ('%s', '%s', '%s', '%s', '%s' , %d)" % (aadhar, name, dob, phone_no, gender, weight) 
        else:
            query = "INSERT INTO PATIENT(AADHAR_NO, NAME, DOB, PHONE_NO, GENDER) VALUES ('%s', '%s', '%s', '%s', '%s')" % (aadhar, name, dob, phone_no, gender)
        print(query)
        cur.execute(query)
        in_ou=input("Enter 0 for inpatient and 1 for outpatient: ")
        in_ou= int(in_ou)
        if in_ou == 0:
            emerg=input("Enter emergency contact: ")
            date=input("Enter date of admission(YYYY-MM-DD): ")
            query = "INSERT INTO INPATIENT(EMERGENCY_CONTACT, DATE_OF_ADMISSION,AADHAR_NO) VALUES ('%s', '%s', '%s')" % (emerg,date,aadhar)
            cur.execute(query)
            con.commit()
        else :
            date_cons = input("Enter date of consultancy(YYYY-MM-DD): ")
            query = "INSERT INTO OUTPATIENT VALUES ('%s', '%s')" % (date_cons, aadhar)
            cur.execute(query)
            con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)


def add_in_diag():
    try:
        report_id = input("Enter report id: ")
        report_id=int(report_id)
        doctor_id = input("Enter doctor id: ")
        doctor_id=int(doctor_id)
        aadhar = input("Enter patient aadhar number: ")
        # branch_id = input("Enter branch id: ")
        # branch_id=int(branch_id)

        query2 = "SELECT BRANCH_ID FROM EMPLOYEES WHERE STAFF_ID=%d" % (doctor_id)
        cur.execute(query2)
        branch_id=cur.fetchone()["BRANCH_ID"]
        room = input("Enter room number: ")
        room=int(room)
        query = "INSERT INTO INPATIENT_DIAGNOSIS VALUES (%d, %d, '%s',%d, %d )" % (report_id, doctor_id, aadhar, branch_id, room)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def add_out_diag():
    try:
        report_id = input("Enter report id: ")
        report_id=int(report_id)
        doctor_id = input("Enter doctor id: ")
        doctor_id=int(doctor_id)
        aadhar = input("Enter patient aadhar number: ")
        query = "INSERT INTO OUTPATIENT_DIAGNOSIS VALUES (%d, %d, '%s')" % (report_id, doctor_id, aadhar)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def add_report():
    try:
        date=input("Enter date of report: ")
        cost = input("Enter cost of treatment: ")
        if cost != "":
            cost=int(cost)
        else:
            cost=None
        if cost == None:
            query="INSERT INTO DOCTORS_REPORT(DATE_OF_REPORT) VALUES ('%s')" % (date)
        else :
            query="INSERT INTO DOCTORS_REPORT(COST_OF_TREATMENT, DATE_OF_REPORT) VALUES (%d, '%s')" % (cost, date)
        cur.execute(query)

        query2="SELECT LAST_INSERT_ID()"
        cur.execute(query2)
        new_rep = cur.fetchone()["LAST_INSERT_ID()"]
        print("New Report ID:")
        print(new_rep)

        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def add_branch():
    try:
        name = input("Enter new branch name: ")
        phone = input("Enter new branch phone number: ")
        address = input("Enter new branch address: ")

        query = "INSERT INTO BRANCH (BRANCH_NAME,BRANCH_PHONE_NO,BRANCH_ADDRESS) VALUES ('%s','%s','%s')" % (name,phone,address)
        cur.execute(query)

        query2 = "SELECT LAST_INSERT_ID()"
        cur.execute(query2)
        new_emp = cur.fetchone()["LAST_INSERT_ID()"]
        print("New Branch ID:")
        print(new_emp)

        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>", e)
    

def add_branch_head():
    try:
        branch = input("Enter Branch ID: ")
        manage = input("Enter Manager ID: ")

        branch = int(branch)
        manage = int(manage)

        query = "INSERT INTO BRANCH_HEAD VALUES (%d,%d)" % (branch,manage)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>", e)


def add_employee():
    try:
        job=input("Enter Job Type (DOCTORS,NURSES,MANAGER,CLEANING_STAFF,PHARMACIST,TECHNICIAN): ")
        salary=input("Enter Salary: ")
        salary = int(salary)
        start=input("Enter Start Date (YYYY-MM-DD): ")
        aadhar=input("Enter Aadhar No: ")
        branch=input("Enter Branch ID: ")
        branch = int(branch)
        name = input("Enter Name: ")
        phone = input("Enter Phone Number: ")
        dob = input("Enter DoB (YYYY-MM-DD): ")
        gender=input("Enter Gender (Male,Female,Other): ")

        query = "INSERT INTO PERSON_INFO VALUES ('%s','%s','%s','%s','%s')" % (aadhar,name,phone,dob,gender)
        cur.execute(query)
        query1 = "INSERT INTO EMPLOYEES (JOB_TYPE,SALARY,START_DATE,AADHAR_NO,BRANCH_ID) VALUES ('%s',%d,'%s','%s',%d)" % (job,salary,start,aadhar,branch)
        cur.execute(query1)

        query2 = "SELECT LAST_INSERT_ID()"
        cur.execute(query2)
        new_emp = cur.fetchone()["LAST_INSERT_ID()"]
        print("New Employee ID:")
        print(new_emp)


        if job=="CLEANING_STAFF" or job=="NURSES" or job=="PHARMACIST":
            manager=input("Enter Manager ID: ")
            manager = int(manager)
            query3="INSERT INTO %s VALUES (%d,%d)" % (job,new_emp,manager)
            cur.execute(query3)
        elif job=="DOCTORS":
            medical = input("Enter Medical Licence ID: ")
            query4 = "INSERT INTO %s VALUES (%d,'%s')" % (job, new_emp, medical)
            cur.execute(query4)
        elif job == "MANAGER":
            query5 = "INSERT INTO %s VALUES (%d)" % (job, new_emp)
            cur.execute(query5)
        elif job == "TECHNICIAN":
            senior = input("Enter Senior Technician ID (if none then press ENTER): ")
            if senior=="":
                query6 = "INSERT INTO %s (STAFF_ID) VALUES (%d)" % (job, new_emp)
                cur.execute(query6)
            else:
                senior=int(senior)
                query7 = "INSERT INTO %s VALUES (%d,%d)" % (job, new_emp,senior)
                cur.execute(query7)

        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>", e)



###################
#updates

def update_stock():
    try:
        name = input("Enter the required name of the medicine: ")
        branch_id = input("Enter the branch ID of the branch this  medicine is in: ")
        branch_id = int(branch_id)
        stock = input("Enter the current stock of this medicine in the branch: ")
        stock = int(stock)
        query = "UPDATE MEDICINE SET STOCK=%d WHERE MEDICINE_NAME='%s' AND BRANCH_ID=%d" % (stock,name,branch_id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def update_salary():
    try:
        id = input("Enter the required id of the employee: ")
        id = int(id)
        salary = input("Enter the new salary employee: ")
        salary = int(salary)
        query = "UPDATE EMPLOYEES SET SALARY=%d WHERE STAFF_ID=%d " % (salary,id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def update_date_of_termination():
    try:
        id = input("Enter the required id of the employee: ")
        id = int(id)
        date = input("Enter the date of termination of the employee (YYYY:MM:DD): ")
        query = "UPDATE EMPLOYEES SET TERMINATION_DATE='%s' WHERE STAFF_ID=%d " % (date,id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def update_report():
    try:
        report = input("Enter report id of report you want to update: ")
        report=int(report)
        date = input("Enter date if you want to update: ")
        cost = input("Enter treatment cost if you want to update: ")
        if date!="":
            query = "UPDATE DOCTORS_REPORT SET DATE_OF_REPORT='%s' WHERE REPORT_ID =%d" % (date, report)
            cur.execute(query)
        if cost!="":
            cost=int(cost)
            query = "UPDATE DOCTORS_REPORT SET COST_OF_TREATMENT=%d WHERE REPORT_ID =%d" % (cost, report)
            cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)


def complete_treatment():
    try:
        report = input("Enter report id of the treatment you would like to complete: ")
        report = int(report)
        diag = input("Enter diagnosis: ")
        treat = input("Enter treatment: ")
        query1="SELECT * FROM INPATIENT_DIAGNOSIS WHERE REPORT_ID=%d" % (report)
        match1 = cur.execute(query1)
        match2=0
        aadhar=""
        inout=""
        if match1==0:
            query2 = "SELECT * FROM OUTPATIENT_DIAGNOSIS WHERE REPORT_ID=%d" % (report)
            match2 = cur.execute(query2)
            if match2>0:
                aadhar=cur.fetchone()["PATIENT_AADHAR_NO"]
                inout="OUT"
                query6 = "DELETE FROM OUTPATIENT_DIAGNOSIS WHERE REPORT_ID=%d" % (report)
                cur.execute(query6)
                query7="DELETE FROM OUTPATIENT WHERE AADHAR_NO='%s'" % (aadhar)
                cur.execute(query7)

        elif match1>0:
            aadhar=cur.fetchone()["PATIENT_AADHAR_NO"]
            inout="IN"
            query8 = "DELETE FROM INPATIENT_DIAGNOSIS WHERE REPORT_ID=%d" % (report)
            cur.execute(query8)
            query9 = "DELETE FROM INPATIENT WHERE AADHAR_NO='%s'" % (aadhar)
            cur.execute(query9)
        
        if match1==0 and match2==0:
            print("Invalid Report ID")
        else:
            query3="SELECT DATE_OF_REPORT,COST_OF_TREATMENT FROM DOCTORS_REPORT WHERE REPORT_ID=%d" % (report)
            cur.execute(query3)
            entry = cur.fetchone()
            date = entry["DATE_OF_REPORT"]
            cost = entry["COST_OF_TREATMENT"]
            query4="INSERT INTO PAST_TREATMENT_2 VALUES ('%s','%s',%d)" % (date,treat,cost)
            cur.execute(query4)
            query5 = "INSERT INTO PAST_TREATMENT_1 VALUES ('%s','%s','%s','%s','%s')" % (aadhar, diag, date, treat, inout)
            cur.execute(query5)     
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>", e)

#############
# deletions

def delete_ambulance():
    try:
        state = input("Enter the required registration state of the ambulance: ")
        reg_no = input("Enter the registration number of the ambulance: ")
        reg_no = int(reg_no)
        query = "DELETE FROM AMBULANCE WHERE REGISTRATION_STATE='%s' AND REGISTRATION_NUMBER=%d" % (state,reg_no)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)

def delete_equipment():
    try:
        company = input("Enter the equipment company: ")
        model = input("Enter the equipment model: ")
        id = input("Enter the equipment id: ")
        query = "DELETE FROM EQUIPMENT WHERE EQUIPMENT_COMPANY='%s' AND EQUIPMENT_MODEL='%s' AND EQUIPMENT_ID='%s'" % (company,model,id)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to Execute")
        print(">>>>>>",e)


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        show_doctors_in_a_dep()
    elif(ch == 2):
        show_technicians_in_a_branch()
    elif(ch == 3):
        show_equipment_in_a_branch()
    elif(ch == 4):
        show_patient_above_certain_height()
    elif(ch == 5):
        show_patient_above_certain_weight()
    elif(ch == 6):
        show_doctors_with_salary_above()
    elif(ch == 7):
        show_stock_of_medicine()
    elif(ch == 8):
        show_equipment_of_certain_model()
    elif(ch == 9):
        insert_new_medicine()
    elif(ch == 10):
        insert_new_ambulance()
    elif(ch == 11):
        update_stock()
    elif(ch == 12):
        update_salary()
    elif(ch == 13):
        update_date_of_termination()
    elif(ch == 14):
        delete_ambulance()
    elif(ch == 15):
        delete_equipment()
    elif(ch==16):
        insert_new_patient()
    elif( ch==17 ):
        add_in_diag()
    elif( ch==18 ):
        add_out_diag()
    elif (ch==19):
        add_report()
    elif(ch==20):
        update_report()
    elif(ch == 21):
        complete_treatment()
    elif(ch == 22):
        add_branch()
    elif(ch == 23):
        add_branch_head()
    elif(ch == 24):
        add_employee()
    else:
        print("Error: Invalid Option")


while(1):
    tmp = sp.call('clear', shell=True)

    username = input("Username: ")
    password = input("Password: ")
    port = input("Port: ")
    port = int(port)
    try:
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='hospital',
                              port=port,
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)
        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")
        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Show all doctors in a department")  # Hire an Employee
                print("2. Show all technicians in a branch")  # Fire an Employee
                print("3. Show all Equipment in a branch")  # Promote Employee
                print("4. Show all patients taller than a certain height")  # Employee Statistics
                print("5. Show all patients heavier than a certain weight")
                print("6. Show all doctors earning more than a certain salary")
                print("7. Show stock of a certain medicine")
                print("8. Show equiment of a certain model")
                print("9. Insert a new medicine")
                print("10. Insert a new ambulance")
                print("11. Update stock of a certain medicine in a  certain branch")
                print("12. Update salary of a certain employee ")
                print("13. Update Date of termination of a certain employee")
                print("14. Delete an ambulance ")
                print("15. Delete some equipment")
                print("16. Add a new patient")
                print("17. Add an inpatient diagnosis")
                print("18. Add an outpatient diagnosis")
                print("19. Add a Doctor's report")
                print("20. Update a Doctor's report")
                print("21. Complete a treatment")
                print("22. Add Branch")
                print("23. Add Branch Head")
                print("24. Add Employee")
                print("25. Exit")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 25:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")
    except:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
