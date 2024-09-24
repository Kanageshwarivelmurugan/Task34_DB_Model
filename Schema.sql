-- Create the database
CREATE DATABASE guvi_zen;

-- Use the database
USE guvi_zen;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'instructor', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    instructor_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    progress DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE lessons (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    video_url VARCHAR(255),
    order_number INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE assessments (
    assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100) NOT NULL,
    total_marks INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE user_assessments (
    user_assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    assessment_id INT,
    marks_obtained INT,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (assessment_id) REFERENCES assessments(assessment_id)
);

CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    lesson_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id)
);

CREATE TABLE queries (
    query_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    query_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    due_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    position VARCHAR(100),
    department VARCHAR(100),
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE project_employees (
    project_employee_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    employee_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE certifications (
    certification_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    issued_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_certifications (
    user_certification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    certification_id INT,
    issued_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (certification_id) REFERENCES certifications(certification_id)
);

CREATE TABLE batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE batch_enrollments (
    batch_enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id INT,
    user_id INT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
