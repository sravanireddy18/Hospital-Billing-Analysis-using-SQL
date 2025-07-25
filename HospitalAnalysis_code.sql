
# Hospital Patient Outcome & Resource Analysis

# Step 1: Create the Database Named hospitalsdb

create database hospitalsdb;
use hospitalsdb;

# Step 2: Create Tables

# 1. Patients:
CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    age INT,
    gender VARCHAR(10)
);

# 2. diagnoses
CREATE TABLE diagnoses (
    diagnosis_name VARCHAR(50) PRIMARY KEY
);

# 3. wards
CREATE TABLE wards (
    ward_type VARCHAR(50) PRIMARY KEY,
    capacity INT
);

# 4. patient_admission
CREATE TABLE patient_admission (
    admission_id INT PRIMARY KEY auto_increment,
    patient_id VARCHAR(10),
    diagnosis_name VARCHAR(50),
    admission_date DATE,
    discharge_date DATE,
    recovery_days INT,
    ward_type VARCHAR(50),
    outcome VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (diagnosis_name) REFERENCES diagnoses(diagnosis_name),
    FOREIGN KEY (ward_type) REFERENCES wards(ward_type)
);

# 5. billing
CREATE TABLE billing (
    admission_id INT PRIMARY KEY,
    cost_per_day INT,
    recovery_days INT,
    total_cost INT,
    insurance_covered varchar(5)
);

# Inserting data into Table

# 1. Diagnoses
INSERT INTO diagnoses (diagnosis_name) VALUES
('Pneumonia'),
('Diabetes'),
('Heart Disease'),
('Fracture'),
('Asthma'),
('Covid-19'),
('Hypertension'),
('Infection'),
('Cancer'),
('Kidney Failure');

# Retriving Data from Tables

select * from patients;
select * from diagnoses;
select * from wards;
select * from patient_admission;
select * from billing;


#1. Total Billing with Insurance Status
SELECT 
    admission_id,
    total_cost,
    insurance_covered,
    CASE 
        WHEN insurance_covered = 'TRUE' THEN 'Covered by Insurance'
        ELSE 'Not Covered'
    END AS insurance_status
FROM billing;

# 2. Join Patient Details with Their Diagnosis and Ward Info
SELECT 
    pa.patient_id,
    p.age,
    p.gender,
    pa.diagnosis_name,
    pa.admission_date,
    pa.discharge_date,
    pa.recovery_days,
    pa.ward_type,
    pa.outcome
FROM patient_admission pa
JOIN patients p ON pa.patient_id = p.patient_id;

# 3. Find Most Common Diagnoses
SELECT 
    diagnosis_name,
    COUNT(*) AS count
FROM patient_admission
GROUP BY diagnosis_name
ORDER BY count DESC
LIMIT 5;

# 4. Average Recovery Days by Ward
SELECT 
    ward_type,
    AVG(recovery_days) AS average_recovery_days
FROM patient_admission
GROUP BY ward_type;

# 5. Patients Who Stayed More Than 20 Days
SELECT 
    patient_id,
    diagnosis_name,
    recovery_days
FROM patient_admission
WHERE recovery_days > 20;

# 6. Link Billing Data with Patients via Recovery Days
# This query joins the billing table and admission using recovery_days 
# (note: you may want a unique ID to join properly, but with this sample we'll match via recovery_days).
SELECT 
    p.patient_id,
    pa.diagnosis_name,
    b.total_cost,
    b.insurance_covered
FROM patients p
JOIN patient_admission pa ON p.patient_id = pa.patient_id
JOIN billing b ON pa.recovery_days = b.recovery_days;

# 7. Ward Capacity Report
SELECT 
    w.ward_type,
    w.capacity,
    COUNT(pa.patient_id) AS patients_admitted
FROM wards w
LEFT JOIN patient_admission pa ON w.ward_type = pa.ward_type
GROUP BY w.ward_type, w.capacity;

# 8. Total Revenue Generated by Ward
SELECT 
    pa.ward_type,
    SUM(b.total_cost) AS total_revenue
FROM patient_admission pa
JOIN billing b ON pa.recovery_days = b.recovery_days
GROUP BY pa.ward_type
ORDER BY total_revenue DESC;

# 9. Patient Count by Gender
SELECT 
    gender,
    COUNT(*) AS total_patients
FROM patients
GROUP BY gender;

# 10. Top 3 Most Expensive Admissions
SELECT *
FROM billing
ORDER BY total_cost DESC
LIMIT 3;

# To get the Table_Names from the DataBase
SHOW TABLES;

