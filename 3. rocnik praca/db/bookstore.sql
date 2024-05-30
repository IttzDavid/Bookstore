-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 30.Máj 2024, 13:03
-- Verzia serveru: 10.4.28-MariaDB
-- Verzia PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `bookstore`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `Topic` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `YearOfPublishing` int(11) DEFAULT NULL,
  `BookType` enum('e-book','physical copy') DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  `Rating` decimal(3,1) DEFAULT NULL,
  `InStore` int(11) DEFAULT 0,
  `Rented` int(11) DEFAULT 0,
  `Sold` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `books`
--

INSERT INTO `books` (`BookID`, `Name`, `Author`, `Genre`, `Publisher`, `Topic`, `Description`, `Pages`, `Price`, `YearOfPublishing`, `BookType`, `Language`, `Rating`, `InStore`, `Rented`, `Sold`) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'HarperCollins', 'Racial Injustice', 'A Pulitzer Prize-winning novel set in the American South during the 1930s, dealing with racial injustice and moral growth.', 281, 12.99, 1960, 'physical copy', 'English', 4.5, 59, 38, 10),
(2, '1984', 'George Orwell', 'Science Fiction', 'Secker & Warburg', 'Totalitarianism', 'A dystopian novel set in a totalitarian society, exploring themes of government surveillance, censorship, and control.', 328, 10.99, 1949, 'e-book', 'English', 4.8, 92, 25, 5),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', 'Thomas Egerton', 'Social Commentary', 'A classic romance novel set in early 19th-century England, exploring themes of marriage, class, and societal expectations.', 279, 9.99, 1813, 'physical copy', 'English', 4.7, 138, 27, 2),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Charles Scribner\'s Sons', 'American Dream', 'A novel set in the Jazz Age, exploring themes of decadence, idealism, and the corruption of the American Dream.', 218, 11.49, 1925, 'physical copy', 'English', 4.3, 141, 10, 6),
(5, 'Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Fantasy', 'Bloomsbury', 'Magic and Adventure', 'The first book in the Harry Potter series, following the journey of a young wizard, Harry Potter, as he discovers his magical heritage.', 309, 14.99, 1997, 'physical copy', 'English', 4.9, 53, 8, 14),
(6, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'Allen & Unwin', 'Adventure', 'A fantasy novel following the journey of Bilbo Baggins, a hobbit who embarks on an epic quest to reclaim the Lonely Mountain and its treasure from the dragon Smaug.', 310, 13.99, 1937, 'e-book', 'English', 4.6, 66, 30, 11),
(7, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'Little, Brown and Company', 'Adolescence', 'A coming-of-age novel following the adventures of Holden Caulfield, a disillusioned teenager navigating the complexities of adulthood.', 277, 10.49, 1951, 'physical copy', 'English', 4.4, 58, 33, 2),
(8, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 'Allen & Unwin', 'Epic Fantasy', 'A high fantasy novel set in the fictional world of Middle-earth, following the quest to destroy the One Ring and defeat the Dark Lord Sauron.', 1178, 24.99, 1954, 'physical copy', 'English', 4.9, 101, 11, 12),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', 'HarperCollins', 'Personal Legend', 'A philosophical novel following the journey of Santiago, a young shepherd, as he searches for his personal legend and discovers the true meaning of life.', 197, 9.49, 1988, 'e-book', 'English', 4.7, 101, 32, 13),
(10, 'The Da Vinci Code', 'Dan Brown', 'Thriller', 'Doubleday', 'Conspiracy', 'A thriller novel following Harvard symbologist Robert Langdon as he investigates a murder in the Louvre and discovers a trail of secrets hidden by the Catholic Church.', 454, 12.99, 2003, 'physical copy', 'English', 4.2, 101, 25, 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `previouspurchases`
--

CREATE TABLE `previouspurchases` (
  `PurchaseID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `previouspurchases`
--

INSERT INTO `previouspurchases` (`PurchaseID`, `UserID`, `BookID`, `PurchaseDate`) VALUES
(1, 1, 5, '2023-05-20'),
(2, 2, 3, '2023-06-10'),
(3, 3, 1, '2023-07-15'),
(4, 4, 2, '2023-08-05'),
(5, 5, 6, '2023-09-22'),
(6, 6, 8, '2023-10-18'),
(7, 7, 7, '2023-11-30'),
(8, 8, 9, '2023-12-12'),
(9, 9, 4, '2024-01-05'),
(10, 10, 10, '2024-02-20');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Surname`, `Username`, `Password`, `Email`, `Age`, `DateOfBirth`, `Country`) VALUES
(1, 'John', 'Doe', 'johndoe', 'password123', 'johndoe@example.com', 30, '1994-05-15', 'USA'),
(2, 'Alice', 'Smith', 'alicesmith', 'securepass', 'alice.smith@example.com', 25, '1999-10-22', 'Canada'),
(3, 'Bob', 'Johnson', 'bobjohnson', 'bobpass', 'bob.johnson@example.com', 35, '1989-03-08', 'UK'),
(4, 'Emily', 'Brown', 'emilybrown', 'emilypass', 'emily.brown@example.com', 28, '1996-12-01', 'Australia'),
(5, 'Michael', 'Wilson', 'michaelwilson', 'mikepass', 'michael.wilson@example.com', 40, '1982-07-11', 'Germany'),
(6, 'Emma', 'Taylor', 'emmataylor', 'password123', 'emma.taylor@example.com', 22, '2002-09-18', 'France'),
(7, 'David', 'Martinez', 'davidmartinez', 'davidpass', 'david.martinez@example.com', 33, '1989-11-30', 'Spain'),
(8, 'Sophia', 'Anderson', 'sophiaanderson', 'securepass', 'sophia.anderson@example.com', 27, '1997-08-25', 'Italy'),
(9, 'James', 'Garcia', 'jamesgarcia', 'jamespass', 'james.garcia@example.com', 31, '1993-04-14', 'Japan'),
(10, 'Olivia', 'Hernandez', 'oliviahernandez', 'password123', 'olivia.hernandez@example.com', 29, '1995-06-20', 'Mexico');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `wishlist`
--

CREATE TABLE `wishlist` (
  `WishlistID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `wishlist`
--

INSERT INTO `wishlist` (`WishlistID`, `UserID`, `BookID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexy pre tabuľku `previouspurchases`
--
ALTER TABLE `previouspurchases`
  ADD PRIMARY KEY (`PurchaseID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexy pre tabuľku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexy pre tabuľku `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`WishlistID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BookID` (`BookID`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `previouspurchases`
--
ALTER TABLE `previouspurchases`
  MODIFY `PurchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pre tabuľku `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `previouspurchases`
--
ALTER TABLE `previouspurchases`
  ADD CONSTRAINT `previouspurchases_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `previouspurchases_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);

--
-- Obmedzenie pre tabuľku `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
