-- ======================
-- Create Database
-- ======================
CREATE DATABASE IF NOT EXISTS examino_db;
USE examino_db;

-- ======================
-- 1. Admins Table
-- ======================
CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO admins (full_name, email, password) VALUES
('Priyantha Desilva', 'admin@exam.com', 'admin123');

-- ======================
-- 2. Students Table
-- ======================
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    department VARCHAR(100)
);

INSERT INTO students (full_name, email, password, department) VALUES
('Nimesha Perera', 'nimesha@student.com', 'pass123', 'IT'),
('Sajith Fernando', 'sajith@student.com', 'pass123', 'Management');

-- ======================
-- 3. Exams Table
-- ======================
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(100) NOT NULL,
    exam_title VARCHAR(100) NOT NULL,
    exam_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    total_marks INT NOT NULL,
    class_room VARCHAR(50) NOT NULL,
    invigilator_name VARCHAR(100) NOT NULL
);

INSERT INTO exams (subject, exam_title, exam_date, start_time, end_time, total_marks, class_room, invigilator_name) VALUES
('Database Systems', 'DBMS Final Exam', '2025-06-15', '09:00:00', '11:00:00', 100, 'Room A1', 'Ms. Jayani'),
('Networking', 'Computer Networks Mid Exam', '2025-06-16', '13:00:00', '15:00:00', 75, 'Room B2', 'Mr. Ruwan');

-- ======================
-- 4. Enrollments Table
-- ======================
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    seat_number VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id) ON DELETE CASCADE
);

INSERT INTO enrollments (student_id, exam_id, seat_number) VALUES
(1, 1, 'A05'),
(2, 1, 'A06'),
(1, 2, 'B02');

-- ======================
-- 5. Results Table
-- ======================
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    marks_obtained INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id) ON DELETE CASCADE
);

INSERT INTO results (student_id, exam_id, marks_obtained, grade) VALUES
(1, 1, 85, 'A'),
(2, 1, 72, 'B'),
(1, 2, 65, 'C');

-- ======================
-- View: enrollments_view
-- ======================
CREATE VIEW enrollments_view AS
SELECT 
    en.enrollment_id,
    s.student_id,
    s.full_name AS student_name,
    e.exam_id,
    e.exam_title,
    e.subject,
    e.exam_date,
    e.class_room,
    en.seat_number
FROM enrollments en
JOIN students s ON en.student_id = s.student_id
JOIN exams e ON en.exam_id = e.exam_id;

-- ======================
-- View: results_view
-- ======================
CREATE VIEW results_view AS
SELECT 
    r.result_id,
    s.student_id,
    s.full_name AS student_name,
    e.exam_id,
    e.exam_title,
    r.marks_obtained,
    r.grade
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN exams e ON r.exam_id = e.exam_id;