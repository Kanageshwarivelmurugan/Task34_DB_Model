INSERT INTO users (username, email, password_hash, role) VALUES
('john_doe', 'john@example.com', 'hashed_password_1', 'student'),
('jane_smith', 'jane@example.com', 'hashed_password_2', 'instructor'),
('alice_jones', 'alice@example.com', 'hashed_password_3', 'student'),
('bob_brown', 'bob@example.com', 'hashed_password_4', 'instructor');

INSERT INTO courses (title, description, instructor_id) VALUES
('Introduction to Programming', 'Learn the basics of programming.', 2),
('Data Science Fundamentals', 'An overview of data science concepts.', 2),
('Web Development Basics', 'Get started with HTML, CSS, and JavaScript.', 4);

INSERT INTO enrollments (user_id, course_id, enrollment_date, progress) VALUES
(1, 1, NOW(), 50.0),
(1, 2, NOW(), 20.0),
(3, 1, NOW(), 0.0),
(3, 3, NOW(), 30.0);

INSERT INTO lessons (course_id, title, content, video_url, order_number) VALUES
(1, 'Getting Started with Programming', 'Introduction to programming concepts.', 'https://example.com/video1', 1),
(1, 'Variables and Data Types', 'Understanding variables and data types.', 'https://example.com/video2', 2),
(2, 'Data Collection', 'Methods for collecting data.', 'https://example.com/video3', 1),
(3, 'HTML Basics', 'Introduction to HTML structure.', 'https://example.com/video4', 1);

INSERT INTO assessments (course_id, title, total_marks) VALUES
(1, 'Programming Basics Quiz', 100),
(2, 'Data Science Quiz', 100),
(3, 'Web Development Quiz', 100);

INSERT INTO user_assessments (user_id, assessment_id, marks_obtained) VALUES
(1, 1, 85),
(3, 1, 90),
(1, 2, 75),
(3, 3, 60);

INSERT INTO feedback (user_id, course_id, rating, comments) VALUES
(1, 1, 4, 'Great course!'),
(3, 2, 5, 'Loved the content!'),
(1, 3, 3, 'Could be better.');

INSERT INTO queries (user_id, query_text) VALUES
(1, 'What is the best programming language to learn first?'),
(3, 'Can you provide more resources on data science?');

INSERT INTO tasks (user_id, title, description, status, due_date) VALUES
(1, 'Complete programming assignment', 'Finish the assignment by end of the week.', 'pending', '2024-09-30'),
(3, 'Read data science articles', 'Read 5 articles on data analysis.', 'in_progress', '2024-09-25');

INSERT INTO employees (user_id, position, department, hire_date) VALUES
(2, 'Instructor', 'Computer Science', NOW()),
(4, 'Instructor', 'Web Development', NOW());

INSERT INTO projects (title, description, start_date, end_date) VALUES
('Online Learning Platform', 'Develop a new online learning platform.', NOW(), '2025-01-01'),
('Website Redesign', 'Redesign the company website.', NOW(), '2025-06-01');

INSERT INTO project_employees (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(2, 2);

INSERT INTO certifications (title, description, issued_by) VALUES
('Python Programming Certification', 'Certificate for completing Python programming course.', 'Guvi Zen'),
('Data Science Certification', 'Certificate for completing Data Science course.', 'Guvi Zen');

INSERT INTO user_certifications (user_id, certification_id) VALUES
(1, 1),
(3, 2);

INSERT INTO batches (course_id, start_date, end_date) VALUES
(1, '2024-10-01', '2024-12-01'),
(2, '2024-11-01', '2025-01-01');

INSERT INTO batch_enrollments (batch_id, user_id) VALUES
(1, 1),
(1, 3),
(2, 3);
