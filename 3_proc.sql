USE education_platform

GO
CREATE PROCEDURE GetUserRoles
	@user_id INT
AS
BEGIN
SELECT [role] FROM Roles WHERE [role_id] = @user_id
END
