CREATE TABLE BookCategories
(
  CategoryID	int NOT NULL PRIMARY KEY,
  Category		varchar(30) NOT NULL
); 

GO


CREATE TABLE ReservedBook
(
	  CategoryID		int FOREIGN KEY REFERENCES BookCategories(CategoryID),
	  AddedTime			date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  NumberOfBooks		int NOT NULL default 0 
);
GO

CREATE TABLE Course
(
    [CourseId]       INT          IDENTITY (1, 1) NOT NULL,
    [CourseName]     VARCHAR (50) NULL,
    [CourseDuration] VARCHAR (30) NULL
);


CREATE TABLE MyphotoStoreinfolder  
(  
    [ImageID]   [int]       IDENTITY(1,1) primary key NOT NULL,  
    [ImageName] [nvarchar](50) NULL,  
    [ImagePath] [nvarchar](200) NULL,  
    [ImageSize] [bigint] NULL,  
) ;
