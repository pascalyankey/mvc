USE [master]
GO
/****** Object:  Database [CultuurHuisMVC]    Script Date: 10/12/2012 13:04:31 ******/
CREATE DATABASE [CultuurHuisMVC]

GO
ALTER DATABASE [CultuurHuisMVC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CultuurHuisMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CultuurHuisMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CultuurHuisMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CultuurHuisMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CultuurHuisMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CultuurHuisMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CultuurHuisMVC] SET  MULTI_USER 
GO
ALTER DATABASE [CultuurHuisMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CultuurHuisMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CultuurHuisMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CultuurHuisMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CultuurHuisMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CultuurHuisMVC] SET QUERY_STORE = OFF
GO
USE [CultuurHuisMVC]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CultuurHuisMVC]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 5/12/2018 9:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreNr] [int] NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Klanten]    Script Date: 5/12/2018 9:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klanten](
	[KlantNr] [int] IDENTITY(1,1) NOT NULL,
	[Voornaam] [nvarchar](50) NOT NULL,
	[Familienaam] [nvarchar](50) NOT NULL,
	[Straat] [nvarchar](50) NOT NULL,
	[HuisNr] [nvarchar](50) NOT NULL,
	[Postcode] [nvarchar](50) NOT NULL,
	[Gemeente] [nvarchar](50) NOT NULL,
	[GebruikersNaam] [nvarchar](50) NOT NULL,
	[Paswoord] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Klanten] PRIMARY KEY CLUSTERED 
(
	[KlantNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservaties]    Script Date: 5/12/2018 9:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaties](
	[ReservatieNr] [int] IDENTITY(1,1) NOT NULL,
	[KlantNr] [int] NOT NULL,
	[VoorstellingsNr] [int] NOT NULL,
	[Plaatsen] [smallint] NOT NULL,
 CONSTRAINT [PK_Reservaties] PRIMARY KEY CLUSTERED 
(
	[ReservatieNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voorstellingen]    Script Date: 5/12/2018 9:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voorstellingen](
	[VoorstellingsNr] [int] NOT NULL,
	[Titel] [nvarchar](50) NOT NULL,
	[Uitvoerders] [nvarchar](50) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[GenreNr] [int] NOT NULL,
	[Prijs] [money] NOT NULL,
	[VrijePlaatsen] [smallint] NOT NULL,
 CONSTRAINT [PK_Voorstellingen] PRIMARY KEY CLUSTERED 
(
	[VoorstellingsNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (1, N'Humor')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (2, N'Theater')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (3, N'Muziek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (4, N'Wereldmuziek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (5, N'Familie')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (6, N'Dans')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (7, N'Multimedia')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (8, N'Modern klassiek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (9, N'Muziektheater')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (10, N'Circustheater')
SET IDENTITY_INSERT [dbo].[Klanten] ON 

INSERT [dbo].[Klanten] ([KlantNr], [Voornaam], [Familienaam], [Straat], [HuisNr], [Postcode], [Gemeente], [GebruikersNaam], [Paswoord]) VALUES (1, N'Hans', N'Desmet', N'Keizerslaan', N'7', N'1000', N'Brussel', N'hans', N'bolle')
INSERT [dbo].[Klanten] ([KlantNr], [Voornaam], [Familienaam], [Straat], [HuisNr], [Postcode], [Gemeente], [GebruikersNaam], [Paswoord]) VALUES (2, N'Alexandra', N'Blondeel', N'Anspachlaan', N'65', N'1000', N'Brussel', N'alexandra', N'belle')
SET IDENTITY_INSERT [dbo].[Klanten] OFF
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (1, N'Rechtstreeks & integraal/Ka-Boom!', N'Neveneffecten / Alex Agnew', CAST(N'2019-10-06T20:00:00.000' AS DateTime), 1, 5.0000, 0)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (2, N'De leeuw van Vlaanderen', N'Union Suspecte / Publiekstheater', CAST(N'2019-10-07T20:00:00.000' AS DateTime), 2, 7.0000, 141)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (3, N'Ano Neko', N'Dobet Gnahoré', CAST(N'2019-10-08T20:00:00.000' AS DateTime), 4, 6.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (4, N'Professor Bernhardi', N'de Roovers', CAST(N'2019-10-09T20:00:00.000' AS DateTime), 2, 7.5000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (5, N'Ich bin wie du', N'het Toneelhuis', CAST(N'2019-10-10T20:00:00.000' AS DateTime), 2, 7.0000, 150)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (6, N'Randschade', N'fABULEUS', CAST(N'2019-10-11T20:00:00.000' AS DateTime), 5, 6.0000, 199)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (7, N'Koning Lear', N'Tonic', CAST(N'2019-10-12T20:00:00.000' AS DateTime), 2, 7.0000, 170)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (8, N'Van alle landen thuis', N'Els Helewaut,D.Van Esbroeck & co', CAST(N'2019-10-13T20:00:00.000' AS DateTime), 3, 5.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (9, N'Ma - Earth', N'Akram Khan', CAST(N'2019-10-14T20:00:00.000' AS DateTime), 6, 8.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (10, N'Jerusalem', N'Berlin', CAST(N'2019-10-15T20:00:00.000' AS DateTime), 7, 7.5000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (11, N'De fijnste dagen van het jaar', N'Het Paleis/Jenny', CAST(N'2019-10-16T20:00:00.000' AS DateTime), 5, 4.0000, 168)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (12, N'Cancion de un amorio', N'Bodicxhel', CAST(N'2019-10-17T20:00:00.000' AS DateTime), 4, 6.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (13, N'Moest ik van u zijn', N'Wouter Deprez  ', CAST(N'2019-10-18T20:00:00.000' AS DateTime), 1, 6.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (14, N'Poézique cabaret', N'La compagnie du chien qui tousse', CAST(N'2019-10-19T20:00:00.000' AS DateTime), 1, 6.5000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (15, N'Eekhoornbrood', N'Lampe', CAST(N'2019-10-20T20:00:00.000' AS DateTime), 2, 5.5000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (16, N'Liederen v. Baert, Debussy, Chausson, Weill', N'Bernard Baert & Anna Pardon', CAST(N'2019-10-21T20:00:00.000' AS DateTime), 8, 8.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (17, N'L"Hafa', N'Union Suspecte', CAST(N'2019-10-22T20:00:00.000' AS DateTime), 2, 7.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (18, N'Achter ''t eten', N'Ceremonia/Het muziek Lod/Theater Zuidpool', CAST(N'2019-10-23T20:00:00.000' AS DateTime), 3, 6.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (19, N'Poulenc / Stravinsky', N'Prometheus Ensemble', CAST(N'2019-10-24T20:00:00.000' AS DateTime), 8, 8.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (20, N'Lied der rusteloosheid', N'Eva De Roovere, Pedro Moutinho & G. de Mol', CAST(N'2019-10-25T20:00:00.000' AS DateTime), 4, 7.0000, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (21, N'Wilde dingen', N'Kopergietery    ', CAST(N'2019-10-26T20:00:00.000' AS DateTime), 5, 5.0000, 196)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (22, N'Licht', N'Bos', CAST(N'2019-10-27T20:00:00.000' AS DateTime), 7, 6.0000, 94)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (23, N'Een hond in de nacht', N'Speeltheater Holland', CAST(N'2019-10-28T20:00:00.000' AS DateTime), 5, 6.0000, 0)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (24, N'Gloed', N'theater Malpertuis', CAST(N'2019-10-29T20:00:00.000' AS DateTime), 2, 7.0000, 196)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (25, N'To speak or not to speak', N'Spectra Ensemble', CAST(N'2019-10-30T20:00:00.000' AS DateTime), 8, 8.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (26, N'Tres cultures por la paz', N'Rosa Zaragoza', CAST(N'2019-10-31T20:00:00.000' AS DateTime), 4, 7.2500, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (27, N'Zouff!', N'Les Argonautes', CAST(N'2019-11-01T20:00:00.000' AS DateTime), 10, 5.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (28, N'La cucina dell"arte ', N'David & Danny Ronaldo', CAST(N'2019-11-02T20:00:00.000' AS DateTime), 10, 6.0000, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (29, N'Speelt Rzewski', N'Frederic Rzewski', CAST(N'2019-11-03T20:00:00.000' AS DateTime), 8, 8.0000, 160)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (30, N'Tv-tunes K.N.T.', N'Wim Opbrouck & Maandacht', CAST(N'2019-11-04T20:00:00.000' AS DateTime), 3, 7.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (31, N'Schone woorden klinken zo...', N'Warre Borgmans & Jokke Schreurs', CAST(N'2019-11-05T20:00:00.000' AS DateTime), 3, 6.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (32, N'White Light White Heat - The Velvet Undergr.', N'Bea Van der Maat & Dr Kloot Per W', CAST(N'2019-11-06T20:00:00.000' AS DateTime), 3, 5.5000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (33, N'Het gaat toch rap', N'Raf Coppens', CAST(N'2019-11-07T20:00:00.000' AS DateTime), 1, 6.0000, 170)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (34, N'Emilia Galotti', N'Tijd', CAST(N'2019-11-08T20:00:00.000' AS DateTime), 2, 7.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (35, N'Iets over de liefde', N'theater Malpertuis', CAST(N'2019-11-09T20:00:00.000' AS DateTime), 2, 6.0000, 160)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (36, N'Hendrickx, Xenakis & Tan Dun', N'Spiegel Strijkkwartet', CAST(N'2019-11-10T20:00:00.000' AS DateTime), 8, 7.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (37, N'Cry like a man, part 2', N'J. Blaute, Paul Michiels & Roland', CAST(N'2019-11-11T20:00:00.000' AS DateTime), 3, 6.0000, 8)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (38, N'De Kreutzersonates', N'Het Net', CAST(N'2019-11-12T20:00:00.000' AS DateTime), 2, 7.0000, 100)
ALTER TABLE [dbo].[Reservaties]  WITH CHECK ADD  CONSTRAINT [FK_Reservaties_Klanten] FOREIGN KEY([KlantNr])
REFERENCES [dbo].[Klanten] ([KlantNr])
GO
ALTER TABLE [dbo].[Reservaties] CHECK CONSTRAINT [FK_Reservaties_Klanten]
GO
ALTER TABLE [dbo].[Reservaties]  WITH CHECK ADD  CONSTRAINT [FK_Reservaties_Voorstellingen] FOREIGN KEY([VoorstellingsNr])
REFERENCES [dbo].[Voorstellingen] ([VoorstellingsNr])
GO
ALTER TABLE [dbo].[Reservaties] CHECK CONSTRAINT [FK_Reservaties_Voorstellingen]
GO
ALTER TABLE [dbo].[Voorstellingen]  WITH CHECK ADD  CONSTRAINT [FK_Voorstellingen_Genres] FOREIGN KEY([GenreNr])
REFERENCES [dbo].[Genres] ([GenreNr])
GO
ALTER TABLE [dbo].[Voorstellingen] CHECK CONSTRAINT [FK_Voorstellingen_Genres]
GO
USE [master]
GO
ALTER DATABASE [CultuurHuisMVC] SET  READ_WRITE 
GO
