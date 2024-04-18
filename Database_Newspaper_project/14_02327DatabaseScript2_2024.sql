use projectGroup14;

#5
INSERT INTO Articles (Title, JourID, JourRole, Topic, ReadingCount, Text, PhotoID)
VALUES ('New Article Title', '17-05-99-2049', 'Author', 'Technology', 0, 'This is the text of the new article.', NULL);
select * from articles;

DELETE FROM Articles where Title = 'arctic melting';
select * from articles;

UPDATE Articles SET ReadingCount = 100 WHERE Title = 'Sorrow over the loss of the queen';
select * from articles;

#6
SELECT Topic, Title, MAX(ReadingCount) AS MaxReads
FROM Articles
GROUP BY Topic;


SELECT JourID, SUM(ReadingCount) AS TotalReads
FROM Articles
GROUP BY JourID
ORDER BY TotalReads DESC
LIMIT 10;


SELECT JourID
FROM Photo
GROUP BY JourID
HAVING COUNT(PhotoID) = 1;


SELECT Topic, AVG(ReadingCount) AS AvgReads
FROM Articles
GROUP BY Topic
HAVING AVG(ReadingCount) < (SELECT AVG(ReadingCount) FROM Articles);

SELECT DISTINCT a.JourID
FROM Articles a
INNER JOIN Photo p ON a.JourID = p.JourID
WHERE a.JourRole = 'Author' AND p.JourID = a.JourID;

#7
DROP FUNCTION IF EXISTS CalculateAverageReadingCount;
DROP PROCEDURE IF EXISTS GetArticlesByJournalist;
DROP TRIGGER IF EXISTS AfterInsertArticle;

DELIMITER $$
CREATE FUNCTION CalculateAverageReadingCount()
RETURNS DECIMAL(10,2)
BEGIN
    RETURN (SELECT AVG(CAST(ReadingCount AS DECIMAL(10,2))) FROM Articles);
END$$
DELIMITER ;
SELECT CalculateAverageReadingCount() AS AverageReadingCount;


DELIMITER $$

CREATE PROCEDURE GetArticlesByJournalist(IN journalist_id VARCHAR(50))
BEGIN
    SELECT * FROM Article WHERE JourID = journalist_id;
END$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER AfterInsertArticle
AFTER INSERT ON Article
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (Action, TableName, ArticleID) VALUES ('INSERT', 'Article', NEW.ArticleID);
END;
DELIMITER ;