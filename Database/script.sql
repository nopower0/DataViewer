USE [master]
GO
/****** Object:  Database [DataViewer]    Script Date: 2013/5/27 12:51:36 ******/
CREATE DATABASE [DataViewer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DataViewer.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DataViewer_0.ldf' , SIZE = 528KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DataViewer] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataViewer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataViewer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataViewer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataViewer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataViewer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataViewer] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataViewer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataViewer] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DataViewer] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [DataViewer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataViewer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataViewer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataViewer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataViewer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataViewer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataViewer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataViewer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataViewer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataViewer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataViewer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataViewer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataViewer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataViewer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataViewer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataViewer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataViewer] SET  MULTI_USER 
GO
ALTER DATABASE [DataViewer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataViewer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataViewer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataViewer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DataViewer]
GO
/****** Object:  StoredProcedure [dbo].[Administrator_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Administrator_Insert]
@username varchar(100),
@password char(32)
as
begin
insert into Administrators values (@username,@password);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Administrator_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Administrator_Update]
@id int,
@username varchar(100),
@password char(32)
as
begin
update Administrator set
username=@username,
[password]=@password
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Administrator_username]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Administrator_username]
@username varchar(100)
as
begin
select * from Administrators where username=@username
end
GO
/****** Object:  StoredProcedure [dbo].[Area_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Area_all]
as
begin
select * from Areas 
end
GO
/****** Object:  StoredProcedure [dbo].[Area_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Area_id]
@id int
as
begin
select * from Areas where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Area_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Area_Insert]
@projectid int,
@areaname nvarchar(10)
as
begin
insert into Areas(projectid,areaname) values(@projectid,@areaname)
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Area_projectid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Area_projectid]
@projectid int
as
begin
select * from Areas where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[Area_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Area_Update]
@id int,
@projectid int,
@areaname nvarchar(10)
as
begin
update Areas set
projectid=@projectid,
areaname=@areaname
where id=@id
end

GO
/****** Object:  StoredProcedure [dbo].[Company_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Company_all]
as
begin
select * from Companies
end
GO
/****** Object:  StoredProcedure [dbo].[Company_companynameFuzzy]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Company_companynameFuzzy]
@companyname nvarchar(200)
as
begin
select * from Companies where companyname like '%'+@companyname+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[Company_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Company_id]
@id int
as
begin
select * from Companies where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Company_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Company_Insert]
@companyname nvarchar(200),
@legalrepresentative nvarchar(100),
@address nvarchar(500)
as
begin
insert into Companies(companyname,legalrepresentative,[address]) values (@companyname,@legalrepresentative,@address);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Company_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Company_Update]
@id int,
@companyname nvarchar(200),
@legalrepresentative nvarchar(100),
@address nvarchar(500)
as
begin
update Companies set
companyname=@companyname,
legalrepresentative=@legalrepresentative,
[address]=@address
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_acquireon_areaid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_acquireon_areaid]
@areaid int
as
begin
select distinct(acquireon) from Concentrations where nodeid in (select id from Nodes where areaid=@areaid) order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_acquireon_areaidANDendtime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_acquireon_areaidANDendtime]
@areaid int,
@endtime datetime
as
begin
select distinct(acquireon)
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon <= @endtime
order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_acquireon_areaidANDstarttime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_acquireon_areaidANDstarttime]
@areaid int,
@starttime datetime
as
begin
select distinct(acquireon)
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon >= @starttime
order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_acquireon_areaidANDstarttimeANDendtime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_acquireon_areaidANDstarttimeANDendtime]
@areaid int,
@starttime datetime,
@endtime datetime
as
begin
select distinct(acquireon)
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon >= @starttime
and acquireon <= @endtime
order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_amountAverage_areaid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_amountAverage_areaid]
@areaid int
as
begin
select avg(amount) as average_amount,acquireon from Concentrations where nodeid in (select id from Nodes where areaid=@areaid) and amount>0 group by acquireon order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_areaid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_areaid]
@areaid int
as
begin
select * from Concentrations where nodeid in (select id from Nodes where areaid=@areaid) order by acquireon desc, nodeid asc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_areaidANDendtime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_areaidANDendtime]
@areaid int,
@endtime datetime
as
begin
select *
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon <= @endtime
order by acquireon desc, nodeid asc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_areaidANDstarttime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_areaidANDstarttime]
@areaid int,
@starttime datetime
as
begin
select *
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon >= @starttime
order by acquireon desc, nodeid asc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_areaidANDstarttimeANDendtime]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_areaidANDstarttimeANDendtime]
@areaid int,
@starttime datetime,
@endtime datetime
as
begin
select *
from Concentrations
where nodeid in (select id from Nodes where areaid=@areaid)
and acquireon >= @starttime
and acquireon <= @endtime
order by acquireon desc, nodeid asc
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_Insert]
@nodeid int,
@acquireon datetime,
@amount float
as
begin
insert into
Concentrations(nodeid,acquireon,amount) values
(@nodeid,@acquireon,@amount)
end
GO
/****** Object:  StoredProcedure [dbo].[Concentration_nodeid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Concentration_nodeid]
@nodeid int
as
begin
select * from Concentrations where nodeid=@nodeid order by acquireon desc
end
GO
/****** Object:  StoredProcedure [dbo].[Node_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Node_all]
as
begin
select * from Nodes
end
GO
/****** Object:  StoredProcedure [dbo].[Node_areaid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Node_areaid]
@areaid int
as
begin
select * from Nodes where areaid=@areaid
end
GO
/****** Object:  StoredProcedure [dbo].[Node_areaidANDhardwareid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Node_areaidANDhardwareid]
@areaid int,
@hardwareid int
as
begin
select * from Nodes where areaid=@areaid and hardwareid=@hardwareid
end
GO
/****** Object:  StoredProcedure [dbo].[Node_Delete]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Node_Delete]
@id int
as
begin
delete from Nodes where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Node_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Node_id]
@id int
as
begin
select * from Nodes where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Node_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Node_Insert]
@hardwareid int,
@areaid int,
@description nvarchar(500)
as
begin
insert into
Nodes(hardwareid,areaid,[description]) values
(@hardwareid,@areaid,@description);
select @@IDENTITY;
end
GO
/****** Object:  StoredProcedure [dbo].[Node_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Node_Update]
@id int,
@hardwareid int,
@areaid int,
@description nvarchar(500)
as
begin
update Nodes set
hardwareid=@hardwareid,
areaid=@areaid,
[description]=@description
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Project_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project_all]
as
begin
select * from Projects
end
GO
/****** Object:  StoredProcedure [dbo].[Project_finish]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project_finish]
as
begin
select * from Projects where endon_fact is not NULL
end
GO
/****** Object:  StoredProcedure [dbo].[Project_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project_id]
@id int
as
begin
select * from Projects where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Project_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project_Insert]
@projectname nvarchar(200),
@companyid int,
@regionid int,
@dutyofficer_name nvarchar(100),
@dutyofficer_phonenumber varchar(20),
@starton date,
@endon_plan date,
@endon_fact date,
@location_east float,
@location_north float,
@node_phone char(11)
as
begin
insert into
Projects(projectname,companyid,regionid,dutyofficer_name,dutyofficer_phonenumber,starton,endon_plan,endon_fact,location_east,location_north,node_phone)
values (@projectname,@companyid,@regionid,@dutyofficer_name,@dutyofficer_phonenumber,@starton,@endon_plan,@endon_fact,@location_east,@location_north,@node_phone);
select @@IDENTITY;
end
GO
/****** Object:  StoredProcedure [dbo].[Project_projectnameFuzzy]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project_projectnameFuzzy]
@projectname nvarchar(500)
as
begin
select * from Projects
where projectname like '%'+@projectname+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[Project_unfinish]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project_unfinish]
as
begin
select * from Projects where endon_fact is NULL
end
GO
/****** Object:  StoredProcedure [dbo].[Project_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project_Update]
@id int,
@projectname nvarchar(200),
@companyid int,
@regionid int,
@dutyofficer_name nvarchar(100),
@dutyofficer_phonenumber varchar(20),
@starton date,
@endon_plan date,
@endon_fact date,
@location_east float,
@location_north float,
@node_phone char(11)
as
begin
update Projects set
projectname=@projectname,
companyid=@companyid,
regionid=@regionid,
dutyofficer_name=@dutyofficer_name,
dutyofficer_phonenumber=@dutyofficer_phonenumber,
starton=@starton,
endon_plan=@endon_plan,
endon_fact=@endon_fact,
location_east=@location_east,
location_north=@location_north,
node_phone=@node_phone
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Project-SupervisionDepartment_Delete_projectid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project-SupervisionDepartment_Delete_projectid]
@projectid int
as
begin
delete from [Project-SupervisionDepartment] where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[Project-SupervisionDepartment_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project-SupervisionDepartment_Insert]
@projectid int,
@supervisiondepartmentid int
as
begin
insert into [Project-SupervisionDepartment](projectid,supervisiondepartmentid)
values (@projectid,@supervisiondepartmentid)
end
GO
/****** Object:  StoredProcedure [dbo].[Project-SupervisionDepartment_projectid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Project-SupervisionDepartment_projectid]
@projectid int
as
begin
select * from [Project-SupervisionDepartment] where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[Project-Team_Delete_projectid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project-Team_Delete_projectid]
@projectid int
as
begin
delete from [Project-Team] where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[Project-Team_Delete_teamid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project-Team_Delete_teamid]
@teamid int
as
begin
delete from [Project-Team] where teamid=@teamid
end
GO
/****** Object:  StoredProcedure [dbo].[Project-Team_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project-Team_Insert]
@projectid int,
@teamid int,
@dutyofficer_name nvarchar(100),
@dutyofficer_phonenumber nvarchar(20)
as
begin
insert into [Project-Team](projectid,teamid,dutyofficer_name,dutyofficer_phonenumber)
values(@projectid,@teamid,@dutyofficer_name,@dutyofficer_phonenumber)
end
GO
/****** Object:  StoredProcedure [dbo].[Project-Team_projectid]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Project-Team_projectid]
@projectid int
as
begin
select * from [Project-Team] where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[Region_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Region_all]
as
begin
select * from Regions
end
GO
/****** Object:  StoredProcedure [dbo].[Region_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Region_id]
@id int
as
begin
select * from Regions where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Region_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Region_Insert]
@regionname nvarchar(20)
as
begin
insert into Regions(regionname) values(@regionname);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Region_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Region_Update]
@id int,
@regionname nvarchar(20)
as
begin
update Regions set
regionname=@regionname
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SupervisionDepartment_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SupervisionDepartment_all]
as
begin
select * from SupervisionDepartments
end
GO
/****** Object:  StoredProcedure [dbo].[SupervisionDepartment_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SupervisionDepartment_id]
@id int
as
begin
select * from SupervisionDepartments where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SupervisionDepartment_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SupervisionDepartment_Insert]
@departmentname nvarchar(20),
@phonenumber varchar(20)
as
begin
insert into SupervisionDepartments(departmentname,phonenumber)
values(@departmentname,@phonenumber);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[SupervisionDepartment_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SupervisionDepartment_Update]
@id int,
@departmentname nvarchar(20),
@phonenumber varchar(20)
as
begin
update SupervisionDepartments set
departmentname=@departmentname,
phonenumber=@phonenumber
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Team_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Team_all]
as
begin
select * from Teams
end
GO
/****** Object:  StoredProcedure [dbo].[Team_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Team_id]
@id int
as
begin
select * from Teams where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Team_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Team_Insert]
@teamname nvarchar(200),
@legalrepresentative nvarchar(100),
@address nvarchar(500),
@teamlevelid int,
@teamtypeid int
as
begin
insert into Teams(teamname,legalrepresentative,[address],teamlevelid,teamtypeid)
values (@teamname,@legalrepresentative,@address,@teamlevelid,@teamtypeid);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Team_teamnameFuzzy]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Team_teamnameFuzzy]
@teamname nvarchar(200)
as
begin
select * from Teams where teamname like '%'+@teamname+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[Team_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Team_Update]
@id int,
@teamname nvarchar(200),
@legalrepresentative nvarchar(100),
@address nvarchar(500),
@teamlevelid int,
@teamtypeid int
as
begin
update Teams set
teamname=@teamname,
legalrepresentative=@legalrepresentative,
[address]=@address,
teamlevelid=@teamlevelid,
teamtypeid=@teamtypeid
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[TeamLevel_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamLevel_all]
as
begin
select * from TeamLevels
end
GO
/****** Object:  StoredProcedure [dbo].[TeamLevel_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamLevel_id]
@id int
as
begin
select * from TeamLevels where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[TeamLevel_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamLevel_Insert]
@levelname nvarchar(20)
as
begin
insert into TeamLevels(levelname) values(@levelname);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[TeamLevel_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamLevel_Update]
@id int,
@levelname nvarchar(20)
as
begin
update TeamLevels set
levelname=@levelname
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[TeamType_all]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamType_all]
as
begin
select * from TeamTypes
end
GO
/****** Object:  StoredProcedure [dbo].[TeamType_id]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamType_id]
@id int
as
begin
select * from TeamTypes where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[TeamType_Insert]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamType_Insert]
@typename nvarchar(20)
as
begin
insert into TeamTypes(typename) values(@typename);
select @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[TeamType_Update]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeamType_Update]
@id int,
@typename nvarchar(20)
as
begin
update TeamTypes set
typename=@typename
where id=@id
end
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [char](32) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectid] [int] NOT NULL,
	[areaname] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](200) NOT NULL,
	[legalrepresentative] [nvarchar](100) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK__Companie__3213E83F059E309F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concentrations]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concentrations](
	[nodeid] [int] NOT NULL,
	[acquireon] [datetime] NOT NULL,
	[amount] [float] NOT NULL,
 CONSTRAINT [PK_Concentrations_1] PRIMARY KEY CLUSTERED 
(
	[nodeid] ASC,
	[acquireon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hardwareid] [int] NOT NULL,
	[areaid] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_DustData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectname] [nvarchar](200) NOT NULL,
	[companyid] [int] NOT NULL,
	[regionid] [int] NOT NULL,
	[dutyofficer_name] [nvarchar](100) NOT NULL,
	[dutyofficer_phonenumber] [varchar](20) NOT NULL,
	[starton] [date] NOT NULL,
	[endon_plan] [date] NOT NULL,
	[endon_fact] [date] NULL,
	[location_east] [float] NOT NULL,
	[location_north] [float] NOT NULL,
	[node_phone] [char](11) NOT NULL,
 CONSTRAINT [PK__Project__3213E83F073DA810] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project-SupervisionDepartment]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project-SupervisionDepartment](
	[projectid] [int] NOT NULL,
	[supervisiondepartmentid] [int] NOT NULL,
 CONSTRAINT [PK_Project_SupervisionDepartment] PRIMARY KEY CLUSTERED 
(
	[projectid] ASC,
	[supervisiondepartmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project-Team]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project-Team](
	[projectid] [int] NOT NULL,
	[teamid] [int] NOT NULL,
	[dutyofficer_name] [nvarchar](100) NOT NULL,
	[dutyofficer_phonenumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Project_Team] PRIMARY KEY CLUSTERED 
(
	[projectid] ASC,
	[teamid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[regionname] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupervisionDepartments]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupervisionDepartments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departmentname] [nvarchar](20) NOT NULL,
	[phonenumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SupervisionDepartments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamLevels]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamLevels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[levelname] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TeamLevels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teams]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teamname] [nvarchar](200) NOT NULL,
	[legalrepresentative] [nvarchar](100) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[teamlevelid] [int] NOT NULL,
	[teamtypeid] [int] NOT NULL,
 CONSTRAINT [PK__Teams__3213E83FDDFE1CEB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeamTypes]    Script Date: 2013/5/27 12:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typename] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TeamTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_Projects] FOREIGN KEY([projectid])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_Projects]
GO
ALTER TABLE [dbo].[Concentrations]  WITH CHECK ADD  CONSTRAINT [FK_Concentrations_Nodes] FOREIGN KEY([nodeid])
REFERENCES [dbo].[Nodes] ([id])
GO
ALTER TABLE [dbo].[Concentrations] CHECK CONSTRAINT [FK_Concentrations_Nodes]
GO
ALTER TABLE [dbo].[Nodes]  WITH CHECK ADD  CONSTRAINT [FK_Nodes_Areas] FOREIGN KEY([areaid])
REFERENCES [dbo].[Areas] ([id])
GO
ALTER TABLE [dbo].[Nodes] CHECK CONSTRAINT [FK_Nodes_Areas]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Companies] FOREIGN KEY([companyid])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Companies]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Regions] FOREIGN KEY([regionid])
REFERENCES [dbo].[Regions] ([id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Regions]
GO
ALTER TABLE [dbo].[Project-SupervisionDepartment]  WITH CHECK ADD  CONSTRAINT [FK_Project_SupervisionDepartment_Projects] FOREIGN KEY([projectid])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Project-SupervisionDepartment] CHECK CONSTRAINT [FK_Project_SupervisionDepartment_Projects]
GO
ALTER TABLE [dbo].[Project-SupervisionDepartment]  WITH CHECK ADD  CONSTRAINT [FK_Project_SupervisionDepartment_SupervisionDepartments] FOREIGN KEY([supervisiondepartmentid])
REFERENCES [dbo].[SupervisionDepartments] ([id])
GO
ALTER TABLE [dbo].[Project-SupervisionDepartment] CHECK CONSTRAINT [FK_Project_SupervisionDepartment_SupervisionDepartments]
GO
ALTER TABLE [dbo].[Project-Team]  WITH CHECK ADD  CONSTRAINT [FK_Project_Team_Projects] FOREIGN KEY([projectid])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Project-Team] CHECK CONSTRAINT [FK_Project_Team_Projects]
GO
ALTER TABLE [dbo].[Project-Team]  WITH CHECK ADD  CONSTRAINT [FK_Project_Team_Teams] FOREIGN KEY([teamid])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Project-Team] CHECK CONSTRAINT [FK_Project_Team_Teams]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_TeamLevels] FOREIGN KEY([teamlevelid])
REFERENCES [dbo].[TeamLevels] ([id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_TeamLevels]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_TeamTypes] FOREIGN KEY([teamtypeid])
REFERENCES [dbo].[TeamTypes] ([id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_TeamTypes]
GO
USE [master]
GO
ALTER DATABASE [DataViewer] SET  READ_WRITE 
GO
