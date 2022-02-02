CREATE TABLE [dbo].[MyphotoStoreinfolder]  
(  
    [ImageID] [int] IDENTITY(1,1) primary key NOT NULL,  
    [ImageName] [nvarchar](50) NULL,  
    [ImagePath] [nvarchar](200) NULL,  
    [ImageSize] [bigint] NULL,  
) ;
GO

SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  
CREATE PROC Usp_mypicsstoreinfolder  
@ImageName   nvarchar(50),  
@ImagePath      nvarchar(200),  
@ImageSize      bigint  
as  
begin  
INSERT INTO MyphotoStoreinfolder (  
[ImageName]  
, [ImagePath]  
, [ImageSize])  
VALUES (  
@ImageName,  
@ImagePath,  
@ImageSize)  
return @@IDENTITY  
end  
GO  