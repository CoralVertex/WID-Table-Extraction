USE [master]
GO
/****** Object:  Database [WID30]    Script Date: 8/11/2022 7:36:23 AM ******/
CREATE DATABASE [WID30]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WID30', FILENAME = N'R:\Data\User\WID30.mdf' , SIZE = 1630400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WID30_log', FILENAME = N'U:\TLog\User\WID30_log.ldf' , SIZE = 932672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WID30] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WID30].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WID30] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WID30] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WID30] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WID30] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WID30] SET ARITHABORT OFF 
GO
ALTER DATABASE [WID30] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WID30] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WID30] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WID30] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WID30] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WID30] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WID30] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WID30] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WID30] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WID30] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WID30] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WID30] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WID30] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WID30] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WID30] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WID30] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WID30] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WID30] SET RECOVERY FULL 
GO
ALTER DATABASE [WID30] SET  MULTI_USER 
GO
ALTER DATABASE [WID30] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WID30] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WID30] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WID30] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WID30] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WID30', N'ON'
GO
USE [WID30]
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AddressType](
	[addresstype] [char](1) NOT NULL,
	[addresdesc] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[addresstype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgeGroups]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AgeGroups](
	[AgeGroupType] [char](2) NOT NULL,
	[AgeGroup] [char](2) NOT NULL,
	[AgeGroupDesc] [char](20) NULL,
 CONSTRAINT [PK_AGEGROUPS] PRIMARY KEY CLUSTERED 
(
	[AgeGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgeGroupTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AgeGroupTypes](
	[AgeGroupType] [char](2) NOT NULL,
	[SourceCategory] [char](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgeGroupType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AnnualSalesCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AnnualSalesCodes](
	[AnnSalesCode] [char](1) NOT NULL,
	[AnnSalesDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnnSalesCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AnnualSalesRanges]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AnnualSalesRanges](
	[AnnSalesRange] [char](2) NOT NULL,
	[AnnRangeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnnSalesRange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AreaType](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](3) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[AreaTypeName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_AREATYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BED]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BED](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[Adjusted] [char](1) NOT NULL,
	[BEDTypeCode] [char](1) NOT NULL,
	[BEDEmp] [numeric](12, 0) NULL,
	[BEDEmpPercent] [numeric](4, 1) NULL,
	[BEDEstabs] [numeric](12, 0) NULL,
	[BEDEstabPercent] [numeric](4, 1) NULL,
	[Suppress] [char](1) NOT NULL,
 CONSTRAINT [PK_BED] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[Adjusted] ASC,
	[BEDTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BEDTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BEDTypes](
	[BEDTypeCode] [char](1) NOT NULL,
	[BEDTypeDesc] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[BEDTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Benchmark]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Benchmark](
	[Benchmark] [char](4) NOT NULL,
	[BenchmarkDesc] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[Benchmark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Benefit](
	[StFips] [char](2) NOT NULL,
	[Benefit] [char](1) NOT NULL,
	[BenefitDesc] [varchar](40) NULL,
 CONSTRAINT [PK_BENEFIT] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[Benefit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BLSEducation]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BLSEducation](
	[EduCategory] [char](1) NOT NULL,
	[EducationDesc] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[EduCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BLSTrainingCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BLSTrainingCodes](
	[TrainingCode] [char](1) NOT NULL,
	[TrainingDesc] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuildingPermits]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BuildingPermits](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[UnitType] [char](2) NOT NULL,
	[Units] [numeric](7, 0) NULL,
	[UnitCost] [numeric](12, 0) NULL,
 CONSTRAINT [PK_BUILDINGPERMITS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[UnitType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CareerClusters]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CareerClusters](
	[ClusterCode] [char](2) NOT NULL,
	[ClusterTitle] [varchar](80) NOT NULL,
	[ClusterDesc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClusterCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CareerPaths]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CareerPaths](
	[PathCode] [char](2) NOT NULL,
	[PathTitle] [varchar](115) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CES]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CES](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[SeriesCode] [char](8) NOT NULL,
	[Adjusted] [char](1) NOT NULL,
	[Benchmark] [char](4) NOT NULL,
	[Prelim] [char](1) NOT NULL,
	[EmpCES] [numeric](9, 0) NULL,
	[EmpProductionWorkers] [numeric](9, 0) NULL,
	[EmpFemale] [numeric](9, 0) NULL,
	[HoursPerWeek] [numeric](3, 1) NULL,
	[EarningsPerWeek] [numeric](8, 2) NULL,
	[EarningsPerHour] [numeric](6, 2) NULL,
	[SuppRecord] [char](1) NOT NULL,
	[SuppHE] [char](1) NOT NULL,
	[SuppPW] [char](1) NOT NULL,
	[SuppFem] [char](1) NOT NULL,
	[HoursAllWorkers] [numeric](3, 1) NULL,
	[EarningsAllWorkers] [numeric](8, 2) NULL,
	[HourlyEarningsAllWorkers] [numeric](6, 2) NULL,
	[SuppHEAllWrkr] [char](1) NOT NULL,
 CONSTRAINT [PK_CES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[SeriesCode] ASC,
	[Adjusted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CESCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CESCode](
	[stfips] [char](2) NOT NULL,
	[seriescode] [char](8) NOT NULL,
	[seriesdesc] [varchar](max) NULL,
	[seriestitles] [varchar](75) NULL,
	[seriestitle] [varchar](200) NULL,
	[serieslevel] [char](1) NULL,
 CONSTRAINT [PK_CESCODE] PRIMARY KEY CLUSTERED 
(
	[stfips] ASC,
	[seriescode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CIPCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CIPCode](
	[cipcode] [char](10) NOT NULL,
	[cipcodetype] [char](2) NOT NULL,
	[ciptitle] [varchar](200) NOT NULL,
	[cipdesc] [varchar](max) NULL,
	[ciptitleshort] [varchar](75) NULL,
	[ciplevel] [char](1) NULL,
 CONSTRAINT [PK_CIPCODE] PRIMARY KEY CLUSTERED 
(
	[cipcode] ASC,
	[cipcodetype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassTime]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ClassTime](
	[ClassTime] [char](1) NOT NULL,
	[ClassTimeTitle] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClusterCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ClusterCode](
	[StFips] [char](2) NOT NULL,
	[ClusterCode] [char](10) NOT NULL,
	[ClusterTitle] [varchar](60) NOT NULL,
	[ClusterDesc] [varchar](max) NULL,
 CONSTRAINT [PK_CLUSTERCODE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[ClusterCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClusterXOcc]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ClusterXOcc](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[ClusterCode] [char](10) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[Allocation] [numeric](5, 2) NULL,
 CONSTRAINT [PK_CLUSTERXOCC] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[ClusterCode] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClusterXSupply]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ClusterXSupply](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[ClusterCode] [char](10) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CompleterType] [char](2) NOT NULL,
 CONSTRAINT [PK_CLUSTERXSUPPLY] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[ClusterCode] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CompleterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commute]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Commute](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[WorkStFips] [char](2) NOT NULL,
	[WorkAreaType] [char](2) NOT NULL,
	[WorkAreaTypeVersion] [char](3) NOT NULL,
	[WorkArea] [char](6) NOT NULL,
	[Workers] [numeric](8, 0) NULL,
 CONSTRAINT [PK_COMMUTE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[WorkStFips] ASC,
	[WorkAreaType] ASC,
	[WorkAreaTypeVersion] ASC,
	[WorkArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompleterType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CompleterType](
	[StFips] [char](2) NOT NULL,
	[CompleterType] [char](2) NOT NULL,
	[CompleterTitle] [varchar](40) NOT NULL,
	[CompleterDesc] [varchar](max) NULL,
 CONSTRAINT [PK_COMPLETERTYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CompleterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactProTitles]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ContactProTitles](
	[ContactProTitle] [char](3) NOT NULL,
	[ContactProDesc] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactProTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactTitle]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ContactTitle](
	[ContactTitleCode] [char](1) NOT NULL,
	[ContactTitleDesc] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactTitleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPI]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CPI](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[CPIType] [char](2) NOT NULL,
	[CPISource] [char](1) NOT NULL,
	[CPI] [numeric](8, 3) NULL,
	[PctChangeY2Y] [numeric](6, 1) NULL,
	[PctChangeM2M] [numeric](6, 1) NULL,
 CONSTRAINT [PK_CPI] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[CPIType] ASC,
	[CPISource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPIItems]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CPIItems](
	[CPIItem] [char](9) NOT NULL,
	[ItemDesc] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CPIItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPIPlus]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CPIPlus](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[Adjusted] [char](1) NOT NULL,
	[CPIIndex] [char](1) NOT NULL,
	[CPIItem] [char](9) NOT NULL,
	[CPISource] [char](1) NOT NULL,
	[Basis] [char](4) NOT NULL,
	[CPI] [numeric](8, 3) NULL,
	[PctChangeY2Y] [numeric](6, 1) NULL,
	[PctChangeM2M] [numeric](6, 1) NULL,
 CONSTRAINT [PK_CPIPLUS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[Adjusted] ASC,
	[CPIIndex] ASC,
	[CPIItem] ASC,
	[CPISource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPISource]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CPISource](
	[StFips] [char](2) NOT NULL,
	[CPISource] [char](1) NOT NULL,
	[CPISourceDesc] [varchar](40) NOT NULL,
 CONSTRAINT [PK_CPISOURCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CPISource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPIType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CPIType](
	[CPIType] [char](2) NOT NULL,
	[CPITitle] [varchar](55) NOT NULL,
	[CPIDesc] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CPIType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CreditCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CreditCode](
	[CreditCode] [char](1) NOT NULL,
	[CreditDesc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CreditCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Demographics]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Demographics](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[PopSource] [char](1) NOT NULL,
	[Population] [numeric](9, 0) NULL,
	[Female] [numeric](9, 0) NULL,
	[Male] [numeric](9, 0) NULL,
	[MedianAge] [numeric](4, 1) NULL,
	[MedianMale] [numeric](4, 1) NULL,
	[MedianFemale] [numeric](4, 1) NULL,
	[Totalunder5] [numeric](9, 0) NULL,
	[Femaleunder5] [numeric](9, 0) NULL,
	[Maleunder5] [numeric](9, 0) NULL,
	[Total5to9] [numeric](9, 0) NULL,
	[Female5to9] [numeric](9, 0) NULL,
	[Male5to9] [numeric](9, 0) NULL,
	[Total10to14] [numeric](9, 0) NULL,
	[Female10to14] [numeric](9, 0) NULL,
	[Male10to14] [numeric](9, 0) NULL,
	[Total15to19] [numeric](9, 0) NULL,
	[Female15to19] [numeric](9, 0) NULL,
	[Male15to19] [numeric](9, 0) NULL,
	[Total15to17] [numeric](9, 0) NULL,
	[Female15to17] [numeric](9, 0) NULL,
	[Male15to17] [numeric](9, 0) NULL,
	[Total18to19] [numeric](9, 0) NULL,
	[Female18to19] [numeric](9, 0) NULL,
	[Male18to19] [numeric](9, 0) NULL,
	[Total20to24] [numeric](9, 0) NULL,
	[Female20to24] [numeric](9, 0) NULL,
	[Male20to24] [numeric](9, 0) NULL,
	[Total20] [numeric](9, 0) NULL,
	[Female20] [numeric](9, 0) NULL,
	[Male20] [numeric](9, 0) NULL,
	[Total21] [numeric](9, 0) NULL,
	[Female21] [numeric](9, 0) NULL,
	[Male21] [numeric](9, 0) NULL,
	[Total22to24] [numeric](9, 0) NULL,
	[Female22to24] [numeric](9, 0) NULL,
	[Male22to24] [numeric](9, 0) NULL,
	[Total25to34] [numeric](9, 0) NULL,
	[Female25to34] [numeric](9, 0) NULL,
	[Male25to34] [numeric](9, 0) NULL,
	[Total25to29] [numeric](9, 0) NULL,
	[Female25to29] [numeric](9, 0) NULL,
	[Male25to29] [numeric](9, 0) NULL,
	[Total30to34] [numeric](9, 0) NULL,
	[Female30to34] [numeric](9, 0) NULL,
	[Male30to34] [numeric](9, 0) NULL,
	[Total35to44] [numeric](9, 0) NULL,
	[Female35to44] [numeric](9, 0) NULL,
	[Male35to44] [numeric](9, 0) NULL,
	[Total35to39] [numeric](9, 0) NULL,
	[Female35to39] [numeric](9, 0) NULL,
	[Male35to39] [numeric](9, 0) NULL,
	[Total40to44] [numeric](9, 0) NULL,
	[Female40to44] [numeric](9, 0) NULL,
	[Male40to44] [numeric](9, 0) NULL,
	[Total45to54] [numeric](9, 0) NULL,
	[Female45to54] [numeric](9, 0) NULL,
	[Male45to54] [numeric](9, 0) NULL,
	[Total45to49] [numeric](9, 0) NULL,
	[Female45to49] [numeric](9, 0) NULL,
	[Male45to49] [numeric](9, 0) NULL,
	[Total50to54] [numeric](9, 0) NULL,
	[Female50to54] [numeric](9, 0) NULL,
	[Male50to54] [numeric](9, 0) NULL,
	[Total55to59] [numeric](9, 0) NULL,
	[Female55to59] [numeric](9, 0) NULL,
	[Male55to59] [numeric](9, 0) NULL,
	[Total60to64] [numeric](9, 0) NULL,
	[Female60to64] [numeric](9, 0) NULL,
	[Male60to64] [numeric](9, 0) NULL,
	[Total60to61] [numeric](9, 0) NULL,
	[Female60to61] [numeric](9, 0) NULL,
	[Male60to61] [numeric](9, 0) NULL,
	[Total62to64] [numeric](9, 0) NULL,
	[Female62to64] [numeric](9, 0) NULL,
	[Male62to64] [numeric](9, 0) NULL,
	[Total65to69] [numeric](9, 0) NULL,
	[Female65to69] [numeric](9, 0) NULL,
	[Male65to69] [numeric](9, 0) NULL,
	[Total65to66] [numeric](9, 0) NULL,
	[Female65to66] [numeric](9, 0) NULL,
	[Male65to66] [numeric](9, 0) NULL,
	[Total67to69] [numeric](9, 0) NULL,
	[Female67to69] [numeric](9, 0) NULL,
	[Male67to69] [numeric](9, 0) NULL,
	[Total70to74] [numeric](9, 0) NULL,
	[Female70to74] [numeric](9, 0) NULL,
	[Male70to74] [numeric](9, 0) NULL,
	[Total75to84] [numeric](9, 0) NULL,
	[Female75to84] [numeric](9, 0) NULL,
	[Male75to84] [numeric](9, 0) NULL,
	[Total75to79] [numeric](9, 0) NULL,
	[Female75to79] [numeric](9, 0) NULL,
	[Male75to79] [numeric](9, 0) NULL,
	[Total80to84] [numeric](9, 0) NULL,
	[Female80to84] [numeric](9, 0) NULL,
	[Male80to84] [numeric](9, 0) NULL,
	[Total85xx] [numeric](9, 0) NULL,
	[Female85xx] [numeric](9, 0) NULL,
	[Male85xx] [numeric](9, 0) NULL,
	[Total18xx] [numeric](9, 0) NULL,
	[Female18xx] [numeric](9, 0) NULL,
	[Male18xx] [numeric](9, 0) NULL,
	[Total21xx] [numeric](9, 0) NULL,
	[Female21xx] [numeric](9, 0) NULL,
	[Male21xx] [numeric](9, 0) NULL,
	[Total62xx] [numeric](9, 0) NULL,
	[Female62xx] [numeric](9, 0) NULL,
	[Male62xx] [numeric](9, 0) NULL,
	[Onerace] [numeric](9, 0) NULL,
	[White] [numeric](9, 0) NULL,
	[Black] [numeric](9, 0) NULL,
	[NAAN] [numeric](9, 0) NULL,
	[Asian] [numeric](9, 0) NULL,
	[PacificIslander] [numeric](9, 0) NULL,
	[Other] [numeric](9, 0) NULL,
	[Twomoraces] [numeric](9, 0) NULL,
	[Hispanic] [numeric](9, 0) NULL,
	[Hispanicwhite] [numeric](9, 0) NULL,
	[Hispanicblack] [numeric](9, 0) NULL,
	[Hispanicnaan] [numeric](9, 0) NULL,
	[Hispanicasian] [numeric](9, 0) NULL,
	[Hispanicpacificisland] [numeric](9, 0) NULL,
	[Hispanicother] [numeric](9, 0) NULL,
	[Hispanic2moreraces] [numeric](9, 0) NULL,
 CONSTRAINT [PK_DEMOGRAPHICS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[PopSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EducationLevels]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EducationLevels](
	[EducationLevel] [char](1) NOT NULL,
	[EduLevelDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[EducationLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpDB]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EmpDB](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[UniqueID] [char](9) NOT NULL,
	[FEIN] [char](9) NULL,
	[LastUpdate] [char](6) NULL,
	[Name] [varchar](35) NULL,
	[AddressP] [varchar](40) NULL,
	[CityP] [varchar](30) NULL,
	[StateP] [char](2) NULL,
	[ZipCodeP] [char](5) NULL,
	[ZipPlusP] [char](4) NULL,
	[Latitude] [numeric](11, 6) NULL,
	[Longitude] [numeric](11, 6) NULL,
	[GeoPrecisionCode] [char](1) NULL,
	[CensusTract] [char](6) NULL,
	[CensusBlockGrp] [char](1) NULL,
	[AddressM] [varchar](40) NULL,
	[CityM] [varchar](30) NULL,
	[StateM] [char](2) NULL,
	[ZipCodeM] [char](5) NULL,
	[ZipPlusM] [char](4) NULL,
	[AddressL] [varchar](40) NULL,
	[CityL] [varchar](30) NULL,
	[StateL] [char](2) NULL,
	[ZipCodeL] [char](5) NULL,
	[ZipPlusL] [char](4) NULL,
	[TeleNum] [char](10) NULL,
	[ContactLastName] [varchar](30) NULL,
	[ContactFirstName] [varchar](30) NULL,
	[ContactTitle] [varchar](35) NULL,
	[ContactTitleCode] [char](1) NULL,
	[ContactProTitle] [char](3) NULL,
	[ContactGender] [char](1) NULL,
	[ContactEmail] [varchar](60) NULL,
	[TollFreeTele] [char](10) NULL,
	[FaxNumber] [char](10) NULL,
	[WebURL] [varchar](40) NULL,
	[BusinessDesc] [varchar](45) NULL,
	[PrimarySIC] [char](6) NULL,
	[SIC2] [char](6) NULL,
	[SIC3] [char](6) NULL,
	[SIC4] [char](6) NULL,
	[SIC5] [char](6) NULL,
	[PrimaryNAICS] [char](8) NULL,
	[NAICS2] [char](8) NULL,
	[NAICS3] [char](8) NULL,
	[NAICS4] [char](8) NULL,
	[NAICS5] [char](8) NULL,
	[Ownership] [char](1) NULL,
	[LocationStatusCode] [char](1) NULL,
	[StockExchangeCode] [char](1) NULL,
	[StockTicker] [char](6) NULL,
	[WhiteCollarPct] [numeric](4, 1) NULL,
	[WhiteCollarFlag] [char](1) NULL,
	[EmpSizeRange] [char](2) NULL,
	[EmpSizeValue] [numeric](9, 0) NULL,
	[EmpSizeFlag] [char](1) NULL,
	[AnnualSalesRange] [char](2) NULL,
	[AnnualSales] [varchar](15) NULL,
	[AnnualSalesFlag] [char](1) NULL,
	[YearEst] [char](4) NULL,
	[CreditCode] [char](1) NULL,
	[HeadQuartersID] [char](9) NULL,
	[ParentID] [char](9) NULL,
	[UltimateParentID] [char](9) NULL,
	[ForeignParentFlag] [char](1) NULL,
	[ExportImportFlag] [char](1) NULL,
	[BusinessType] [char](1) NULL,
	[WorkAtHome] [char](1) NULL,
	[ReleaseNumber] [char](3) NULL,
 CONSTRAINT [PK_EMPDB] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpDBInf]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EmpDBInf](
	[ReleaseNumber] [char](3) NOT NULL,
	[ReleaseMonth] [char](2) NOT NULL,
	[ReleaseYear] [char](4) NOT NULL,
	[CopyrightYear] [char](4) NULL,
	[ContractYear] [char](4) NULL,
	[EditionYear] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReleaseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpSizeFlag]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EmpSizeFlag](
	[EmpSizeFlag] [char](1) NOT NULL,
	[EmpFlagDesc] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpSizeFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpSizeRange]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[EmpSizeRange](
	[EmpSizeRange] [char](2) NOT NULL,
	[EmpRangeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpSizeRange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Experience]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Experience](
	[ExperienceCode] [char](1) NOT NULL,
	[ExperienceDesc] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExperienceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExperienceLevels]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ExperienceLevels](
	[StFips] [char](2) NOT NULL,
	[ExperienceLevel] [char](1) NOT NULL,
	[ExperienceLevelDesc] [varchar](40) NOT NULL,
 CONSTRAINT [PK_EXPERIENCELEVELS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[ExperienceLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Gender](
	[GenderCode] [char](1) NOT NULL,
	[GenderDesc] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Geographies]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Geographies](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[AreaName] [varchar](60) NOT NULL,
	[AreaDesc] [varchar](max) NULL,
	[latitude] [numeric](11, 6) NULL,
	[longitude] [numeric](11, 6) NULL,
	[GeoPrecisionCode] [char](1) NULL,
 CONSTRAINT [PK_GEOGRAPHIES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeoPrecisionCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[GeoPrecisionCode](
	[GeoPrecisionCode] [char](1) NOT NULL,
	[GeoPrecisionDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[GeoPrecisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrowthCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[GrowthCodes](
	[StFips] [char](2) NOT NULL,
	[GrowthCode] [char](2) NOT NULL,
	[GrowthDesc] [varchar](20) NULL,
 CONSTRAINT [PK_GROWTHCODES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[GrowthCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Income]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Income](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IncomeType] [char](2) NOT NULL,
	[IncomeSource] [char](1) NOT NULL,
	[Income] [numeric](14, 0) NOT NULL,
	[IncomeRank] [numeric](3, 0) NULL,
	[Population] [numeric](10, 0) NULL,
	[ReleaseDate] [char](8) NULL,
 CONSTRAINT [PK_INCOME] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IncomeType] ASC,
	[IncomeSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IncomeSource]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IncomeSource](
	[StFips] [char](2) NOT NULL,
	[IncomeSource] [char](1) NOT NULL,
	[IncomeSourceDesc] [varchar](40) NULL,
 CONSTRAINT [PK_INCOMESOURCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[IncomeSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IncomeType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IncomeType](
	[StFips] [char](2) NOT NULL,
	[IncomeType] [char](2) NOT NULL,
	[IncomeDesc] [varchar](75) NULL,
 CONSTRAINT [PK_INCOMETYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[IncomeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndCodeTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndCodeTypes](
	[CodeType] [char](2) NOT NULL,
	[CodeTypeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndDirectory]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndDirectory](
	[MatrixIndCode] [char](15) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[MatrixIndTitle] [varchar](200) NOT NULL,
	[SubTotal] [char](1) NULL,
	[Ownership] [char](2) NULL,
 CONSTRAINT [PK_INDDIRECTORY] PRIMARY KEY CLUSTERED 
(
	[MatrixIndCode] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndOccSpecialID]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndOccSpecialID](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[SpecialID] [char](3) NOT NULL,
 CONSTRAINT [PK_INDOCCSPECIALID] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC,
	[SpecialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndSubLevels]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndSubLevels](
	[SubTotal] [char](1) NOT NULL,
	[SubTotalDesc] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubTotal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Industry]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Industry](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[Ownership] [char](2) NOT NULL,
	[Prelim] [char](1) NULL,
	[Firms] [numeric](8, 0) NULL,
	[Establishments] [numeric](8, 0) NULL,
	[QuarterAvgEmp] [numeric](9, 0) NULL,
	[Month1Emp] [numeric](9, 0) NULL,
	[Month2Emp] [numeric](9, 0) NULL,
	[Month3Emp] [numeric](9, 0) NULL,
	[TopEmployerAvgEmp] [numeric](9, 0) NULL,
	[TotalWages] [numeric](14, 0) NULL,
	[AvgWeeklyWage] [numeric](8, 0) NULL,
	[TaxableWages] [numeric](14, 0) NULL,
	[UIContributions] [numeric](12, 0) NULL,
	[Suppress] [char](1) NULL,
 CONSTRAINT [PK_INDUSTRY] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[Ownership] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndustryCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndustryCodes](
	[StFips] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](6) NOT NULL,
	[CodeTitle] [varchar](200) NOT NULL,
 CONSTRAINT [PK_INDUSTRYCODES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CodeType] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndustrySum]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndustrySum](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[IndSource] [char](1) NOT NULL,
	[Employers] [numeric](6, 0) NULL,
 CONSTRAINT [PK_INDUSTRYSUM] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[IndSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndustryXIndustry]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IndustryXIndustry](
	[StFips] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](6) NOT NULL,
	[CodeType2] [char](2) NOT NULL,
	[Code2] [char](6) NOT NULL,
 CONSTRAINT [PK_INDUSTRYXINDUSTRY] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CodeType2] ASC,
	[Code2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InstitutionOwnership]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[InstitutionOwnership](
	[InstOwn] [char](1) NOT NULL,
	[InstOwnDesc] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InstOwn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InstitutionType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[InstitutionType](
	[StFips] [char](2) NOT NULL,
	[InstType] [char](2) NOT NULL,
	[InstTyDesc] [varchar](50) NULL,
 CONSTRAINT [PK_INSTITUTIONTYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[InstType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IOSpecialIDs]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IOSpecialIDs](
	[SpecialID] [char](3) NOT NULL,
	[SpecialIDDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IOWage]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IOWage](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[WageSource] [char](1) NOT NULL,
	[EmpCount] [numeric](10, 0) NOT NULL,
	[RateType] [char](1) NOT NULL,
	[ResponseRate] [numeric](6, 0) NULL,
	[MeanWage] [numeric](9, 2) NULL,
	[EntryWage] [numeric](9, 2) NULL,
	[ExperiencedWage] [numeric](9, 2) NULL,
	[Percentile10Wage] [numeric](9, 2) NULL,
	[Percentile25Wage] [numeric](9, 2) NULL,
	[MedianWage] [numeric](9, 2) NULL,
	[Percentile75Wage] [numeric](9, 2) NULL,
	[Percentile90Wage] [numeric](9, 2) NULL,
	[UserDefinedPct] [numeric](3, 0) NULL,
	[UserDefinedPctWage] [numeric](9, 2) NULL,
	[UserDefinedRangeLoPct] [numeric](3, 0) NULL,
	[UserDefinedRangeHiPct] [numeric](3, 0) NULL,
	[UserDefinedRangeMean] [numeric](9, 2) NULL,
	[WageRelativePctError] [numeric](6, 2) NULL,
	[EmpRelativePctError] [numeric](6, 2) NULL,
	[PanelCode] [char](6) NULL,
	[SuppressWage] [char](1) NOT NULL,
	[SuppressAll] [char](1) NOT NULL,
	[SuppressEmp] [char](1) NOT NULL,
 CONSTRAINT [PK_IOWAGE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC,
	[WageSource] ASC,
	[RateType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOLTS]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[JOLTS](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[Adjusted] [char](1) NOT NULL,
	[JOLTSTypeCode] [char](2) NOT NULL,
	[Prelim] [char](2) NULL,
	[Value] [numeric](9, 0) NULL,
	[Rate] [numeric](8, 2) NULL,
 CONSTRAINT [PK_JOLTS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[JOLTSTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOLTSTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[JOLTSTypes](
	[JOLTSTypeCode] [char](2) NOT NULL,
	[JOLTSTypeDesc] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[JOLTSTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LaborForce]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LaborForce](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[Adjusted] [char](1) NOT NULL,
	[Prelim] [char](1) NOT NULL,
	[Benchmark] [char](4) NULL,
	[LaborForce] [numeric](9, 0) NULL,
	[Employed] [numeric](9, 0) NULL,
	[Unemployed] [numeric](9, 0) NULL,
	[UnemployedRate] [numeric](5, 1) NULL,
	[CLFPRate] [numeric](5, 1) NULL,
	[EmpPopRatio] [numeric](5, 1) NULL,
 CONSTRAINT [PK_LABORFORCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[Adjusted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LayTitle]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LayTitle](
	[LayTitleCode] [char](5) NOT NULL,
	[LayTitle] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LayTitleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LayTitleXOcc]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LayTitleXOcc](
	[StFips] [char](2) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[LayTitleCode] [char](5) NOT NULL,
 CONSTRAINT [PK_LAYTITLEXOCC] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC,
	[LayTitleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LengthOpen]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LengthOpen](
	[StFips] [char](2) NOT NULL,
	[LengthOpen] [char](1) NOT NULL,
	[LengthOpenDesc] [varchar](40) NOT NULL,
 CONSTRAINT [PK_LENGTHOPEN] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[LengthOpen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LengthType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LengthType](
	[StFips] [char](2) NOT NULL,
	[LengthType] [char](2) NOT NULL,
	[LengthTypeDesc] [varchar](40) NULL,
 CONSTRAINT [PK_LENGTHTYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[LengthType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicContinuingEdu]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicContinuingEdu](
	[LicenseContinuingEdu] [char](1) NOT NULL,
	[ContinuingEduDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseContinuingEdu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[License]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[License](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[LicenseID] [char](10) NOT NULL,
	[LicAuthID] [char](3) NOT NULL,
	[LicTitle] [varchar](200) NOT NULL,
	[LicDesc] [varchar](max) NULL,
	[LicenseType] [char](1) NULL,
	[Exam] [char](1) NULL,
	[Education] [char](1) NULL,
	[ContinuingEdu] [char](1) NULL,
	[Certification] [char](1) NULL,
	[Experience] [char](1) NULL,
	[Criminal] [char](1) NULL,
	[Physical] [char](1) NULL,
	[Veteran] [char](1) NULL,
	[Inactive] [char](1) NULL,
	[LicenseURL] [char](200) NULL,
	[LicenseUpdated] [char](8) NULL,
 CONSTRAINT [PK_LICENSE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[LicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseActiveStatus]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseActiveStatus](
	[LicenseStatus] [char](1) NOT NULL,
	[LicenseStatusDesc] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseAuthorities]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseAuthorities](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[LicAuthID] [char](3) NOT NULL,
	[Department] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[Board] [varchar](255) NULL,
	[Address1] [varchar](75) NOT NULL,
	[Address2] [varchar](75) NULL,
	[City] [varchar](30) NOT NULL,
	[St] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ZipExt] [char](4) NULL,
	[Latitude] [numeric](11, 6) NULL,
	[Longitude] [numeric](11, 6) NULL,
	[GeoPrecisionCode] [char](1) NULL,
	[Telephone] [varchar](10) NULL,
	[TeleExt] [varchar](10) NULL,
	[Fax] [varchar](10) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](70) NULL,
	[URL] [varchar](200) NOT NULL,
 CONSTRAINT [PK_LICENSEAUTHORITIES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[LicAuthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseCertification]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseCertification](
	[LicenseCertification] [char](1) NOT NULL,
	[LicenseCertDesc] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseCertification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseCriminal]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseCriminal](
	[LicenseCriminal] [char](1) NOT NULL,
	[LicenseCriminalDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseCriminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseEducation]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseEducation](
	[LicenseEducation] [char](1) NOT NULL,
	[EducationDesc] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseEducation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseExams]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseExams](
	[LicenseExam] [char](1) NOT NULL,
	[ExamDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseExam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseExperience]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseExperience](
	[LicenseExperience] [char](1) NOT NULL,
	[ExperienceDesc] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseExperience] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseHistory]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseHistory](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[LicenseID] [char](10) NOT NULL,
	[LicNumType] [char](2) NOT NULL,
	[LicNum] [numeric](9, 0) NULL,
 CONSTRAINT [PK_LICENSEHISTORY] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[LicenseID] ASC,
	[LicNumType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseNumberType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseNumberType](
	[LicNumType] [char](2) NOT NULL,
	[LicNumDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicNumType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicensePhysicalReqs]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicensePhysicalReqs](
	[LicensePhysical] [char](1) NOT NULL,
	[PhysicalDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicensePhysical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseTypes](
	[LicenseType] [char](1) NOT NULL,
	[LicenseTypeDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseVeteran]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseVeteran](
	[LicenseVeteran] [char](1) NOT NULL,
	[VeteranDesc] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseVeteran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseXLicense]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseXLicense](
	[StFips] [char](2) NOT NULL,
	[LicenseID] [char](10) NOT NULL,
	[ReLicenseID] [char](10) NOT NULL,
 CONSTRAINT [PK_LICENSEXLICENSE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[LicenseID] ASC,
	[ReLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseXOcc]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseXOcc](
	[StFips] [char](2) NOT NULL,
	[LicenseID] [char](10) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
 CONSTRAINT [PK_LICENSEXOCC] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[LicenseID] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationStatus]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LocationStatus](
	[LocationStatusCode] [char](1) NOT NULL,
	[LocationStatusDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MatrixXInd]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MatrixXInd](
	[StFips] [char](2) NOT NULL,
	[MatrixIndCode] [char](15) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[SubTotal] [char](1) NULL,
 CONSTRAINT [PK_MATRIXXIND] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[MatrixIndCode] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MatrixXOcc]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MatrixXOcc](
	[StFips] [char](2) NOT NULL,
	[MatrixOccCode] [char](15) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[SubTotal] [char](1) NULL,
 CONSTRAINT [PK_MATRIXXOCC] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[MatrixOccCode] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MEEICode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MEEICode](
	[MEEICode] [char](1) NOT NULL,
	[MEEIDesc] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MEEICode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAICSCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NAICSCode](
	[NAICSCode] [char](6) NOT NULL,
	[NAICSTitle] [varchar](75) NULL,
	[NAICSTitleL] [varchar](200) NULL,
	[NAICSTitleDesc] [varchar](max) NULL,
	[NAICSLevel] [char](1) NULL,
	[NAICSSector] [char](2) NULL,
 CONSTRAINT [PK_NAICSCODE] PRIMARY KEY CLUSTERED 
(
	[NAICSCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAICSDomain]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NAICSDomain](
	[NAICDomain] [char](3) NOT NULL,
	[DomainTitle] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[NAICDomain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAICSLevel]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NAICSLevel](
	[NAICSLevel] [char](1) NOT NULL,
	[LevelDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[NAICSLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAICSSector]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NAICSSector](
	[NAICSSector] [char](2) NOT NULL,
	[SectorDesc] [varchar](45) NULL,
	[SectorDescL] [varchar](120) NULL,
	[NAICSuper] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[NAICSSector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAICSSuperSector]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NAICSSuperSector](
	[NAICSuper] [char](4) NOT NULL,
	[SuperTitle] [varchar](35) NULL,
	[NAICDomain] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[NAICSuper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OccCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OccCodes](
	[StFips] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CodeTitle] [varchar](200) NOT NULL,
 CONSTRAINT [PK_OCCCODES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CodeType] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OccDirectory]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OccDirectory](
	[MatrixOccCode] [char](10) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[MatrixOccTitle] [varchar](200) NOT NULL,
	[SubTotal] [char](1) NULL,
 CONSTRAINT [PK_OCCDIRECTORY] PRIMARY KEY CLUSTERED 
(
	[MatrixOccCode] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OccSubLevels]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OccSubLevels](
	[SubTotal] [char](1) NOT NULL,
	[SubTotalDesc] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubTotal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OccTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OccTypes](
	[CodeType] [char](2) NOT NULL,
	[CodeTypeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OccXOcc]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OccXOcc](
	[StFips] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CodeType2] [char](2) NOT NULL,
	[Code2] [char](10) NOT NULL,
 CONSTRAINT [PK_OCCXOCC] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CodeType2] ASC,
	[Code2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ONETCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ONETCode](
	[ONETCode] [char](8) NOT NULL,
	[ONETCodeType] [char](2) NOT NULL,
	[ONETYear] [char](4) NULL,
	[ONETTitle] [varchar](200) NOT NULL,
	[ONETDesc] [varchar](max) NULL,
 CONSTRAINT [PK_ONETCODE] PRIMARY KEY CLUSTERED 
(
	[ONETCode] ASC,
	[ONETCodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ownerships]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Ownerships](
	[Ownership] [char](2) NOT NULL,
	[OwnerTitle] [varchar](40) NOT NULL,
	[OwnerDesc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ownership] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Periods](
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[PeriodDesc] [varchar](25) NULL,
 CONSTRAINT [PK_PERIODS] PRIMARY KEY CLUSTERED 
(
	[PeriodType] ASC,
	[Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PeriodTypes](
	[PeriodType] [char](2) NOT NULL,
	[PeriodTypeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[PeriodType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodYears]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PeriodYears](
	[PeriodYear] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PeriodYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Population]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Population](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[PopSource] [char](1) NOT NULL,
	[Population] [numeric](10, 0) NULL,
	[ReleaseDate] [char](8) NULL,
 CONSTRAINT [PK_POPULATION] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[PopSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PopulationSource]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PopulationSource](
	[StFips] [char](2) NOT NULL,
	[PopSource] [char](1) NOT NULL,
	[PopSourceDesc] [varchar](40) NULL,
 CONSTRAINT [PK_POPULATIONSOURCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[PopSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PrivateGovt]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PrivateGovt](
	[Ownership] [char](1) NOT NULL,
	[PrvGovDesc] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ownership] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProgramCompleters]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ProgramCompleters](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[InstCode] [char](10) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CompleterType] [char](2) NOT NULL,
	[Completers] [numeric](8, 0) NULL,
	[PlaceComp] [varchar](max) NULL,
 CONSTRAINT [PK_PROGRAMCOMPLETERS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[InstCode] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CompleterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Programs](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[InstCode] [char](10) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CompleterType] [char](2) NOT NULL,
	[Length] [numeric](8, 2) NULL,
	[LengthType] [char](2) NULL,
	[ProgCost] [numeric](6, 0) NULL,
	[ProgTitle] [varchar](200) NOT NULL,
	[ProgDesc] [varchar](max) NULL,
	[CIPCodeType] [char](2) NULL,
	[CIPCode] [char](10) NULL,
	[URL] [varchar](200) NULL,
	[Classroom] [char](1) NULL,
	[Online] [char](1) NULL,
	[ClassTime] [char](1) NULL,
	[ETPLApproval] [char](1) NULL,
 CONSTRAINT [PK_PROGRAMS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[InstCode] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CompleterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectionsMatrix]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ProjectionsMatrix](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[MatrixIndCode] [char](15) NOT NULL,
	[MatrixOccCode] [char](10) NOT NULL,
	[ProjectedYear] [char](4) NULL,
	[EstimatedEmp] [numeric](9, 0) NULL,
	[ProjectedEmp] [numeric](9, 0) NULL,
	[PctEstInd] [numeric](6, 2) NULL,
	[PctEstOcc] [numeric](6, 2) NULL,
	[PctProjInd] [numeric](6, 2) NULL,
	[PctProjOcc] [numeric](6, 2) NULL,
	[Change] [numeric](9, 0) NULL,
	[PercentChange] [numeric](9, 4) NULL,
	[GrowthRate] [numeric](7, 4) NULL,
	[GrowthCode] [char](2) NULL,
	[Exits] [numeric](9, 0) NULL,
	[AnnualExits] [numeric](9, 0) NULL,
	[Transfers] [numeric](9, 0) NULL,
	[AnnualTransfers] [numeric](9, 0) NULL,
	[Change2] [numeric](9, 0) NULL,
	[AnnualChange] [numeric](9, 0) NULL,
	[Openings] [numeric](9, 0) NULL,
	[AnnualOpenings] [numeric](9, 0) NULL,
	[Suppress] [char](1) NOT NULL,
 CONSTRAINT [PK_PROJECTIONSMATRIX] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[MatrixIndCode] ASC,
	[MatrixOccCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QWIType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[QWIType](
	[QWIType] [char](1) NOT NULL,
	[QWITypeDesc] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QWIType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RaceCodes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RaceCodes](
	[RaceCode] [char](2) NOT NULL,
	[RaceDesc] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[RaceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesRevenue]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SalesRevenue](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[SalesType] [char](2) NOT NULL,
	[Sales] [numeric](15, 0) NOT NULL,
 CONSTRAINT [PK_SALESREVENUE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[SalesType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SalesTypes](
	[StFips] [char](2) NOT NULL,
	[SalesType] [char](2) NOT NULL,
	[SalesTypeDesc] [varchar](40) NULL,
 CONSTRAINT [PK_SALESTYPES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[SalesType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schools]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Schools](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[InstCode] [char](10) NOT NULL,
	[InstType] [char](2) NOT NULL,
	[InstOwn] [char](1) NOT NULL,
	[InstName1] [varchar](80) NULL,
	[InstName2] [varchar](80) NULL,
	[Address1] [varchar](35) NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](30) NULL,
	[St] [char](2) NULL,
	[ZipCode] [char](5) NULL,
	[ZipExt] [char](3) NULL,
	[Latitude] [numeric](11, 6) NULL,
	[Longitude] [numeric](11, 6) NULL,
	[GeoPrecisionCode] [char](1) NULL,
	[Telephone] [char](10) NULL,
	[TeleExt] [varchar](10) NULL,
	[Tax] [char](10) NULL,
	[URL] [varchar](200) NULL,
	[Contact] [varchar](50) NULL,
	[DistanceLearn] [char](1) NULL,
	[SatelliteCampus] [char](1) NULL,
 CONSTRAINT [PK_SCHOOLS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[InstCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SizeClasses]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SizeClasses](
	[stfips] [char](2) NOT NULL,
	[sizeclass] [char](2) NOT NULL,
	[SizeDesc] [varchar](40) NULL,
 CONSTRAINT [PK_SIZECLASSES] PRIMARY KEY CLUSTERED 
(
	[stfips] ASC,
	[sizeclass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOCCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SOCCode](
	[SOCCode] [char](6) NOT NULL,
	[SOCCodeType] [char](2) NOT NULL,
	[SOCTitle] [varchar](75) NULL,
	[SOCTitleL] [varchar](200) NULL,
	[SOCDesc] [varchar](max) NULL,
	[Education] [char](1) NULL,
	[Experience] [char](1) NULL,
	[Training] [char](1) NULL,
	[OEWSFlag] [char](1) NULL,
	[SOCParent] [char](6) NULL,
	[SOCParentCodeType] [char](2) NULL,
	[OOHTrnTm] [char](1) NULL,
 CONSTRAINT [PK_SOCCODE] PRIMARY KEY CLUSTERED 
(
	[SOCCode] ASC,
	[SOCCodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateFips]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StateFips](
	[StFips] [char](2) NOT NULL,
	[StateName] [varchar](20) NULL,
	[Abreviation] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[StFips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateList]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StateList](
	[StFips] [char](2) NOT NULL,
	[StateName] [varchar](20) NULL,
	[StateAbbreviation] [char](2) NULL,
 CONSTRAINT [PK_STATELIST] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateProgramCode]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StateProgramCode](
	[StFips] [char](2) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[CIPCode] [char](10) NOT NULL,
	[CIPCodeType] [char](2) NOT NULL,
	[TitleDesc] [varchar](max) NULL,
 CONSTRAINT [PK_STATEPROGRAMCODE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[CodeType] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatisticTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StatisticTypes](
	[StFips] [char](2) NOT NULL,
	[StatisticType] [char](2) NOT NULL,
	[StatisticTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_STATISTICTYPES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[StatisticType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockExchange]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StockExchange](
	[StockExchangeCode] [char](1) NOT NULL,
	[StockExchangeDesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[StockExchangeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubGeographies]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SubGeographies](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[SubStFips] [char](2) NOT NULL,
	[SubAreaType] [char](2) NOT NULL,
	[SubAreaTypeVersion] [char](3) NOT NULL,
	[SubArea] [char](6) NOT NULL,
 CONSTRAINT [PK_SUBGEOGRAPHIES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[SubStFips] ASC,
	[SubAreaType] ASC,
	[SubAreaTypeVersion] ASC,
	[SubArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Supply](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[InstType] [char](2) NOT NULL,
	[InstOwn] [char](1) NOT NULL,
	[CodeType] [char](2) NOT NULL,
	[Code] [char](10) NOT NULL,
	[CompleterType] [char](2) NOT NULL,
	[Completers] [numeric](8, 0) NULL,
 CONSTRAINT [PK_SUPPLY] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[InstType] ASC,
	[InstOwn] ASC,
	[CodeType] ASC,
	[Code] ASC,
	[CompleterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableList]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TableList](
	[TableName] [varchar](32) NOT NULL,
	[TableDesc] [varchar](60) NULL,
	[TableType] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableSource]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TableSource](
	[StFips] [char](2) NOT NULL,
	[TableName] [varchar](32) NOT NULL,
	[Supplier] [varchar](60) NULL,
	[Contact] [varchar](30) NULL,
	[Telephone] [char](10) NULL,
	[TeleExt] [varchar](10) NULL,
	[LastUpdate] [date] NULL,
	[NextUpdate] [date] NULL,
	[FileType] [varchar](10) NULL,
	[Info] [varchar](max) NULL,
 CONSTRAINT [PK_TABLESOURCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxRevenues]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TaxRevenues](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[TaxType] [char](2) NOT NULL,
	[TaxRevenue] [numeric](15, 0) NULL,
 CONSTRAINT [PK_TAXREVENUES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[TaxType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TaxType](
	[StFips] [char](2) NOT NULL,
	[TaxType] [char](2) NOT NULL,
	[TaxTypeDesc] [varchar](75) NULL,
 CONSTRAINT [PK_TAXTYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[TaxType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransferPayments]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TransferPayments](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[PaymentType] [char](2) NOT NULL,
	[AmountPaid] [numeric](10, 0) NULL,
 CONSTRAINT [PK_TRANSFERPAYMENTS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[PaymentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransferPaymentTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TransferPaymentTypes](
	[StFips] [char](2) NOT NULL,
	[PaymentType] [char](2) NOT NULL,
	[PayTyDesc] [varchar](40) NULL,
 CONSTRAINT [PK_TRANSFERPAYMENTTYPES] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[PaymentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UIClaims]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[UIClaims](
	[StFips] [char](2) NOT NULL,
	[AreaType] [char](2) NOT NULL,
	[AreaTypeVersion] [char](3) NOT NULL,
	[Area] [char](6) NOT NULL,
	[PeriodYear] [char](4) NOT NULL,
	[PeriodType] [char](2) NOT NULL,
	[Period] [char](2) NOT NULL,
	[ClaimType] [char](1) NOT NULL,
	[OccCodeType] [char](2) NOT NULL,
	[OccCode] [char](10) NOT NULL,
	[IndCodeType] [char](2) NOT NULL,
	[IndCode] [char](6) NOT NULL,
	[AgeGroup] [char](2) NOT NULL,
	[RaceCode] [char](2) NOT NULL,
	[Ethnicity] [char](1) NOT NULL,
	[GenderCode] [char](1) NOT NULL,
	[Claimants] [numeric](8, 0) NULL,
	[WeeksComp] [numeric](8, 0) NULL,
	[FirstPayments] [numeric](8, 0) NULL,
	[Duration] [numeric](4, 1) NULL,
 CONSTRAINT [PK_UICLAIMS] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[AreaType] ASC,
	[AreaTypeVersion] ASC,
	[Area] ASC,
	[PeriodYear] ASC,
	[PeriodType] ASC,
	[Period] ASC,
	[ClaimType] ASC,
	[OccCodeType] ASC,
	[OccCode] ASC,
	[IndCodeType] ASC,
	[IndCode] ASC,
	[AgeGroup] ASC,
	[RaceCode] ASC,
	[Ethnicity] ASC,
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[UnitType](
	[StFips] [char](2) NOT NULL,
	[UnitType] [char](2) NOT NULL,
	[UnitTypeDesc] [varchar](60) NULL,
 CONSTRAINT [PK_UNITTYPE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[UnitType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WageRateTypes]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[WageRateTypes](
	[RateType] [char](1) NOT NULL,
	[RateTypeDesc] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RateType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WageSource]    Script Date: 8/11/2022 7:36:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[WageSource](
	[StFips] [char](2) NOT NULL,
	[WageSource] [char](1) NOT NULL,
	[WageSourceDesc] [varchar](60) NULL,
 CONSTRAINT [PK_WAGESOURCE] PRIMARY KEY CLUSTERED 
(
	[StFips] ASC,
	[WageSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AreaType]  WITH CHECK ADD  CONSTRAINT [fk_areatype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[AreaType] CHECK CONSTRAINT [fk_areatype_statefips]
GO
ALTER TABLE [dbo].[BED]  WITH CHECK ADD  CONSTRAINT [fk_bed_bedtypes] FOREIGN KEY([BEDTypeCode])
REFERENCES [dbo].[BEDTypes] ([BEDTypeCode])
GO
ALTER TABLE [dbo].[BED] CHECK CONSTRAINT [fk_bed_bedtypes]
GO
ALTER TABLE [dbo].[BED]  WITH CHECK ADD  CONSTRAINT [fk_bed_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[BED] CHECK CONSTRAINT [fk_bed_geographies]
GO
ALTER TABLE [dbo].[BED]  WITH CHECK ADD  CONSTRAINT [fk_bed_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[BED] CHECK CONSTRAINT [fk_bed_industrycodes]
GO
ALTER TABLE [dbo].[BED]  WITH CHECK ADD  CONSTRAINT [fk_bed_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[BED] CHECK CONSTRAINT [fk_bed_periods]
GO
ALTER TABLE [dbo].[BED]  WITH CHECK ADD  CONSTRAINT [fk_bed_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[BED] CHECK CONSTRAINT [fk_bed_periodyears]
GO
ALTER TABLE [dbo].[Benefit]  WITH CHECK ADD  CONSTRAINT [fk_benefit_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[Benefit] CHECK CONSTRAINT [fk_benefit_statefips]
GO
ALTER TABLE [dbo].[BuildingPermits]  WITH CHECK ADD  CONSTRAINT [fk_buildingpermits_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[BuildingPermits] CHECK CONSTRAINT [fk_buildingpermits_geographies]
GO
ALTER TABLE [dbo].[BuildingPermits]  WITH CHECK ADD  CONSTRAINT [fk_buildingpermits_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[BuildingPermits] CHECK CONSTRAINT [fk_buildingpermits_periods]
GO
ALTER TABLE [dbo].[BuildingPermits]  WITH CHECK ADD  CONSTRAINT [fk_buildingpermits_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[BuildingPermits] CHECK CONSTRAINT [fk_buildingpermits_periodyears]
GO
ALTER TABLE [dbo].[BuildingPermits]  WITH CHECK ADD  CONSTRAINT [fk_buildingpermits_unittype] FOREIGN KEY([StFips], [UnitType])
REFERENCES [dbo].[UnitType] ([StFips], [UnitType])
GO
ALTER TABLE [dbo].[BuildingPermits] CHECK CONSTRAINT [fk_buildingpermits_unittype]
GO
ALTER TABLE [dbo].[CES]  WITH CHECK ADD  CONSTRAINT [fk_ces_benchmark] FOREIGN KEY([Benchmark])
REFERENCES [dbo].[Benchmark] ([Benchmark])
GO
ALTER TABLE [dbo].[CES] CHECK CONSTRAINT [fk_ces_benchmark]
GO
ALTER TABLE [dbo].[CES]  WITH CHECK ADD  CONSTRAINT [fk_ces_cescode] FOREIGN KEY([StFips], [SeriesCode])
REFERENCES [dbo].[CESCode] ([stfips], [seriescode])
GO
ALTER TABLE [dbo].[CES] CHECK CONSTRAINT [fk_ces_cescode]
GO
ALTER TABLE [dbo].[CES]  WITH CHECK ADD  CONSTRAINT [fk_ces_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[CES] CHECK CONSTRAINT [fk_ces_geographies]
GO
ALTER TABLE [dbo].[CES]  WITH CHECK ADD  CONSTRAINT [fk_ces_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[CES] CHECK CONSTRAINT [fk_ces_periods]
GO
ALTER TABLE [dbo].[CES]  WITH CHECK ADD  CONSTRAINT [fk_ces_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[CES] CHECK CONSTRAINT [fk_ces_periodyears]
GO
ALTER TABLE [dbo].[CESCode]  WITH CHECK ADD  CONSTRAINT [fk_cescode_statefips] FOREIGN KEY([stfips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[CESCode] CHECK CONSTRAINT [fk_cescode_statefips]
GO
ALTER TABLE [dbo].[CIPCode]  WITH CHECK ADD  CONSTRAINT [fk_cipcode_occtypes] FOREIGN KEY([cipcodetype])
REFERENCES [dbo].[OccTypes] ([CodeType])
GO
ALTER TABLE [dbo].[CIPCode] CHECK CONSTRAINT [fk_cipcode_occtypes]
GO
ALTER TABLE [dbo].[ClusterCode]  WITH CHECK ADD  CONSTRAINT [fk_clustercode_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[ClusterCode] CHECK CONSTRAINT [fk_clustercode_statefips]
GO
ALTER TABLE [dbo].[ClusterXOcc]  WITH CHECK ADD  CONSTRAINT [fk_clusterxocc_clustercode] FOREIGN KEY([StFips], [ClusterCode])
REFERENCES [dbo].[ClusterCode] ([StFips], [ClusterCode])
GO
ALTER TABLE [dbo].[ClusterXOcc] CHECK CONSTRAINT [fk_clusterxocc_clustercode]
GO
ALTER TABLE [dbo].[ClusterXOcc]  WITH CHECK ADD  CONSTRAINT [fk_clusterxocc_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[ClusterXOcc] CHECK CONSTRAINT [fk_clusterxocc_geographies]
GO
ALTER TABLE [dbo].[ClusterXOcc]  WITH CHECK ADD  CONSTRAINT [fk_clusterxocc_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[ClusterXOcc] CHECK CONSTRAINT [fk_clusterxocc_occcodes]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_clustercode] FOREIGN KEY([StFips], [ClusterCode])
REFERENCES [dbo].[ClusterCode] ([StFips], [ClusterCode])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_clustercode]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_completertype] FOREIGN KEY([StFips], [CompleterType])
REFERENCES [dbo].[CompleterType] ([StFips], [CompleterType])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_completertype]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_geographies]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_occcodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_occcodes]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_periods]
GO
ALTER TABLE [dbo].[ClusterXSupply]  WITH CHECK ADD  CONSTRAINT [fk_clusterxsupply_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[ClusterXSupply] CHECK CONSTRAINT [fk_clusterxsupply_periodyears]
GO
ALTER TABLE [dbo].[Commute]  WITH CHECK ADD  CONSTRAINT [fk_commute_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Commute] CHECK CONSTRAINT [fk_commute_geographies]
GO
ALTER TABLE [dbo].[Commute]  WITH CHECK ADD  CONSTRAINT [fk_commute_geographieswork] FOREIGN KEY([WorkStFips], [WorkAreaType], [WorkAreaTypeVersion], [WorkArea])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Commute] CHECK CONSTRAINT [fk_commute_geographieswork]
GO
ALTER TABLE [dbo].[Commute]  WITH CHECK ADD  CONSTRAINT [fk_commute_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Commute] CHECK CONSTRAINT [fk_commute_periods]
GO
ALTER TABLE [dbo].[Commute]  WITH CHECK ADD  CONSTRAINT [fk_commute_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Commute] CHECK CONSTRAINT [fk_commute_periodyears]
GO
ALTER TABLE [dbo].[CompleterType]  WITH CHECK ADD  CONSTRAINT [fk_completertype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[CompleterType] CHECK CONSTRAINT [fk_completertype_statefips]
GO
ALTER TABLE [dbo].[CPI]  WITH CHECK ADD  CONSTRAINT [fk_cpi_cpisource] FOREIGN KEY([StFips], [CPISource])
REFERENCES [dbo].[CPISource] ([StFips], [CPISource])
GO
ALTER TABLE [dbo].[CPI] CHECK CONSTRAINT [fk_cpi_cpisource]
GO
ALTER TABLE [dbo].[CPI]  WITH CHECK ADD  CONSTRAINT [fk_cpi_cpitype] FOREIGN KEY([CPIType])
REFERENCES [dbo].[CPIType] ([CPIType])
GO
ALTER TABLE [dbo].[CPI] CHECK CONSTRAINT [fk_cpi_cpitype]
GO
ALTER TABLE [dbo].[CPI]  WITH CHECK ADD  CONSTRAINT [fk_cpi_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[CPI] CHECK CONSTRAINT [fk_cpi_geographies]
GO
ALTER TABLE [dbo].[CPI]  WITH CHECK ADD  CONSTRAINT [fk_cpi_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[CPI] CHECK CONSTRAINT [fk_cpi_periods]
GO
ALTER TABLE [dbo].[CPI]  WITH CHECK ADD  CONSTRAINT [fk_cpi_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[CPI] CHECK CONSTRAINT [fk_cpi_periodyears]
GO
ALTER TABLE [dbo].[CPIPlus]  WITH CHECK ADD  CONSTRAINT [fk_cpiplus_cpiitems] FOREIGN KEY([CPIItem])
REFERENCES [dbo].[CPIItems] ([CPIItem])
GO
ALTER TABLE [dbo].[CPIPlus] CHECK CONSTRAINT [fk_cpiplus_cpiitems]
GO
ALTER TABLE [dbo].[CPIPlus]  WITH CHECK ADD  CONSTRAINT [fk_cpiplus_cpisource] FOREIGN KEY([StFips], [CPISource])
REFERENCES [dbo].[CPISource] ([StFips], [CPISource])
GO
ALTER TABLE [dbo].[CPIPlus] CHECK CONSTRAINT [fk_cpiplus_cpisource]
GO
ALTER TABLE [dbo].[CPIPlus]  WITH CHECK ADD  CONSTRAINT [fk_cpiplus_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[CPIPlus] CHECK CONSTRAINT [fk_cpiplus_geographies]
GO
ALTER TABLE [dbo].[CPIPlus]  WITH CHECK ADD  CONSTRAINT [fk_cpiplus_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[CPIPlus] CHECK CONSTRAINT [fk_cpiplus_periods]
GO
ALTER TABLE [dbo].[CPIPlus]  WITH CHECK ADD  CONSTRAINT [fk_cpiplus_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[CPIPlus] CHECK CONSTRAINT [fk_cpiplus_periodyears]
GO
ALTER TABLE [dbo].[CPISource]  WITH CHECK ADD  CONSTRAINT [fk_cpisource_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[CPISource] CHECK CONSTRAINT [fk_cpisource_statefips]
GO
ALTER TABLE [dbo].[Demographics]  WITH CHECK ADD  CONSTRAINT [fk_demographics_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Demographics] CHECK CONSTRAINT [fk_demographics_geographies]
GO
ALTER TABLE [dbo].[Demographics]  WITH CHECK ADD  CONSTRAINT [fk_demographics_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Demographics] CHECK CONSTRAINT [fk_demographics_periods]
GO
ALTER TABLE [dbo].[Demographics]  WITH CHECK ADD  CONSTRAINT [fk_demographics_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Demographics] CHECK CONSTRAINT [fk_demographics_periodyears]
GO
ALTER TABLE [dbo].[Demographics]  WITH CHECK ADD  CONSTRAINT [fk_demographics_populationsource] FOREIGN KEY([StFips], [PopSource])
REFERENCES [dbo].[PopulationSource] ([StFips], [PopSource])
GO
ALTER TABLE [dbo].[Demographics] CHECK CONSTRAINT [fk_demographics_populationsource]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_annualsalescodes] FOREIGN KEY([AnnualSalesFlag])
REFERENCES [dbo].[AnnualSalesCodes] ([AnnSalesCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_annualsalescodes]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_annualsalesranges] FOREIGN KEY([AnnualSalesRange])
REFERENCES [dbo].[AnnualSalesRanges] ([AnnSalesRange])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_annualsalesranges]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_CONTACTPROTITLES] FOREIGN KEY([ContactProTitle])
REFERENCES [dbo].[ContactProTitles] ([ContactProTitle])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_CONTACTPROTITLES]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_CONTACTTITLE] FOREIGN KEY([ContactTitleCode])
REFERENCES [dbo].[ContactTitle] ([ContactTitleCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_CONTACTTITLE]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_CREDITCODE] FOREIGN KEY([CreditCode])
REFERENCES [dbo].[CreditCode] ([CreditCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_CREDITCODE]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_EMPDBINF] FOREIGN KEY([ReleaseNumber])
REFERENCES [dbo].[EmpDBInf] ([ReleaseNumber])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_EMPDBINF]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_EMPSIZEFLAG] FOREIGN KEY([EmpSizeFlag])
REFERENCES [dbo].[EmpSizeFlag] ([EmpSizeFlag])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_EMPSIZEFLAG]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_EMPSIZERANGE] FOREIGN KEY([EmpSizeRange])
REFERENCES [dbo].[EmpSizeRange] ([EmpSizeRange])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_EMPSIZERANGE]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_GEOGRAPHIES] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_GEOGRAPHIES]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_GEOPRECISIONCODE] FOREIGN KEY([GeoPrecisionCode])
REFERENCES [dbo].[GeoPrecisionCode] ([GeoPrecisionCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_GEOPRECISIONCODE]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_LOCATIONSTATUS] FOREIGN KEY([LocationStatusCode])
REFERENCES [dbo].[LocationStatus] ([LocationStatusCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_LOCATIONSTATUS]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_PRIVATEGOVT] FOREIGN KEY([Ownership])
REFERENCES [dbo].[PrivateGovt] ([Ownership])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_PRIVATEGOVT]
GO
ALTER TABLE [dbo].[EmpDB]  WITH CHECK ADD  CONSTRAINT [FK_EMPDB_STOCKEXCHANGE] FOREIGN KEY([StockExchangeCode])
REFERENCES [dbo].[StockExchange] ([StockExchangeCode])
GO
ALTER TABLE [dbo].[EmpDB] CHECK CONSTRAINT [FK_EMPDB_STOCKEXCHANGE]
GO
ALTER TABLE [dbo].[ExperienceLevels]  WITH CHECK ADD  CONSTRAINT [fk_experiencelevels_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[ExperienceLevels] CHECK CONSTRAINT [fk_experiencelevels_statefips]
GO
ALTER TABLE [dbo].[Geographies]  WITH CHECK ADD  CONSTRAINT [fk_geographies_geoprecisioncode] FOREIGN KEY([GeoPrecisionCode])
REFERENCES [dbo].[GeoPrecisionCode] ([GeoPrecisionCode])
GO
ALTER TABLE [dbo].[Geographies] CHECK CONSTRAINT [fk_geographies_geoprecisioncode]
GO
ALTER TABLE [dbo].[Geographies]  WITH CHECK ADD  CONSTRAINT [fk_geographies_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[Geographies] CHECK CONSTRAINT [fk_geographies_statefips]
GO
ALTER TABLE [dbo].[GrowthCodes]  WITH CHECK ADD  CONSTRAINT [fk_growthcodes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[GrowthCodes] CHECK CONSTRAINT [fk_growthcodes_statefips]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [fk_income_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [fk_income_geographies]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [fk_income_incomesource] FOREIGN KEY([StFips], [IncomeSource])
REFERENCES [dbo].[IncomeSource] ([StFips], [IncomeSource])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [fk_income_incomesource]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [fk_income_incometype] FOREIGN KEY([StFips], [IncomeType])
REFERENCES [dbo].[IncomeType] ([StFips], [IncomeType])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [fk_income_incometype]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [fk_income_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [fk_income_periods]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [fk_income_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [fk_income_periodyears]
GO
ALTER TABLE [dbo].[IncomeSource]  WITH CHECK ADD  CONSTRAINT [fk_incomesource_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[IncomeSource] CHECK CONSTRAINT [fk_incomesource_statefips]
GO
ALTER TABLE [dbo].[IncomeType]  WITH CHECK ADD  CONSTRAINT [fk_incometype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[IncomeType] CHECK CONSTRAINT [fk_incometype_statefips]
GO
ALTER TABLE [dbo].[IndOccSpecialID]  WITH CHECK ADD  CONSTRAINT [fk_indoccspecialid_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[IndOccSpecialID] CHECK CONSTRAINT [fk_indoccspecialid_geographies]
GO
ALTER TABLE [dbo].[IndOccSpecialID]  WITH CHECK ADD  CONSTRAINT [fk_indoccspecialid_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IndOccSpecialID] CHECK CONSTRAINT [fk_indoccspecialid_industrycodes]
GO
ALTER TABLE [dbo].[IndOccSpecialID]  WITH CHECK ADD  CONSTRAINT [fk_indoccspecialid_iospecialids] FOREIGN KEY([SpecialID])
REFERENCES [dbo].[IOSpecialIDs] ([SpecialID])
GO
ALTER TABLE [dbo].[IndOccSpecialID] CHECK CONSTRAINT [fk_indoccspecialid_iospecialids]
GO
ALTER TABLE [dbo].[IndOccSpecialID]  WITH CHECK ADD  CONSTRAINT [fk_indoccspecialid_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IndOccSpecialID] CHECK CONSTRAINT [fk_indoccspecialid_occcodes]
GO
ALTER TABLE [dbo].[IndOccSpecialID]  WITH CHECK ADD  CONSTRAINT [fk_indoccspecialid_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[IndOccSpecialID] CHECK CONSTRAINT [fk_indoccspecialid_periodyears]
GO
ALTER TABLE [dbo].[Industry]  WITH CHECK ADD  CONSTRAINT [fk_industry_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Industry] CHECK CONSTRAINT [fk_industry_geographies]
GO
ALTER TABLE [dbo].[Industry]  WITH CHECK ADD  CONSTRAINT [fk_industry_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[Industry] CHECK CONSTRAINT [fk_industry_industrycodes]
GO
ALTER TABLE [dbo].[Industry]  WITH CHECK ADD  CONSTRAINT [fk_industry_ownerships] FOREIGN KEY([Ownership])
REFERENCES [dbo].[Ownerships] ([Ownership])
GO
ALTER TABLE [dbo].[Industry] CHECK CONSTRAINT [fk_industry_ownerships]
GO
ALTER TABLE [dbo].[Industry]  WITH CHECK ADD  CONSTRAINT [fk_industry_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Industry] CHECK CONSTRAINT [fk_industry_periods]
GO
ALTER TABLE [dbo].[Industry]  WITH CHECK ADD  CONSTRAINT [fk_industry_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Industry] CHECK CONSTRAINT [fk_industry_periodyears]
GO
ALTER TABLE [dbo].[IndustryCodes]  WITH CHECK ADD  CONSTRAINT [fk_industrycodes_indcodetypes] FOREIGN KEY([CodeType])
REFERENCES [dbo].[IndCodeTypes] ([CodeType])
GO
ALTER TABLE [dbo].[IndustryCodes] CHECK CONSTRAINT [fk_industrycodes_indcodetypes]
GO
ALTER TABLE [dbo].[IndustryCodes]  WITH CHECK ADD  CONSTRAINT [fk_industrycodes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[IndustryCodes] CHECK CONSTRAINT [fk_industrycodes_statefips]
GO
ALTER TABLE [dbo].[IndustrySum]  WITH CHECK ADD  CONSTRAINT [fk_industrysum_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[IndustrySum] CHECK CONSTRAINT [fk_industrysum_geographies]
GO
ALTER TABLE [dbo].[IndustrySum]  WITH CHECK ADD  CONSTRAINT [fk_industrysum_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IndustrySum] CHECK CONSTRAINT [fk_industrysum_industrycodes]
GO
ALTER TABLE [dbo].[IndustryXIndustry]  WITH CHECK ADD  CONSTRAINT [fk_industryxindustry_industrycodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IndustryXIndustry] CHECK CONSTRAINT [fk_industryxindustry_industrycodes]
GO
ALTER TABLE [dbo].[IndustryXIndustry]  WITH CHECK ADD  CONSTRAINT [fk_industryxindustry_industrycodes2] FOREIGN KEY([StFips], [CodeType2], [Code2])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IndustryXIndustry] CHECK CONSTRAINT [fk_industryxindustry_industrycodes2]
GO
ALTER TABLE [dbo].[InstitutionType]  WITH CHECK ADD  CONSTRAINT [fk_institutiontype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[InstitutionType] CHECK CONSTRAINT [fk_institutiontype_statefips]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_geographies]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_industrycodes]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_occcodes]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_periods]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_periodyears]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_wageratetypes] FOREIGN KEY([RateType])
REFERENCES [dbo].[WageRateTypes] ([RateType])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_wageratetypes]
GO
ALTER TABLE [dbo].[IOWage]  WITH CHECK ADD  CONSTRAINT [fk_iowage_wagesource] FOREIGN KEY([StFips], [WageSource])
REFERENCES [dbo].[WageSource] ([StFips], [WageSource])
GO
ALTER TABLE [dbo].[IOWage] CHECK CONSTRAINT [fk_iowage_wagesource]
GO
ALTER TABLE [dbo].[JOLTS]  WITH CHECK ADD  CONSTRAINT [fk_jolts_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[JOLTS] CHECK CONSTRAINT [fk_jolts_geographies]
GO
ALTER TABLE [dbo].[JOLTS]  WITH CHECK ADD  CONSTRAINT [fk_jolts_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[JOLTS] CHECK CONSTRAINT [fk_jolts_industrycodes]
GO
ALTER TABLE [dbo].[JOLTS]  WITH CHECK ADD  CONSTRAINT [fk_jolts_joltstypes] FOREIGN KEY([JOLTSTypeCode])
REFERENCES [dbo].[JOLTSTypes] ([JOLTSTypeCode])
GO
ALTER TABLE [dbo].[JOLTS] CHECK CONSTRAINT [fk_jolts_joltstypes]
GO
ALTER TABLE [dbo].[JOLTS]  WITH CHECK ADD  CONSTRAINT [fk_jolts_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[JOLTS] CHECK CONSTRAINT [fk_jolts_periods]
GO
ALTER TABLE [dbo].[JOLTS]  WITH CHECK ADD  CONSTRAINT [fk_jolts_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[JOLTS] CHECK CONSTRAINT [fk_jolts_periodyears]
GO
ALTER TABLE [dbo].[LaborForce]  WITH CHECK ADD  CONSTRAINT [fk_laborforce_benchmark] FOREIGN KEY([Benchmark])
REFERENCES [dbo].[Benchmark] ([Benchmark])
GO
ALTER TABLE [dbo].[LaborForce] CHECK CONSTRAINT [fk_laborforce_benchmark]
GO
ALTER TABLE [dbo].[LaborForce]  WITH CHECK ADD  CONSTRAINT [fk_laborforce_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[LaborForce] CHECK CONSTRAINT [fk_laborforce_geographies]
GO
ALTER TABLE [dbo].[LaborForce]  WITH CHECK ADD  CONSTRAINT [fk_laborforce_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[LaborForce] CHECK CONSTRAINT [fk_laborforce_periods]
GO
ALTER TABLE [dbo].[LaborForce]  WITH CHECK ADD  CONSTRAINT [fk_laborforce_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[LaborForce] CHECK CONSTRAINT [fk_laborforce_periodyears]
GO
ALTER TABLE [dbo].[LayTitleXOcc]  WITH CHECK ADD  CONSTRAINT [fk_laytitlexocc_laytitle] FOREIGN KEY([LayTitleCode])
REFERENCES [dbo].[LayTitle] ([LayTitleCode])
GO
ALTER TABLE [dbo].[LayTitleXOcc] CHECK CONSTRAINT [fk_laytitlexocc_laytitle]
GO
ALTER TABLE [dbo].[LayTitleXOcc]  WITH CHECK ADD  CONSTRAINT [fk_laytitlexocc_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[LayTitleXOcc] CHECK CONSTRAINT [fk_laytitlexocc_occcodes]
GO
ALTER TABLE [dbo].[LengthOpen]  WITH CHECK ADD  CONSTRAINT [fk_lengthopen_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[LengthOpen] CHECK CONSTRAINT [fk_lengthopen_statefips]
GO
ALTER TABLE [dbo].[LengthType]  WITH CHECK ADD  CONSTRAINT [fk_lengthtype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[LengthType] CHECK CONSTRAINT [fk_lengthtype_statefips]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_liccontinuingedu] FOREIGN KEY([ContinuingEdu])
REFERENCES [dbo].[LicContinuingEdu] ([LicenseContinuingEdu])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_liccontinuingedu]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseactivestatus] FOREIGN KEY([Inactive])
REFERENCES [dbo].[LicenseActiveStatus] ([LicenseStatus])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseactivestatus]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseauthorities] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseauthorities]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licensecertification] FOREIGN KEY([Certification])
REFERENCES [dbo].[LicenseCertification] ([LicenseCertification])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licensecertification]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licensecriminal] FOREIGN KEY([Criminal])
REFERENCES [dbo].[LicenseCriminal] ([LicenseCriminal])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licensecriminal]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseeducation] FOREIGN KEY([Education])
REFERENCES [dbo].[LicenseEducation] ([LicenseEducation])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseeducation]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseexams] FOREIGN KEY([Exam])
REFERENCES [dbo].[LicenseExams] ([LicenseExam])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseexams]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseexperience] FOREIGN KEY([Experience])
REFERENCES [dbo].[LicenseExperience] ([LicenseExperience])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseexperience]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licensephysicalreqs] FOREIGN KEY([Physical])
REFERENCES [dbo].[LicensePhysicalReqs] ([LicensePhysical])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licensephysicalreqs]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licensetypes] FOREIGN KEY([LicenseType])
REFERENCES [dbo].[LicenseTypes] ([LicenseType])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licensetypes]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [fk_license_licenseveteran] FOREIGN KEY([Veteran])
REFERENCES [dbo].[LicenseVeteran] ([LicenseVeteran])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [fk_license_licenseveteran]
GO
ALTER TABLE [dbo].[LicenseAuthorities]  WITH CHECK ADD  CONSTRAINT [fk_licenseauthorities_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[LicenseAuthorities] CHECK CONSTRAINT [fk_licenseauthorities_geographies]
GO
ALTER TABLE [dbo].[LicenseAuthorities]  WITH CHECK ADD  CONSTRAINT [fk_licenseauthorities_geoprecisioncode] FOREIGN KEY([GeoPrecisionCode])
REFERENCES [dbo].[GeoPrecisionCode] ([GeoPrecisionCode])
GO
ALTER TABLE [dbo].[LicenseAuthorities] CHECK CONSTRAINT [fk_licenseauthorities_geoprecisioncode]
GO
ALTER TABLE [dbo].[LicenseHistory]  WITH CHECK ADD  CONSTRAINT [fk_licensehistory_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[LicenseHistory] CHECK CONSTRAINT [fk_licensehistory_geographies]
GO
ALTER TABLE [dbo].[LicenseHistory]  WITH CHECK ADD  CONSTRAINT [fk_licensehistory_license] FOREIGN KEY([StFips], [LicenseID])
REFERENCES [dbo].[License] ([StFips], [LicenseID])
GO
ALTER TABLE [dbo].[LicenseHistory] CHECK CONSTRAINT [fk_licensehistory_license]
GO
ALTER TABLE [dbo].[LicenseHistory]  WITH CHECK ADD  CONSTRAINT [fk_licensehistory_licensenumbertype] FOREIGN KEY([LicNumType])
REFERENCES [dbo].[LicenseNumberType] ([LicNumType])
GO
ALTER TABLE [dbo].[LicenseHistory] CHECK CONSTRAINT [fk_licensehistory_licensenumbertype]
GO
ALTER TABLE [dbo].[LicenseHistory]  WITH CHECK ADD  CONSTRAINT [fk_licensehistory_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[LicenseHistory] CHECK CONSTRAINT [fk_licensehistory_periods]
GO
ALTER TABLE [dbo].[LicenseHistory]  WITH CHECK ADD  CONSTRAINT [fk_licensehistory_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[LicenseHistory] CHECK CONSTRAINT [fk_licensehistory_periodyears]
GO
ALTER TABLE [dbo].[LicenseXLicense]  WITH CHECK ADD  CONSTRAINT [fk_licensexlicense_license] FOREIGN KEY([StFips], [LicenseID])
REFERENCES [dbo].[License] ([StFips], [LicenseID])
GO
ALTER TABLE [dbo].[LicenseXLicense] CHECK CONSTRAINT [fk_licensexlicense_license]
GO
ALTER TABLE [dbo].[LicenseXLicense]  WITH CHECK ADD  CONSTRAINT [fk_licensexlicense_license2] FOREIGN KEY([StFips], [ReLicenseID])
REFERENCES [dbo].[License] ([StFips], [LicenseID])
GO
ALTER TABLE [dbo].[LicenseXLicense] CHECK CONSTRAINT [fk_licensexlicense_license2]
GO
ALTER TABLE [dbo].[LicenseXOcc]  WITH CHECK ADD  CONSTRAINT [fk_licensexocc_license] FOREIGN KEY([StFips], [LicenseID])
REFERENCES [dbo].[License] ([StFips], [LicenseID])
GO
ALTER TABLE [dbo].[LicenseXOcc] CHECK CONSTRAINT [fk_licensexocc_license]
GO
ALTER TABLE [dbo].[LicenseXOcc]  WITH CHECK ADD  CONSTRAINT [fk_licensexocc_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[LicenseXOcc] CHECK CONSTRAINT [fk_licensexocc_occcodes]
GO
ALTER TABLE [dbo].[MatrixXInd]  WITH CHECK ADD  CONSTRAINT [fk_matrixxind_indsublevels] FOREIGN KEY([SubTotal])
REFERENCES [dbo].[IndSubLevels] ([SubTotal])
GO
ALTER TABLE [dbo].[MatrixXInd] CHECK CONSTRAINT [fk_matrixxind_indsublevels]
GO
ALTER TABLE [dbo].[MatrixXInd]  WITH CHECK ADD  CONSTRAINT [fk_matrixxind_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[MatrixXInd] CHECK CONSTRAINT [fk_matrixxind_industrycodes]
GO
ALTER TABLE [dbo].[MatrixXInd]  WITH CHECK ADD  CONSTRAINT [fk_matrixxind_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[MatrixXInd] CHECK CONSTRAINT [fk_matrixxind_periods]
GO
ALTER TABLE [dbo].[MatrixXInd]  WITH CHECK ADD  CONSTRAINT [fk_matrixxind_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[MatrixXInd] CHECK CONSTRAINT [fk_matrixxind_periodyears]
GO
ALTER TABLE [dbo].[MatrixXOcc]  WITH CHECK ADD  CONSTRAINT [fk_matrixxocc_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[MatrixXOcc] CHECK CONSTRAINT [fk_matrixxocc_occcodes]
GO
ALTER TABLE [dbo].[MatrixXOcc]  WITH CHECK ADD  CONSTRAINT [fk_matrixxocc_occsublevels] FOREIGN KEY([SubTotal])
REFERENCES [dbo].[OccSubLevels] ([SubTotal])
GO
ALTER TABLE [dbo].[MatrixXOcc] CHECK CONSTRAINT [fk_matrixxocc_occsublevels]
GO
ALTER TABLE [dbo].[MatrixXOcc]  WITH CHECK ADD  CONSTRAINT [fk_matrixxocc_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[MatrixXOcc] CHECK CONSTRAINT [fk_matrixxocc_periods]
GO
ALTER TABLE [dbo].[MatrixXOcc]  WITH CHECK ADD  CONSTRAINT [fk_matrixxocc_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[MatrixXOcc] CHECK CONSTRAINT [fk_matrixxocc_periodyears]
GO
ALTER TABLE [dbo].[NAICSCode]  WITH CHECK ADD  CONSTRAINT [fk_naicscode_naicslevel] FOREIGN KEY([NAICSLevel])
REFERENCES [dbo].[NAICSLevel] ([NAICSLevel])
GO
ALTER TABLE [dbo].[NAICSCode] CHECK CONSTRAINT [fk_naicscode_naicslevel]
GO
ALTER TABLE [dbo].[NAICSCode]  WITH CHECK ADD  CONSTRAINT [fk_naicscode_naicssector] FOREIGN KEY([NAICSSector])
REFERENCES [dbo].[NAICSSector] ([NAICSSector])
GO
ALTER TABLE [dbo].[NAICSCode] CHECK CONSTRAINT [fk_naicscode_naicssector]
GO
ALTER TABLE [dbo].[NAICSSector]  WITH CHECK ADD  CONSTRAINT [fk_naicssector_naicsuper] FOREIGN KEY([NAICSuper])
REFERENCES [dbo].[NAICSSuperSector] ([NAICSuper])
GO
ALTER TABLE [dbo].[NAICSSector] CHECK CONSTRAINT [fk_naicssector_naicsuper]
GO
ALTER TABLE [dbo].[NAICSSuperSector]  WITH CHECK ADD  CONSTRAINT [fk_naicssupersector_naicsdomain] FOREIGN KEY([NAICDomain])
REFERENCES [dbo].[NAICSDomain] ([NAICDomain])
GO
ALTER TABLE [dbo].[NAICSSuperSector] CHECK CONSTRAINT [fk_naicssupersector_naicsdomain]
GO
ALTER TABLE [dbo].[OccCodes]  WITH CHECK ADD  CONSTRAINT [fk_occcodes_occtypes] FOREIGN KEY([CodeType])
REFERENCES [dbo].[OccTypes] ([CodeType])
GO
ALTER TABLE [dbo].[OccCodes] CHECK CONSTRAINT [fk_occcodes_occtypes]
GO
ALTER TABLE [dbo].[OccCodes]  WITH CHECK ADD  CONSTRAINT [fk_occcodes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[OccCodes] CHECK CONSTRAINT [fk_occcodes_statefips]
GO
ALTER TABLE [dbo].[OccDirectory]  WITH CHECK ADD  CONSTRAINT [fk_occdirectory_occsublevels] FOREIGN KEY([SubTotal])
REFERENCES [dbo].[OccSubLevels] ([SubTotal])
GO
ALTER TABLE [dbo].[OccDirectory] CHECK CONSTRAINT [fk_occdirectory_occsublevels]
GO
ALTER TABLE [dbo].[OccDirectory]  WITH CHECK ADD  CONSTRAINT [fk_occdirectory_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[OccDirectory] CHECK CONSTRAINT [fk_occdirectory_periods]
GO
ALTER TABLE [dbo].[OccDirectory]  WITH CHECK ADD  CONSTRAINT [fk_occdirectory_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[OccDirectory] CHECK CONSTRAINT [fk_occdirectory_periodyears]
GO
ALTER TABLE [dbo].[OccXOcc]  WITH CHECK ADD  CONSTRAINT [fk_occxocc_occcodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[OccXOcc] CHECK CONSTRAINT [fk_occxocc_occcodes]
GO
ALTER TABLE [dbo].[OccXOcc]  WITH CHECK ADD  CONSTRAINT [fk_occxocc_occcodes2] FOREIGN KEY([StFips], [CodeType2], [Code2])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[OccXOcc] CHECK CONSTRAINT [fk_occxocc_occcodes2]
GO
ALTER TABLE [dbo].[ONETCode]  WITH CHECK ADD  CONSTRAINT [fk_onetcode_occtypes] FOREIGN KEY([ONETCodeType])
REFERENCES [dbo].[OccTypes] ([CodeType])
GO
ALTER TABLE [dbo].[ONETCode] CHECK CONSTRAINT [fk_onetcode_occtypes]
GO
ALTER TABLE [dbo].[Periods]  WITH CHECK ADD  CONSTRAINT [fk_periods_periodtypes] FOREIGN KEY([PeriodType])
REFERENCES [dbo].[PeriodTypes] ([PeriodType])
GO
ALTER TABLE [dbo].[Periods] CHECK CONSTRAINT [fk_periods_periodtypes]
GO
ALTER TABLE [dbo].[Population]  WITH CHECK ADD  CONSTRAINT [fk_population_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Population] CHECK CONSTRAINT [fk_population_geographies]
GO
ALTER TABLE [dbo].[Population]  WITH CHECK ADD  CONSTRAINT [fk_population_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Population] CHECK CONSTRAINT [fk_population_periods]
GO
ALTER TABLE [dbo].[Population]  WITH CHECK ADD  CONSTRAINT [fk_population_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Population] CHECK CONSTRAINT [fk_population_periodyears]
GO
ALTER TABLE [dbo].[Population]  WITH CHECK ADD  CONSTRAINT [fk_population_populationsource] FOREIGN KEY([StFips], [PopSource])
REFERENCES [dbo].[PopulationSource] ([StFips], [PopSource])
GO
ALTER TABLE [dbo].[Population] CHECK CONSTRAINT [fk_population_populationsource]
GO
ALTER TABLE [dbo].[PopulationSource]  WITH CHECK ADD  CONSTRAINT [fk_populationsource_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[PopulationSource] CHECK CONSTRAINT [fk_populationsource_statefips]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_completertype] FOREIGN KEY([StFips], [CompleterType])
REFERENCES [dbo].[CompleterType] ([StFips], [CompleterType])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_completertype]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_geographies]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_occcodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_occcodes]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_periods]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_periodyears]
GO
ALTER TABLE [dbo].[ProgramCompleters]  WITH CHECK ADD  CONSTRAINT [fk_programcompleters_schools] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area], [InstCode])
REFERENCES [dbo].[Schools] ([StFips], [AreaType], [AreaTypeVersion], [Area], [InstCode])
GO
ALTER TABLE [dbo].[ProgramCompleters] CHECK CONSTRAINT [fk_programcompleters_schools]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_classtime] FOREIGN KEY([ClassTime])
REFERENCES [dbo].[ClassTime] ([ClassTime])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_classtime]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_completertype] FOREIGN KEY([StFips], [CompleterType])
REFERENCES [dbo].[CompleterType] ([StFips], [CompleterType])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_completertype]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_geographies]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_lengthtype] FOREIGN KEY([StFips], [LengthType])
REFERENCES [dbo].[LengthType] ([StFips], [LengthType])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_lengthtype]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_occcodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_occcodes]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_occcodescip] FOREIGN KEY([StFips], [CIPCodeType], [CIPCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_occcodescip]
GO
ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [fk_programs_schools] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area], [InstCode])
REFERENCES [dbo].[Schools] ([StFips], [AreaType], [AreaTypeVersion], [Area], [InstCode])
GO
ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [fk_programs_schools]
GO
ALTER TABLE [dbo].[ProjectionsMatrix]  WITH CHECK ADD  CONSTRAINT [fk_projectionsmatrix_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[ProjectionsMatrix] CHECK CONSTRAINT [fk_projectionsmatrix_geographies]
GO
ALTER TABLE [dbo].[ProjectionsMatrix]  WITH CHECK ADD  CONSTRAINT [fk_projectionsmatrix_growthcodes] FOREIGN KEY([StFips], [GrowthCode])
REFERENCES [dbo].[GrowthCodes] ([StFips], [GrowthCode])
GO
ALTER TABLE [dbo].[ProjectionsMatrix] CHECK CONSTRAINT [fk_projectionsmatrix_growthcodes]
GO
ALTER TABLE [dbo].[ProjectionsMatrix]  WITH CHECK ADD  CONSTRAINT [fk_projectionsmatrix_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[ProjectionsMatrix] CHECK CONSTRAINT [fk_projectionsmatrix_periods]
GO
ALTER TABLE [dbo].[ProjectionsMatrix]  WITH CHECK ADD  CONSTRAINT [fk_projectionsmatrix_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[ProjectionsMatrix] CHECK CONSTRAINT [fk_projectionsmatrix_periodyears]
GO
ALTER TABLE [dbo].[SalesRevenue]  WITH CHECK ADD  CONSTRAINT [fk_salesrevenue_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[SalesRevenue] CHECK CONSTRAINT [fk_salesrevenue_geographies]
GO
ALTER TABLE [dbo].[SalesRevenue]  WITH CHECK ADD  CONSTRAINT [fk_salesrevenue_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[SalesRevenue] CHECK CONSTRAINT [fk_salesrevenue_periods]
GO
ALTER TABLE [dbo].[SalesRevenue]  WITH CHECK ADD  CONSTRAINT [fk_salesrevenue_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[SalesRevenue] CHECK CONSTRAINT [fk_salesrevenue_periodyears]
GO
ALTER TABLE [dbo].[SalesRevenue]  WITH CHECK ADD  CONSTRAINT [fk_salesrevenue_salestypes] FOREIGN KEY([StFips], [SalesType])
REFERENCES [dbo].[SalesTypes] ([StFips], [SalesType])
GO
ALTER TABLE [dbo].[SalesRevenue] CHECK CONSTRAINT [fk_salesrevenue_salestypes]
GO
ALTER TABLE [dbo].[SalesTypes]  WITH CHECK ADD  CONSTRAINT [fk_salestypes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[SalesTypes] CHECK CONSTRAINT [fk_salestypes_statefips]
GO
ALTER TABLE [dbo].[Schools]  WITH CHECK ADD  CONSTRAINT [fk_schools_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Schools] CHECK CONSTRAINT [fk_schools_geographies]
GO
ALTER TABLE [dbo].[Schools]  WITH CHECK ADD  CONSTRAINT [fk_schools_geoprecisioncode] FOREIGN KEY([GeoPrecisionCode])
REFERENCES [dbo].[GeoPrecisionCode] ([GeoPrecisionCode])
GO
ALTER TABLE [dbo].[Schools] CHECK CONSTRAINT [fk_schools_geoprecisioncode]
GO
ALTER TABLE [dbo].[Schools]  WITH CHECK ADD  CONSTRAINT [fk_schools_institutiontype] FOREIGN KEY([StFips], [InstType])
REFERENCES [dbo].[InstitutionType] ([StFips], [InstType])
GO
ALTER TABLE [dbo].[Schools] CHECK CONSTRAINT [fk_schools_institutiontype]
GO
ALTER TABLE [dbo].[SizeClasses]  WITH CHECK ADD  CONSTRAINT [fk_sizeclasses_statefips] FOREIGN KEY([stfips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[SizeClasses] CHECK CONSTRAINT [fk_sizeclasses_statefips]
GO
ALTER TABLE [dbo].[SOCCode]  WITH CHECK ADD  CONSTRAINT [fk_soccode_blseducation] FOREIGN KEY([Education])
REFERENCES [dbo].[BLSEducation] ([EduCategory])
GO
ALTER TABLE [dbo].[SOCCode] CHECK CONSTRAINT [fk_soccode_blseducation]
GO
ALTER TABLE [dbo].[SOCCode]  WITH CHECK ADD  CONSTRAINT [fk_soccode_blstrainingcodes] FOREIGN KEY([Training])
REFERENCES [dbo].[BLSTrainingCodes] ([TrainingCode])
GO
ALTER TABLE [dbo].[SOCCode] CHECK CONSTRAINT [fk_soccode_blstrainingcodes]
GO
ALTER TABLE [dbo].[SOCCode]  WITH CHECK ADD  CONSTRAINT [fk_soccode_experience] FOREIGN KEY([Experience])
REFERENCES [dbo].[Experience] ([ExperienceCode])
GO
ALTER TABLE [dbo].[SOCCode] CHECK CONSTRAINT [fk_soccode_experience]
GO
ALTER TABLE [dbo].[SOCCode]  WITH CHECK ADD  CONSTRAINT [fk_soccode_occtypes] FOREIGN KEY([SOCCodeType])
REFERENCES [dbo].[OccTypes] ([CodeType])
GO
ALTER TABLE [dbo].[SOCCode] CHECK CONSTRAINT [fk_soccode_occtypes]
GO
ALTER TABLE [dbo].[SOCCode]  WITH CHECK ADD  CONSTRAINT [fk_soccode_soccode] FOREIGN KEY([SOCParent], [SOCParentCodeType])
REFERENCES [dbo].[SOCCode] ([SOCCode], [SOCCodeType])
GO
ALTER TABLE [dbo].[SOCCode] CHECK CONSTRAINT [fk_soccode_soccode]
GO
ALTER TABLE [dbo].[StateList]  WITH CHECK ADD  CONSTRAINT [fk_statelist_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[StateList] CHECK CONSTRAINT [fk_statelist_statefips]
GO
ALTER TABLE [dbo].[StateProgramCode]  WITH CHECK ADD  CONSTRAINT [fk_stateprogramcode_occcodes] FOREIGN KEY([StFips], [CIPCodeType], [CIPCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[StateProgramCode] CHECK CONSTRAINT [fk_stateprogramcode_occcodes]
GO
ALTER TABLE [dbo].[StateProgramCode]  WITH CHECK ADD  CONSTRAINT [fk_stateprogramcode_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[StateProgramCode] CHECK CONSTRAINT [fk_stateprogramcode_statefips]
GO
ALTER TABLE [dbo].[StatisticTypes]  WITH CHECK ADD  CONSTRAINT [fk_statistictypes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[StatisticTypes] CHECK CONSTRAINT [fk_statistictypes_statefips]
GO
ALTER TABLE [dbo].[SubGeographies]  WITH CHECK ADD  CONSTRAINT [fk_subgeographies_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[SubGeographies] CHECK CONSTRAINT [fk_subgeographies_geographies]
GO
ALTER TABLE [dbo].[SubGeographies]  WITH CHECK ADD  CONSTRAINT [fk_subgeographies_geographiessub] FOREIGN KEY([SubStFips], [SubAreaType], [SubAreaTypeVersion], [SubArea])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[SubGeographies] CHECK CONSTRAINT [fk_subgeographies_geographiessub]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_completertype] FOREIGN KEY([StFips], [CompleterType])
REFERENCES [dbo].[CompleterType] ([StFips], [CompleterType])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_completertype]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_geographies]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_institutionownership] FOREIGN KEY([InstOwn])
REFERENCES [dbo].[InstitutionOwnership] ([InstOwn])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_institutionownership]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_institutiontype] FOREIGN KEY([StFips], [InstType])
REFERENCES [dbo].[InstitutionType] ([StFips], [InstType])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_institutiontype]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_occcodes] FOREIGN KEY([StFips], [CodeType], [Code])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_occcodes]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_periods]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [fk_supply_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [fk_supply_periodyears]
GO
ALTER TABLE [dbo].[TableSource]  WITH CHECK ADD  CONSTRAINT [fk_tablesource_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[TableSource] CHECK CONSTRAINT [fk_tablesource_statefips]
GO
ALTER TABLE [dbo].[TableSource]  WITH CHECK ADD  CONSTRAINT [fk_tablesource_tablelist] FOREIGN KEY([TableName])
REFERENCES [dbo].[TableList] ([TableName])
GO
ALTER TABLE [dbo].[TableSource] CHECK CONSTRAINT [fk_tablesource_tablelist]
GO
ALTER TABLE [dbo].[TaxRevenues]  WITH CHECK ADD  CONSTRAINT [fk_taxrevenues_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[TaxRevenues] CHECK CONSTRAINT [fk_taxrevenues_geographies]
GO
ALTER TABLE [dbo].[TaxRevenues]  WITH CHECK ADD  CONSTRAINT [fk_taxrevenues_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[TaxRevenues] CHECK CONSTRAINT [fk_taxrevenues_periods]
GO
ALTER TABLE [dbo].[TaxRevenues]  WITH CHECK ADD  CONSTRAINT [fk_taxrevenues_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[TaxRevenues] CHECK CONSTRAINT [fk_taxrevenues_periodyears]
GO
ALTER TABLE [dbo].[TaxRevenues]  WITH CHECK ADD  CONSTRAINT [fk_taxrevenues_taxtype] FOREIGN KEY([StFips], [TaxType])
REFERENCES [dbo].[TaxType] ([StFips], [TaxType])
GO
ALTER TABLE [dbo].[TaxRevenues] CHECK CONSTRAINT [fk_taxrevenues_taxtype]
GO
ALTER TABLE [dbo].[TaxType]  WITH CHECK ADD  CONSTRAINT [fk_taxtype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[TaxType] CHECK CONSTRAINT [fk_taxtype_statefips]
GO
ALTER TABLE [dbo].[TransferPayments]  WITH CHECK ADD  CONSTRAINT [fk_transferpayments_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[TransferPayments] CHECK CONSTRAINT [fk_transferpayments_geographies]
GO
ALTER TABLE [dbo].[TransferPayments]  WITH CHECK ADD  CONSTRAINT [fk_transferpayments_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[TransferPayments] CHECK CONSTRAINT [fk_transferpayments_periods]
GO
ALTER TABLE [dbo].[TransferPayments]  WITH CHECK ADD  CONSTRAINT [fk_transferpayments_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[TransferPayments] CHECK CONSTRAINT [fk_transferpayments_periodyears]
GO
ALTER TABLE [dbo].[TransferPayments]  WITH CHECK ADD  CONSTRAINT [fk_transferpayments_transferpaymenttypes] FOREIGN KEY([StFips], [PaymentType])
REFERENCES [dbo].[TransferPaymentTypes] ([StFips], [PaymentType])
GO
ALTER TABLE [dbo].[TransferPayments] CHECK CONSTRAINT [fk_transferpayments_transferpaymenttypes]
GO
ALTER TABLE [dbo].[TransferPaymentTypes]  WITH CHECK ADD  CONSTRAINT [fk_transferpaymenttypes_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[TransferPaymentTypes] CHECK CONSTRAINT [fk_transferpaymenttypes_statefips]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_agegroups] FOREIGN KEY([AgeGroup])
REFERENCES [dbo].[AgeGroups] ([AgeGroup])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_agegroups]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([GenderCode])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_gender]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_geographies] FOREIGN KEY([StFips], [AreaType], [AreaTypeVersion], [Area])
REFERENCES [dbo].[Geographies] ([StFips], [AreaType], [AreaTypeVersion], [Area])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_geographies]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_industrycodes] FOREIGN KEY([StFips], [IndCodeType], [IndCode])
REFERENCES [dbo].[IndustryCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_industrycodes]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_occcodes] FOREIGN KEY([StFips], [OccCodeType], [OccCode])
REFERENCES [dbo].[OccCodes] ([StFips], [CodeType], [Code])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_occcodes]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_periods] FOREIGN KEY([PeriodType], [Period])
REFERENCES [dbo].[Periods] ([PeriodType], [Period])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_periods]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_periodyears] FOREIGN KEY([PeriodYear])
REFERENCES [dbo].[PeriodYears] ([PeriodYear])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_periodyears]
GO
ALTER TABLE [dbo].[UIClaims]  WITH CHECK ADD  CONSTRAINT [fk_uiclaims_racecodes] FOREIGN KEY([RaceCode])
REFERENCES [dbo].[RaceCodes] ([RaceCode])
GO
ALTER TABLE [dbo].[UIClaims] CHECK CONSTRAINT [fk_uiclaims_racecodes]
GO
ALTER TABLE [dbo].[UnitType]  WITH CHECK ADD  CONSTRAINT [fk_unittype_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[UnitType] CHECK CONSTRAINT [fk_unittype_statefips]
GO
ALTER TABLE [dbo].[WageSource]  WITH CHECK ADD  CONSTRAINT [fk_wagesource_statefips] FOREIGN KEY([StFips])
REFERENCES [dbo].[StateFips] ([StFips])
GO
ALTER TABLE [dbo].[WageSource] CHECK CONSTRAINT [fk_wagesource_statefips]
GO
USE [master]
GO
ALTER DATABASE [WID30] SET  READ_WRITE 
GO
