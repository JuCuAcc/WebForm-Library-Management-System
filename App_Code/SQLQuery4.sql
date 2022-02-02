--To insert the image details
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  
CREATE PROC [dbo].[Usp_mypicsstoreinfolder]  
@ImageName   nvarchar(50),  
@ImagePath      nvarchar(200),  
@ImageSize      bigint  
as  
begin  
INSERT INTO [dbo].[MyphotoStoreinfolder] (  
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




--To retrieve a record by ID

create proc Usp_GetPicbyImageIDfromFolder  
@ImageID int  
as   
begin  
SELECT  
            ps.ImageID,  
            ps.ImageName,  
            ps.ImageSize,  
            ps.ImagePath  
FROM MyphotoStoreinfolder ps  
where ps.ImageID = @ImageID  
end 

GO