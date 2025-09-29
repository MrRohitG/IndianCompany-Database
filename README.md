# IndianCompany Database (MySQL)
---

## 📊 Example Schema Diagram
<img width="6400" height="3253" alt="indian company schema" src="https://github.com/user-attachments/assets/12f4a57a-038a-4a0a-b6e7-2e948727d803" />

---

## 📌 Project Overview
This project is a **relational database system** designed for a fictional Indian company.  
It models real-world entities such as employees, departments, projects, dependents, and office locations.  

The goal is to demonstrate **database design principles** including normalization, relationships, referential integrity, and sample queries.

---

## 🏗️ Database Design
The database is named **IndianCompany** and contains the following tables:

1. **Department**
   - Stores department information, manager Aadhaar, and manager start date.
   
2. **Employee**
   - Stores employee details (name, Aadhaar, salary, gender, department, supervisor).
   - Relationships:
     - Each employee belongs to one department.
     - Each employee can have a supervisor (who is also an employee).

3. **Project**
   - Stores project details linked to a department.

4. **Works_On**
   - Bridge table between **Employee** and **Project** (many-to-many relationship).
   - Tracks how many hours an employee works on each project.

5. **Dependent**
   - Stores details of dependents (children, spouse, etc.) of employees.

6. **Location**
   - Stores multiple locations of departments.

---

## 🔑 Key Features
- ✅ **Primary & Foreign Keys** for referential integrity  
- ✅ **One-to-Many** (Department → Employee, Employee → Dependent)  
- ✅ **Many-to-Many** (Employee ↔ Project via Works_On)  
- ✅ **Check constraints** for Gender and Hours  
- ✅ **Cascade operations** (e.g., deleting an employee deletes their dependents/works_on records)  
- ✅ **Realistic sample data** for managers, employees, dependents, and projects  

---

## 📊 Example Schema Diagram
<img width="6400" height="3253" alt="indian company schema" src="https://github.com/user-attachments/assets/12f4a57a-038a-4a0a-b6e7-2e948727d803" />

---



