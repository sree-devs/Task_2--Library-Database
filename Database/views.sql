1. Loan History View:
 CREATE VIEW LoanHistoryView AS
 SELECT 
 M.Name AS MemberName,
 B.Title AS BookTitle,
 L.LoanDate,
 L.ReturnDate
 FROM Loans L
 JOIN Members M ON L.MemberID = M.MemberID
 JOIN Books B ON L.BookID = B.BookID;
 SELECT * FROM LoanHistoryView;


 2. Book Author Borrow Count View:
 CREATE VIEW BookAuthorBorrowCountView AS
 SELECT 
 B.BookID,
 B.Title AS BookTitle,
 A.Name AS AuthorName,
 COUNT(L.LoanID) AS TotalBorrows
 FROM Books B
 JOIN Authors A ON B.AuthorID = A.AuthorID
 LEFT JOIN Loans L ON B.BookID = L.BookID
 GROUP BY B.BookID, A.Name;
 View - SELECT * FROM BookAuthorBorrowCountView;