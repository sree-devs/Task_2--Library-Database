
 DELIMITER $$
 CREATE TRIGGER after_books_update
 AFTER UPDATE ON Books
 FOR EACH ROW
 BEGIN
 INSERT INTO Books_Audit (ActionType, BookID, Title, AuthorID, PublicationYear, ChangedBy)
 VALUES ('UPDATE', OLD.BookID, OLD.Title, OLD.AuthorID, OLD.PublicationYear, 'System');
 END$$
 DELIMITER ;


 DELIMITER $$
 CREATE TRIGGER after_books_delete
 CREATE TRIGGER after_books_delete
 AFTER DELETE ON Books
 FOR EACH ROW
 BEGIN
 INSERT INTO Books_Audit (ActionType, BookID, Title, AuthorID, PublicationYear, ChangedBy)
 VALUES ('DELETE', OLD.BookID, OLD.Title, OLD.AuthorID, OLD.PublicationYear, 'System');
 END$$
 DELIMITER ;

UPDATE Books
SET Title = 'New Book Title'
WHERE BookID = 1;
DELETE FROM Books
WHERE BookID = 1;
SELECT * FROM Books_Audit;

 