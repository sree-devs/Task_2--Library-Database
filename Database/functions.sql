1. Calculate Fine:
 DELIMITER $$
 CREATE FUNCTION CalculateFine(loanID INT)
 RETURNS DECIMAL(10, 2)
 DETERMINISTIC
 BEGIN
 DECLARE fine DECIMAL(10, 2);
 DECLARE returnDate DATE;
 DECLARE loanDate DATE;
 SELECT LoanDate, ReturnDate INTO loanDate, returnDate
 FROM Loans
 WHERE LoanID = loanID
 LIMIT 1; 
 IF returnDate < CURDATE() THEN
 SET fine = DATEDIFF(CURDATE(), returnDate) * 1.00; 
 ELSE
 SET fine = 0;
 END IF;
 RETURN fine;
 END$$
 DELIMITER ;
 View - SELECT LoanID, CalculateFine(LoanID) AS Fine
 FROM Loans
 WHERE LoanID = 2;