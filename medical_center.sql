-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE,
    description TEXT
);

CREATE TABLE patient_visit
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER references patients(id),
    date DATE NOT NULL,
    doctor_id INTEGER references doctors(id)
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    patient_visit INTEGER references patient_visit(id),
    diagnoses INTEGER references diseases(id)
);


INSERT INTO doctors
    (first_name, last_name)
VALUES
    ('John', 'Smith'),
    ('Carol', 'James'),
    ('Tom', 'Handley');

INSERT INTO patients
    (first_name, last_name)
VALUES
    ('Roderick', 'Warren'),
    ('Lisa', 'Mckinney'),
    ('Jackie', 'Chapman'),
    ('Vicki', 'Barber'),
    ('Ed', 'Nash'),
    ('Lois', 'Paul');

INSERT INTO diseases
    (disease_name)
VALUES
    ('diabetes'),
    ('anemia'),
    ('epilepsy'),
    ('carpal tunnel syndrome'),
    ('alzheimers');