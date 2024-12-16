1. Adding new books:
 DELIMITER $$
 CREATE PROCEDURE AddNewBook(
 IN bookTitle VARCHAR (255),
 IN authorID INT,
 IN publicationYear INT
 )
 BEGIN
 INSERT INTO Books (Title, AuthorID, PublicationYear)
 VALUES (bookTitle, authorID, publicationYear);
 END$$
 DELIMITER;

 Usage - CALL AddNewBook('The Great Gatsby', 1, 1925);



 2.Adding a New Author:
 DELIMITER $$
 CREATE PROCEDURE AddNewAuthor(IN authorName VARCHAR(255))
 BEGIN
 INSERT INTO Authors (Name) VALUES (authorName);
 END$$
 DELIMITER ;

 Usage - CALL AddAuthor('F. Scott Fitzgerald');


 3.Adding  a New Member:
 DELIMITER $$
 CREATE PROCEDURE AddNewMember(
 IN memberName VARCHAR(255),
 IN membershipDate DATE
 )
 BEGIN
 INSERT INTO Members (Name, MembershipDate)
 VALUES (memberName, membershipDate);
 END$$
 DELIMITER ;

 Usage - CALL AddNewMember(‘john Doe’, ‘2024-01-01’);


 4. Adding loan :
 DELIMITER $$
 CREATE PROCEDURE AddNewLoan(
 IN bookID INT,
 IN memberID INT,
 IN loanDate DATE
 )
 BEGIN
 INSERT INTO Loans (BookID, MemberID, LoanDate)
 VALUES (bookID, memberID, loanDate);
 END$$
 DELIMITER ;

 Usage - CALL AddNewLoan(1,2, ‘2024-06-09’);


 4. Getting Member Details:

 DELIMITER $$
 CREATE PROCEDURE GetMemberDetails(IN memberID INT)
 BEGIN
 SELECT * FROM Members WHERE MemberID = memberID;
 SELECT B.BookID, B.Title, L.LoanDate, L.ReturnDate
 FROM Loans L
 JOIN Books B ON L.BookID = B.BookID
 WHERE L.MemberID = memberID;
 END$$
 DELIMITER ;

 5. Getting  Overdue Books:

 DELIMITER $$
 CREATE PROCEDURE GetOverdueBooks()
 BEGIN
 -- Retrieve overdue books and calculate fines
 SELECT B.BookID, B.Title, M.Name AS MemberName, L.LoanDate, L.ReturnDate,
 DATEDIFF(CURDATE(), L.LoanDate) AS OverdueDays,
 DATEDIFF(CURDATE(), L.LoanDate) * 1.00 AS FineAmount
 FROM Loans L
 JOIN Books B ON L.BookID = B.BookID
 JOIN Members M ON L.MemberID = M.MemberID
 WHERE L.ReturnDate IS NULL AND L.LoanDate < CURDATE();
 END$$
 DELIMITER ;


 