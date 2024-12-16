
Authors Table-
 CREATE TABLE Authors (
 AuthorID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL
 );

 Books Table- 
 CREATE TABLE Books (
 BookID INT AUTO_INCREMENT PRIMARY KEY,
 Title VARCHAR(200) NOT NULL,
 AuthorID INT NOT NULL,
 PublicationYear INT,
 FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
 );

  Members Table-
 CREATE TABLE Members (
 MemberID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 MembershipDate DATE NOT NULL
 );
 
  Loans Table- CREATE TABLE Loans (
 LoanID INT AUTO_INCREMENT PRIMARY KEY,
 BookID INT NOT NULL,
 MemberID INT NOT NULL,
 LoanDate DATE NOT NULL,
 ReturnDate DATE,
 FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
 FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
 );
Book Audit- CREATE TABLE Books_Audit (
 AuditID INT AUTO_INCREMENT PRIMARY KEY,
 ActionType VARCHAR(10),
 BookID INT,
 Title VARCHAR(200),
 AuthorID INT,
 PublicationYear INT,
 ChangedBy VARCHAR(50),
 ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




 Authors- INSERT INTO Authors (Name) VALUES
 ('J.K. Rowling'),
 ('George R.R. Martin'),
 ('J.R.R. Tolkien');
 Books- INSERT INTO Books (Title, AuthorID, PublicationYear) VALUES
 ('Harry Potter and the Sorcerer\'s Stone', 1, 1997),
 ('A Game of Thrones', 2, 1996),
 ('The Hobbit', 3, 1937); 
 Members- INSERT INTO Members (Name, MembershipDate) VALUES
 ('Alice', '2023-01-15'),
 ('Bob', '2023-03-22'),
 ('Charlie', '2023-05-10');
 Loans- INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES
 (1, 1, '2023-12-01', '2023-12-10'),
 (2, 2, '2023-12-05', NULL),
 (3, 3, '2023-12-07', NULL);

