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
INSERT INTO Specialization (name) VALUES
('Терапевт'),
('Кардиолог'),
('Окулист'),
('Невролог'),
('Хирург');

INSERT INTO Proizvoditel (name, country) VALUES
('Pfizer', 'США'),
('Bayer', 'Германия'),
('Novartis', 'Швейцария'),
('Sanofi', 'Франция'),
('Фармстандарт', 'Россия'),
('KRKA', 'Словения'),
('Teva', 'Израиль');

INSERT INTO Patient (full_name, date_of_birth, gender, phone, email, address) VALUES
('Иванов Иван Иванович', '1985-03-12', 'M', '+79001234561', 'ivanov@example.com', 'г. Москва, ул. Ленина, д. 10, кв. 5'),
('Петрова Анна Сергеевна', '1992-07-25', 'F', '+79001234562', 'petrova_a@example.com', 'г. Санкт-Петербург, Невский пр., д. 45'),
('Сидоров Дмитрий Викторович', '1978-11-30', 'M', '+79001234563', 'sidorov.d@example.com', 'г. Новосибирск, ул. Гоголя, д. 22'),
('Козлова Елена Павловна', '2000-01-15', 'F', '+79001234564', 'kozlova.e@example.com', 'г. Екатеринбург, пр. Космонавтов, д. 88'),
('Смирнов Алексей Юрьевич', '1989-09-08', 'M', '+79001234565', 'smirnov_a@example.com', 'г. Казань, ул. Баумана, д. 12');

INSERT INTO Doctor (full_name, specialization_id, phone, email, cabinet_number) VALUES
('Морозова Ольга Николаевна', 1, '+79009876541', 'morozova@clinic.ru', '101'),
('Волков Сергей Петрович', 2, '+79009876542', 'volkov@clinic.ru', '205'),
('Лебедева Мария Андреевна', 3, '+79009876543', 'lebedeva@clinic.ru', '112'),
('Громов Игорь Валерьевич', 4, '+79009876544', 'gromov@clinic.ru', '304'),
('Федоров Артём Дмитриевич', 5, '+79009876545', 'fedorov@clinic.ru', '401');

INSERT INTO Visit (patient_id, doctor_id, visit_datetime, status) VALUES
(1, 1, '2025-12-15 10:00:00', 'завершён'),
(2, 3, '2025-12-16 14:30:00', 'завершён'),
(3, 2, '2025-12-17 09:15:00', 'запланирован'),
(4, 1, '2025-12-18 16:00:00', 'запланирован'),
(5, 4, '2025-12-14 11:45:00', 'завершён'),
(1, 2, '2025-12-20 13:00:00', 'запланирован'),
(2, 5, '2025-12-19 15:20:00', 'отменён');
INSERT INTO Diagnosis (visit_id, description, diagnosis_date) VALUES
(1, 'Острый бронхит', '2025-12-15'),
(2, 'Миопия средней степени', '2025-12-16'),
(5, 'Мигрень', '2025-12-14'),
(4, 'Артериальная гипертензия 1 ст.', '2025-12-18');  --  если статус "запланирован", обычно диагноза ещё нет, но допустимо для примера

INSERT INTO Medication (name, proizvoditel_id, price, instructions) VALUES
('Амоксициллин', 1, 120.50, 'Принимать по 1 таблетке 3 раза в день после еды в течение 7 дней.'),
('Аспирин Кардио', 2, 85.00, 'Принимать по 1 таблетке в день утром натощак.'),
('Визин', 3, 210.75, 'Закапывать по 1–2 капли в каждый глаз при покраснении.'),
('Нурофен', 4, 95.30, 'Принимать по 1 таблетке до еды при боли или температуре.'),
('Амлодипин', 5, 65.90, 'Принимать по 1 таблетке утром для контроля давления.'),
('Парацетамол', 6, 40.00, 'Принимать по 1–2 таблетки при температуре выше 38.5°C.'),
('Цитрамон', 7, 35.20, 'Принимать по 1 таблетке при головной боли.');