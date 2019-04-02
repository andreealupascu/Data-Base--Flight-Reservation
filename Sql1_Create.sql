CREATE DATABASE Rezervari_Zboruri
GO

USE Rezervari_Zboruri
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Pasager]')
and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Pasager]
GO
CREATE TABLE Pasager (
Id_Pasager int PRIMARY KEY IDENTITY,
CNP varchar(13) NOT NULL,
Nume varchar(20) NOT NULL,
Prenume varchar(20) NOT NULL,
Data_nasterii date,
Sex varchar(10) NOT NULL,
Nationalitate varchar(20) NOT NULL
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bilet]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Bilet]
GO
CREATE TABLE Bilet (
IdBilet int PRIMARY KEY IDENTITY,
Id_Pasager int,
Id_Zbor int,
Id_Loc int NOT NULL,
Id_Bagaje int NOT NULL,
Pret_Bilet decimal,
Data_Cumpararii date
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zbor]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Zbor]
GO
CREATE TABLE Zbor (
Id_Zbor int PRIMARY KEY IDENTITY,
Id_Companie int NOT NULL,
Id_Sursa int NOT NULL,
Id_Destinatie int NOT NULL,
Id_Avion int not null,
Data_decolarii date,
Ora_decolarii decimal,
Ora_sosirii decimal
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Locatie]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Locatie]
GO
CREATE TABLE Locatie (
Id_Locatie int PRIMARY KEY IDENTITY,
Oras varchar(10) Not null,
Tara varchar(10) NOT null
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Locatie_Companie]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Locatie_Companie]
GO
CREATE TABLE Locatie_Companie (
Id_Loc_Comp int PRIMARY KEY IDENTITY,
Id_Locatie int Not null,
Id_Companie int NOT null
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bagaje]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Bagaje]
GO
CREATE TABLE Bagaje (
Id_Bagaje int PRIMARY KEY IDENTITY,
Tip_Bagaj varchar(10) Not null,
Pret_Bagaj decimal
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Loc]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Loc]
GO
CREATE TABLE Loc (
Id_Loc int PRIMARY KEY IDENTITY,
Tip_Loc varchar(10) Not null,
Pret_Loc decimal
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Companie_Aeriana]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Companie_Aeriana]
GO
CREATE TABLE Companie_Aeriana (
Id_Companie int PRIMARY KEY IDENTITY,
Nume_Companie varchar(10) Not null,
Tara_Companie varchar(10) NOT null
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Avion]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Avion]
GO
CREATE TABLE Avion (
Id_Avion int PRIMARY KEY IDENTITY,
Id_Marca int Not null,
Id_Companie int NOT null
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Avion_Marca]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Avion_Marca]
GO
CREATE TABLE Avion_Marca (
Id_Marca int PRIMARY KEY IDENTITY,
Denumire_Marca varchar(10) Not null,
Productie varchar(10) NOT null,
Nr_Locuri int
)
GO
