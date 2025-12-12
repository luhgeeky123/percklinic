--  Специализации врачей
CREATE TABLE Specialization (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

--  Производители лекарств
CREATE TABLE Proizvoditel (
    proizvoditel
    
    
    proizvoditel_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(100)  
);

--  Пациенты
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

--  Врачи
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    specialization_id INT NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    cabinet_number VARCHAR(10),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(specialization_id)
);

--  Приёмы (визиты)
CREATE TABLE Visit (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_datetime DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'запланирован',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

--  Диагнозы
CREATE TABLE Diagnosis (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    diagnosis_date DATE NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES Visit(visit_id)
);

--  Лекарства
CREATE TABLE Medication (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
   proizvoditel_id INT NOT NULL,
    price DECIMAL(10, 2),
    instructions TEXT,
    FOREIGN KEY (proizvoditel_id) REFERENCES Manufacturer(proizvoditel_id)
);

--  Назначения (рецепты)
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT NOT NULL,
    medication_id INT NOT NULL,
    dosage VARCHAR(100),
    FOREIGN KEY (visit_id) REFERENCES Visit(visit_id),
    FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);
