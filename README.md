# Guvi Zen


## Features

- **User Management**: Supports multiple user roles (students, instructors, admins).
- **Course Management**: Create and manage courses, lessons, and assessments.
- **Enrollment Tracking**: Users can enroll in courses and track their progress.
- **Feedback System**: Users can provide feedback on courses and lessons.
- **Query Handling**: Users can submit queries related to courses.
- **Task Management**: Allows users to manage tasks associated with their learning.
- **Employee Management**: Tracks instructors and their respective courses.
- **Project Management**: Supports project creation and assignment of employees to projects.
- **Certification Management**: Allows users to earn certifications for completed courses.
- **Batch Management**: Manage batches for courses and enroll users in specific batches.

## Database Schema

The database schema consists of the following tables:

- **users**: Stores user profiles and roles.
- **courses**: Contains course details and instructor information.
- **enrollments**: Tracks which users are enrolled in which courses.
- **lessons**: Stores information about lessons within courses.
- **assessments**: Contains assessments related to courses.
- **user_assessments**: Tracks user performance on assessments.
- **feedback**: Allows users to leave feedback on courses and lessons.
- **queries**: Stores user queries regarding courses.
- **tasks**: Manages tasks assigned to users.
- **employees**: Records details of instructors.
- **projects**: Contains information about various projects.
- **project_employees**: Links employees to projects.
- **certifications**: Tracks certifications offered on the platform.
- **user_certifications**: Records which users have received which certifications.
- **batches**: Manages course batches.
- **batch_enrollments**: Links users to specific batches they are enrolled in.
