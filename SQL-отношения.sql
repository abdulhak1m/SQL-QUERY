USE db2
GO
-- �������� ������ ������� [BlogUser]
CREATE TABLE [BlogUser]
(
	[UserLogin]         VARCHAR(150)     NOT NULL,
	[Password]          VARCHAR(150)     NOT NULL,
	[Name]              NVARCHAR(250)    NOT NULL,
	[Surname]           NVARCHAR(250)    NOT NULL,
	[Patronymic]        NVARCHAR(250)    NULL,
	[Email]				VARCHAR(250)	 NOT NULL,
	[RegistrationDate]  DATETIME         NOT NULL 
)
GO
-- ������� ����������� ��� �������� RegistrationDate, ����� ������� ���������� �� ���������
ALTER TABLE [BlogUser]
ADD CONSTRAINT [DF_BlogUser_RegistrationDate] DEFAULT (GETDATE()) FOR [RegistrationDate]
GO
-- ������� ����������� ��� ������� UserLogin, ����������� ������������
ALTER TABLE [BlogUser]
ADD CONSTRAINT DF_BlogUser_UserLogin_Unique UNIQUE (UserLogin)
GO
-- ������� ����������� ��� ������ Email, ����������� ������������
ALTER TABLE [BlogUser]
ADD CONSTRAINT DF_BlogUser_Email_Unique UNIQUE (Email)
GO
-- ������� �٨ ���� �������, ��� ����� ��� ����������� ���� (������������� ������)
ALTER TABLE [BlogUser]
ADD [UserId] INT IDENTITY (1,1)
GO
-- ������� ��� ������������� '��������� ������'
ALTER TABLE [BlogUser]
ADD CONSTRAINT PK_BlogUser_UserId PRIMARY KEY CLUSTERED (UserId)
GO

-- DROP TABLE [BlogUser]

-- ������� ��������� ������� ������� � �� ��������� ������� ������
-- TRUNCATE TABLE [BlogUser]
-- GO

-- ������� ������ ������� [Blog]
CREATE TABLE [Blog]
(
	[BlogId]		INT IDENTITY  (1,1),
	[Name]			NVARCHAR(250) NOT NULL,
	[Discription]	NVARCHAR(250) NOT NULL,
	[CreateDate]	DATETIME	  NOT NULL
)
GO
-- ������ ��� ������������� - ��������� ������
ALTER TABLE [Blog]
ADD CONSTRAINT PK_Blog_BlogId PRIMARY KEY CLUSTERED (BlogId)
GO
-- ��������� ����������� ������� CreateDate, ����� ���� ��������� �� ���������
ALTER TABLE [Blog]
ADD CONSTRAINT DF_Blog_CreateDate_Default DEFAULT (GETDATE()) FOR CreateDate
GO
-- ��������� �٨ ���� ������� ��� ������ ����� � ���������� �������������
ALTER TABLE [Blog]
ADD [UserId] INT NULL
GO

-- ������ ��� ����������� ������� ������������
ALTER TABLE [Blog]
ALTER COLUMN [UserId] INT NOT NULL
GO

-- ����� ����, ��� �� ������� ������ �� �����������, ���� ������� �������
ALTER TABLE [Blog]
WITH CHECK ADD CONSTRAINT FK_Blog_BlogUser FOREIGN KEY (UserId)
REFERENCES BlogUser (UserId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
