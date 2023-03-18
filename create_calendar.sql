SET NOCOUNT ON;
DECLARE @startDate smalldatetime, @endDate smalldatetime, @i int;
SELECT @i = 1, @startDate = 'Jan 01, 2015'
, @endDate = DATEADD (yy, 12, @startDate);
IF EXISTS(SELECT *
FROM sysobjects
WHERE ID = (OBJECT_ID('dbo.sequence')) AND xtype = 'U')
DROP TABLE dbo.sequence;
CREATE TABLE dbo.sequence
(
    num int NOT NULL
);
WHILE(@i <= (SELECT DATEDIFF(dd, @startDate, @endDate)))    BEGIN
    INSERT INTO dbo.sequence
    VALUES(@i);
    SET @i = @i + 1;
END