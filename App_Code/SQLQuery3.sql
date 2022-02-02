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