USE [barksoft_aeriesdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ----------------------------------------------------------------------------------------------------
-- Student Table
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE [Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [nvarchar](10) NULL,
	[StudentId] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](40) NULL,
	[FirstName] [nvarchar](60) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](60) NULL,
	[State] [nvarchar](40) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Student] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [Student] ADD  DEFAULT ((0)) FOR [Deleted]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IDX_Student_StudentId] ON [Student]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

insert	Student (SchoolCode, StudentId, LastName, FirstName, Address, City, State, ZipCode)
values	('994','99400001','Abbott','Allan','1118 Glenview Lane','Eagle Rock','CA','99999'),
		('994','99400011','Abrahamson','Arnold','1126 E Walton Rd.','Eagle Rock','CA','99999'),
		('994','99400012','Abrego','Alice','115 W Norgate St','Eagle Rock','CA','99999'),
		('994','99400013','Abrego','Ivette','13642 Green Valley B','Eagle Rock','CA','99999'),
		('994','99400014','AbuJohn','Edgar','1123 N Barston Ave','Eagle Rock','CA','99999'),
		('994','99400015','Aceves','Steven','1110 Avenida Loma Vista','Eagle Rock','CA','99999')
;

-- ----------------------------------------------------------------------------------------------------
-- Contact Table
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE [Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](40) NULL,
	[FirstName] [nvarchar](60) NULL,
	[Relationship] [nvarchar](40) NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[Mobile] [nvarchar](40) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](60) NULL,
	[State] [nvarchar](40) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Contact] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [Contact] ADD  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Student] FOREIGN KEY([StudentId])
REFERENCES [Student] ([StudentId])
GO

ALTER TABLE [Contact] CHECK CONSTRAINT [FK_Contact_Student]
GO

CREATE NONCLUSTERED INDEX [IDX_Contact_StudentId] ON [Contact]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

insert	Contact (StudentId, LastName, FirstName, Relationship, EmailAddress, Mobile, Address, City, State, Zipcode)
values	('99400001','Abbott','Sara','Mother','sara@example.com','949-123-45678','1118 Glenview Lane','Eagle Rock','CA','99999'),
		('99400001','Abbott','Adam','Father','adam@example.com','949-123-45679','1118 Glenview Lane','Eagle Rock','CA','99999'),
		('99400011','Abrahamson','Jonathan','Uncle','jonathan@example.com','949-234-4567','1126 E Walton Rd.','Eagle Rock','CA','99999'),
		('99400012','Acosta','Christine','Mother','christine@example.com','949-345-6789','115 W Norgate St','Eagle Rock','CA','99999'),
		('99400013','Abrego','Rezvan','Father','rezvan@example.com','949-456-7891','13642 Green Valley B','Eagle Rock','CA','99999'),
		('99400014','AbuJohn','Selina','Mother','selina@example.com','949-567-8912','1123 N Barston Ave','Eagle Rock','CA','99999'),
		('99400015','Aceves','Jacob','Father','jacob@example.com','949-678-9123','1110 Avenida Loma Vista','Eagle Rock','CA','99999')
;