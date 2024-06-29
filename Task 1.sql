

-- Create a table for books
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Author VARCHAR(255) NOT NULL,
  Category VARCHAR(255) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  Status VARCHAR(255) NOT NULL,  -- Available or Issued
  Quantity INT NOT NULL
);

-- Create a table for users
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL
);

-- Create a table for issued books
CREATE TABLE IssuedBooks (
  IssueID INT PRIMARY KEY,
  BookID INT NOT NULL,
  UserID INT NOT NULL,
  IssueDate DATE NOT NULL,
  ReturnDate DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert some sample data
INSERT INTO Books (BookID, Title, Author, Category, Price, Status, Quantity)
VALUES
  (1, 'The Alchemist', ' Paulo Coelho', 'Fiction', 250.00, 'Available', 5),
  (2, 'The Immortals of Meluha', 'Amish Tripathi', 'Mythology', 300.00, 'Available', 3),
  (3, 'The 3 Mistakes of My Life', 'Chetan Bhagat', 'Fiction', 200.00, 'Available', 2),
  (4, 'The Palace of Illusions', 'Chitra Banerjee Divakaruni', 'Mythology', 220.00, 'Available', 4),
  (5, 'Five Point Someone', 'Chetan Bhagat', 'Fiction', 180.00, 'Available', 6);

INSERT INTO Users (UserID, Name, Email, Password)
VALUES
  (1, 'Rahul Sharma', 'rahulsharma@example.com', 'password123'),
  (2, 'Priya Patel', 'priyapatel@example.com', 'password456');

-- Query to display all books
SELECT * FROM Books;


-- Query to display books by category
SELECT * FROM Books WHERE Category = 'Fiction';


-- Query to issue a book
INSERT INTO IssuedBooks (BookID, UserID, IssueDate, ReturnDate)
VALUES (1, 1, '2022-01-01', '2022-01-15');

-- Query to display issued books
SELECT * FROM IssuedBooks;

