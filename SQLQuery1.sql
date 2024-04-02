
USE education_platform

CREATE TABLE Roles(
	role_id INT PRIMARY KEY IDENTITY(0, 1),
	[role] NVARCHAR(50)
)

CREATE TABLE [user](
	[user_id] INT PRIMARY KEY IDENTITY(0, 1),
	name NVARCHAR(30),
	age INT,
	lastname NVARCHAR(30),
	surname NVARCHAR(30),
	username NVARCHAR(30),
	[password] NVARCHAR(30),
	email NVARCHAR(30)
)


CREATE TABLE User_Role(
	[role_id] INT FOREIGN KEY(role_id) REFERENCES roles,
	[user_id] INT FOREIGN KEY([user_id]) REFERENCES [user],

)

CREATE TABLE School(

	school_id INT PRIMARY KEY IDENTITY(0, 1),
	[address] NVARCHAR(50),
	[name] NVARCHAR(50)
)


CREATE TABLE Parent(
	parent_id INT PRIMARY KEY IDENTITY(0, 1),
	[user_id] INT FOREIGN KEY([user_id]) REFERENCES [user]
)


CREATE TABLE Student(
	student_id INT PRIMARY KEY IDENTITY(0, 1),
	[user_id] INT FOREIGN KEY([user_id]) REFERENCES [user]
)


CREATE TABLE ParentStudent(
	ParentStudent_id INT PRIMARY KEY IDENTITY(1, 1),
	parent_id INT FOREIGN KEY(parent_id) REFERENCES Parent,
	student_id INT FOREIGN KEY(student_id) REFERENCES Student
)


CREATE TABLE [Admin](
	admin_id INT PRIMARY KEY IDENTITY(0, 1),
	[user_id] INT FOREIGN KEY([user_id]) REFERENCES [user],
	[school_id] INT FOREIGN KEY([school_id]) REFERENCES [School]

)

CREATE TABLE Teacher(
	teacher_id INT PRIMARY KEY IDENTITY(0, 1),
	[school_id] INT FOREIGN KEY([school_id]) REFERENCES [School],
	[user_id] INT FOREIGN KEY([user_id]) REFERENCES [user]
)

CREATE TABLE specialities(
	speciality_id INT PRIMARY KEY IDENTITY(0, 1),
	speciaality NVARCHAR(50)
)


CREATE TABLE Classes(
	class_id INT PRIMARY KEY IDENTITY(0, 1),
	number INT CHECK(1 <= number AND number <= 11),
	[signature] NVARCHAR(1),
	school_id INT FOREIGN KEY(school_id) REFERENCES School
)



CREATE TABLE SpecialityTeacher(

	SpecialityTeacher_id INT PRIMARY KEY IDENTITY(1, 1),
	speciality_id INT FOREIGN KEY(speciality_id) REFERENCES Specialities,
	teacher_id INT FOREIGN KEY(teacher_id) REFERENCES Teacher
)



CREATE TABLE ClassStudent(
	ClassStudent_id INT PRIMARY KEY IDENTITY(1, 1),
	class_id INT FOREIGN KEY(class_id) REFERENCES Classes,
	student_id INT FOREIGN KEY(student_id) REFERENCES Student
)
