
create table Pizzeria
(
	[Id] int identity(1,1) Primary key,
	[PizzeriaName] nvarchar(2000),
	[PizzeriaTagLine] nvarchar(max) null,
	[LocationId] int,
	 CONSTRAINT FK_LocationId FOREIGN KEY ([LocationId])
	  REFERENCES [Location] (id)
)

-- sample data
insert into Pizzeria ( PizzeriaName, PizzeriaTagLine, LocationId)
values ('Preston Pizzeria','We deliver best food',1);

insert into Pizzeria ( PizzeriaName, PizzeriaTagLine, LocationId)
values ('Southbank Pizzeria','We have best pizzas',2);

----------------- Pizzeria Menu

create table PizzeriaMenus
(
	[Id] int identity(1,1) Primary key,
	[Name] nvarchar(2000),
	[MenuIngridients] nvarchar(max),
	[Price] decimal,
	[PizzeriaId] int,
		 CONSTRAINT FK_PizzeriaId FOREIGN KEY ([PizzeriaId])
	  REFERENCES [Pizzeria] (id)
);

select * from Pizzeria;
select * from PizzeriaMenus
insert into PizzeriaMenus ([Name], [MenuIngridients],[Price],[PizzeriaId])
values ('Capricciosa','Cheese, Ham, Mushrooms, Olives',25.0,1);

insert into PizzeriaMenus ([Name], [MenuIngridients],[Price],[PizzeriaId])
values ('Vegetarian','Cheese, Mushrooms, Capsicum, Onion, Olives',17.0,1);


create table Toppings
(
	[Id] int identity(1,1) Primary key,
	[Name] nvarchar(2000),
	[Price] decimal
)

------
insert into Toppings(Name, Price)
values ('Cheese',1)

insert into Toppings(Name, Price)
values ('Capsicum,',1)

insert into Toppings(Name, Price)
values ('Salami,,',1)

insert into Toppings(Name, Price)
values ('Olives,,',1)


USE [PizzeriaDB]
GO

/****** Object:  Table [dbo].[Location]    Script Date: 4/19/2023 9:42:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](2000) NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO

