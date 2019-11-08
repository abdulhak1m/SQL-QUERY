USE db2
GO
-- янгдюмхе оепбни рюакхжш [BlogUser]
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
-- днаюбхл нцпюмхвемхе дкъ ярнкаюжю RegistrationDate, врнаш гмювмхъ гюмняхкхяэ он слнквюмхч
ALTER TABLE [BlogUser]
ADD CONSTRAINT [DF_BlogUser_RegistrationDate] DEFAULT (GETDATE()) FOR [RegistrationDate]
GO
-- днаюбхл нцпюмхвемхе дкъ ярнкажю UserLogin, нцпюмхвемхе смхйюкэмнярх
ALTER TABLE [BlogUser]
ADD CONSTRAINT DF_BlogUser_UserLogin_Unique UNIQUE (UserLogin)
GO
-- днаюбхл нцпюмхвемхъ дкъ ярнажю Email, нцпюмхвемхе смхйюкэмнярх
ALTER TABLE [BlogUser]
ADD CONSTRAINT DF_BlogUser_Email_Unique UNIQUE (Email)
GO
-- днаюбхл еы╗ ндхм ярнкаеж, щрн асдер мюь ясппнцюрмши йкчв (хдемрхтхйюрнп гюохях)
ALTER TABLE [BlogUser]
ADD [UserId] INT IDENTITY (1,1)
GO
-- ядекюел мюь хдемрхтхйюрнп 'оепбхвмшл йкчвнл'
ALTER TABLE [BlogUser]
ADD CONSTRAINT PK_BlogUser_UserId PRIMARY KEY CLUSTERED (UserId)
GO

-- DROP TABLE [BlogUser]

-- йнлюмдю онкмнярэч нвхыюер рюакхжс х ме нярюбкъер мхйюйху якеднб
-- TRUNCATE TABLE [BlogUser]
-- GO

-- янгдю╗л брнпсч рюакхжс [Blog]
CREATE TABLE [Blog]
(
	[BlogId]		INT IDENTITY  (1,1),
	[Name]			NVARCHAR(250) NOT NULL,
	[Discription]	NVARCHAR(250) NOT NULL,
	[CreateDate]	DATETIME	  NOT NULL
)
GO
-- декюел мюь хдемрхтхйюрнп - оепбхвмшл йкчвнл
ALTER TABLE [Blog]
ADD CONSTRAINT PK_Blog_BlogId PRIMARY KEY CLUSTERED (BlogId)
GO
-- днаюбкъел нцпюмхвемхе ярнкажс CreateDate, врнаш дюрю ббндхкюяэ он слнквюмхч
ALTER TABLE [Blog]
ADD CONSTRAINT DF_Blog_CreateDate_Default DEFAULT (GETDATE()) FOR CreateDate
GO
-- днаюбкъел еы╗ ндхм ярнкаеж дкъ ябъгйх акнцю я йнмйпермшл онкэгнбюрекел
ALTER TABLE [Blog]
ADD [UserId] INT NULL
GO

-- декюел мюь днаюбкеммши ярнкаеж наъгюрекэмшл
ALTER TABLE [Blog]
ALTER COLUMN [UserId] INT NOT NULL
GO

-- оняке рнцн, йюй лш янгдюкх яяшкйс мю онкэгнбрекъ, мюдн ябъгюрэ рюакхжш
ALTER TABLE [Blog]
WITH CHECK ADD CONSTRAINT FK_Blog_BlogUser FOREIGN KEY (UserId)
REFERENCES BlogUser (UserId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
