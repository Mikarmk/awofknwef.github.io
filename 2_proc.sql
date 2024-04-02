USE education_platform

GO
CREATE PROCEDURE GetSchoolName
	@school_id INT
AS
BEGIN
SELECT [name] FROM School WHERE @school_id = school_id
END