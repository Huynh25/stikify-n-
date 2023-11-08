USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Stiktify')
BEGIN
	ALTER DATABASE [Stiktify] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Stiktify] SET ONLINE;
	DROP DATABASE [Stiktify];
END

GO

CREATE DATABASE [Stiktify]
GO

USE [Stiktify]
GO

CREATE TABLE [USERS](
	[UserName] varchar(50)NOT NULL primary key,
	[Password] varchar(32) NOT NULL,
	[Email] varchar(30) NOT NULL,
	[Fullname] nvarchar(100) not null,
	[Gender] nvarchar(20) not null,
	[Birthdate] date NOT NULL,
	[Address] nvarchar(30) NOT NULL,
	[Avatar] nvarchar(30),

);


GO
CREATE PROC register
@username varchar(50),
@password varchar(32),
@email varchar(20),
@fullname nvarchar(100),
@gender nvarchar(20),
@birthdate date,
@address nvarchar(30),
@avatar nvarchar(30)
AS 
BEGIN
	insert into users
	values
		(@username, CONVERT(NVARCHAR(32),HashBytes('MD5', @password),2), @email, @fullname, @gender, @birthdate, @address, @avatar);
END
GO

go
create proc update_user
@username varchar(50),
@password varchar(32),
@email varchar(20),
@fullname nvarchar(100),
@gender nvarchar(20),
@birthdate date,
@address nvarchar(30),
@avatar nvarchar(30)
AS 
BEGIN
	update users
	set
		[Password]=CONVERT(NVARCHAR(32),HashBytes('MD5', @password),2),Email= @email,Fullname = @fullname,Gender = @gender,Birthdate = @birthdate,[Address] = @address, Avatar = @avatar where UserName=@username;
END
GO

go
insert into users
values
('giahuy', CONVERT(NVARCHAR(32),HashBytes('MD5', 'Gh@123'),2),'giahuy@gmail.com',  N'Trần Gia Huy', N'Nam', '2003-01-01', 'VN', 'Img/avt1.png'),
('namthuan',  CONVERT(NVARCHAR(32),HashBytes('MD5', 'Nt@123'),2),'namthuan@gmail.com', N'Trần Nguyễn Nam Thuận', N'Nam', '2003-01-01', 'VN', 'Img/avt6.png'),
('nhuhuynh',CONVERT(NVARCHAR(32),HashBytes('MD5', 'Nh@123'),2), 'nhuhuynh@gmail.com', N'Lê Như Huỳnh',  N'Nữ', '2003-01-01', 'VN', 'Img/avt2.png'),
('truongan',  CONVERT(NVARCHAR(32),HashBytes('MD5', 'Ta@123'),2),'truongan@gmail.com', N'Nguyễn Trường An', N'Nam', '2003-01-01', 'VN', 'Img/avt3.png'),
('congchinh', CONVERT(NVARCHAR(32),HashBytes('MD5', 'Cc@123'),2),'congchinh@gmail.com',  N'Trần Công Chính', N'Nam', '2003-01-01', 'VN', 'Img/avt5.png'),
('tanphat', CONVERT(NVARCHAR(32),HashBytes('MD5', 'Tp@123'),2),'tanphat@gmail.com',  N'Phạm Tấn Phát', N'Nam', '2003-01-01', 'VN', 'Img/avt4.png');
go

create table [TYPE]
(
	[Videotype] varchar(20) primary key,
	[NameType] nvarchar(100),
);

go
insert into [TYPE]
values
('edm',N'EDM'),
('cls',N'Classic'),
('pe',N'Thơ'),
('bl',N'Ballad'),
('rap',N'Rap'),
('lf',N'Lofi'),
('cmd',N'Comedy'),
('rm',N'Remix'),
('rk',N'Rock'),
('blr',N'Bolero');
go

CREATE TABLE [VIDEO](
	[VideoID] varchar(20) NOT NULL primary key,
	[Caption] nvarchar(100) NOT NULL,
	[NameOfMusic] ntext,
	[UrlVideo] nvarchar(40) NOT NULL,
	[DateUpload] date not NULL,
	[NumberView] int NOT NULL,
	[NumberLike] int NOT NULL,
	[VideoType] varchar(20) NOT NULL references [TYPE],
	[UserID] varchar(50) NOT NULL REFERENCES [USERS],
);

GO
INSERT INTO VIDEO
VALUES
('vid1', N'Nàng - cover', N'Nàng', N'Videos/video1.mp4', '2023-01-01',0,0,N'rap', 'nhuhuynh'),
('vid2', N'I need your love edm', N'I need your love', N'Videos/video2.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid3', N'Anh đã quen với cô đơn', N'Anh đã quen với cô đơn', N'Videos/video3.mp4', '2023-01-01',0,0,N'bl', 'congchinh'),
('vid4', N'Nhạc Trung', N'Nhạc trung', N'Videos/video4.mp4', '2023-01-01',0,0,N'rm', 'truongan'),
('vid5', N'Không thể cùng nhau suốt kiếp - cover', N'Không thể cùng nhau suốt kiếp', N'Videos/video5.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh'),
('vid6', N'Một nét tương tương họa vạn sầu...', N'Nhạc thơ Trung', N'Videos/video6.mp4', '2023-01-01',0,0,N'pe', 'namthuan'),
('vid7', N'Unity - cover MayBae', N'Unity', N'Videos/video7.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid8', N'Tiếng muỗi ấm chill', N'Tiếng muỗi ấm chill', N'Videos/video8.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh'),
('vid9', N'Guitar bass', N'Guitar music', N'Videos/video9.mp4', '2023-01-01',0,0,N'rk', 'truongan'),
('vid10', N'Sena on the mic', N'Sena on the mic - diva quanh ta', N'Videos/video10.mp4', '2023-01-01',0,0,N'cmd', 'giahuy'),
('vid11', N'Ininna Tora x My Love', N'Ininna Tora x My Love', N'Videos/video11.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid12', N'Ta mượn hồng trần hai nén  mực/ Họa nét tương tư họa bóng nàng', N'Nhạc thơ Trung', N'Videos/video12.mp4', '2023-01-01',0,0,N'pe', 'namthuan'),
('vid13', N'Bass guitar', N'Guitar music', N'Videos/video13.mp4', '2023-01-01',0,0,N'rk', 'tanphat'),
('vid14', N'Vùng ngoại ô', N'Vùng ngoại ô', N'Videos/video14.mp4', '2023-01-01',0,0,N'blr', 'congchinh'),
('vid15', N'Kiếp chồng chung - cover', N'Kiếp chồng chung', N'Videos/video15.mp4', '2023-01-01',0,0,N'bl', 'truongan'),
('vid16', N'Có mới nới cũ Remix', N'Có mới nới cũ', N'Videos/video16.mp4', '2023-01-01',0,0,N'rm', 'giahuy'),
('vid17', N'Đau ở đây này - flute', N'Đau ở đây này', N'Videos/video17.mp4', '2023-01-01',0,0,N'bl', 'truongan'),
('vid18', N'Dù cho mai về sau', N'Dù cho mai về sau', N'Videos/video18.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh'),
('vid19', N'Đàn tranh giả lập', N'Đàn tranh', N'Videos/video19.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh'),
('vid20', N'Dynasty - Maybae cover', N'Dynasty - maybae', N'Videos/video20.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid21', N'...', N'Nhạc thơ Trung ', N'Videos/video21.mp4', '2023-01-01',0,0,N'pe', 'namthuan'),
('vid22', N'Anh đi nhé lofi', N'Anh đi nhé', N'Videos/video22.mp4', '2023-01-01',0,0,N'lf', 'tanphat'),
('vid23', N'Violon', N'Violon music', N'Videos/video23.mp4', '2023-01-01',0,0,N'cls', 'congchinh'),
('vid24', N'Sáo trúc', N'Flute music', N'Videos/video24.mp4', '2023-01-01',0,0,N'bl', 'truongan'),
('vid25', N'Tattoo - Loreen', N'Tattoo', N'Videos/video25.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid26', N'edm', N'Nhạc EDM', N'Videos/video26.mp4', '2023-01-01',0,0,N'edm', 'giahuy'),
('vid27', N'Chill', N'Chill', N'Videos/video27.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh'),
('vid28', N'Theme anime - piano', N'Theme song anime', N'Videos/video28.mp4', '2023-01-01',0,0,N'cls', 'congchinh'),
('vid29', N'Four seasons -Spring', N'Four seasons - spring', N'Videos/video29.mp4', '2023-01-01',0,0,N'cls', 'congchinh'),
('vid30', N'Nhạc trung guitar', N'Nhạc Trung', N'Videos/video30.mp4', '2023-01-01',0,0,N'lf', 'nhuhuynh');
GO

CREATE TABLE [FAVOURITE_VIDEO]
(
	[VideoID] varchar(20) references[VIDEO],
	[UserID] varchar(50) references [USERS]

);

create table [COMMENT]
(
	[VideoID] varchar(20) not null references [VIDEO],
	[DateCmt] date not null,
	[UserID] varchar(50) not null references [USERS],
	[Cmt] ntext not null
);

Create table [FOLLOWER]
(
[Follower] varchar(50) REFERENCES [USERS] ([UserName]),
[Username] varchar(50) REFERENCES [USERS] ([UserName]),
);

Create table [FOLLOWING]
(
[Following] varchar(50) REFERENCES [USERS] ([UserName]),
[Username] varchar(50) REFERENCES [USERS] ([UserName]),
);

GO
CREATE PROC login
@username varchar(50),
@password varchar(32)
AS 
BEGIN
	SELECT * FROM [USERS] WHERE username=@username and password=CONVERT(NVARCHAR(32),HashBytes('MD5', @password),2)
END
GO


select * from USERS
select * from TYPE
select * from VIDEO