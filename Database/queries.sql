1. List all books currently on loan (i.e., ReturnDate is NULL):
 SELECT B.BookID, B.Title, A.Name AS Author, L.LoanDate
 FROM Books B
 JOIN Authors A ON B.AuthorID = A.AuthorID
 JOIN Loans L ON B.BookID = L.BookID
 WHERE L.ReturnDate IS NULL;

 2. Find the most borrowed author (author whose books have been borrowed the most):
 SELECT A.Name AS Author, COUNT(L.LoanID) AS BorrowedCount
 FROM Authors A
 JOIN Books B ON A.AuthorID = B.AuthorID
 JOIN Loans L ON B.BookID = L.BookID
 GROUP BY A.AuthorID
 ORDER BY BorrowedCount DESC
 LIMIT 1;

 3. Retrieve members with overdue books (based on ReturnDate being in the past):
 SELECT M.Name AS Member, L.LoanDate, L.ReturnDate
 FROM Members M
 JOIN Loans L ON M.MemberID = L.MemberID
 WHERE L.ReturnDate < CURDATE() AND L.ReturnDate IS NOT NULL;
