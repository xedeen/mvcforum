/****** Object:  Table [dbo].[WaterResult]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterResult](
	[Id] [uniqueidentifier] NOT NULL,	
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Hot] [int] NULL,
	[Cold] [int] NULL
 CONSTRAINT [PK_WaterResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO

/****** Object:  ForeignKey [FK_WaterResult_MembershipUser]    ******/
ALTER TABLE [dbo].[WaterResult]  WITH CHECK ADD CONSTRAINT [FK_WaterResult_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[WaterResult] CHECK CONSTRAINT [FK_WaterResult_MembershipUser]
GO

DELETE FROM [dbo].[Permission] WHERE [Id] IN (N'C2665EF4-1D9B-44CB-B01B-A40B00FBD81C',N'E7A96DED-CCC3-475D-A466-A40B00FBE152')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'C2665EF4-1D9B-44CB-B01B-A40B00FBD81C', N'Update Water Result')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'E7A96DED-CCC3-475D-A466-A40B00FBE152', N'Export Water Result')