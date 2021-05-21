-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2021 at 05:02 AM
-- Server version: 10.4.18-MariaDB-log
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_lantiguc`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `streetAddress` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `firstName`, `lastName`, `phone`, `email`, `streetAddress`, `city`, `state`, `zipcode`) VALUES
(2, 'Joe', 'Johnson', 1231231234, 'joe@yahoo.com', '123 Street', 'Kansas City', 'MO', 64001),
(7, 'Manny', 'POle', 777777777, 'manny@gmail.com	', '23 Hershey Street', 'Lancaster', 'PA', 12231),
(10, 'Mary', 'Su', 221333444, 'sumary@aim.com', '87 Maker Place', 'Stricker City', 'NY', 10510);

-- --------------------------------------------------------

--
-- Table structure for table `employeeOrders`
--

CREATE TABLE `employeeOrders` (
  `employeeID_fk` int(11) NOT NULL,
  `orderID_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeeOrders`
--

INSERT INTO `employeeOrders` (`employeeID_fk`, `orderID_fk`) VALUES
(2, 3),
(3, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `employeeID` int(11) NOT NULL,
  `eFirstName` text NOT NULL,
  `eLastName` text DEFAULT NULL,
  `eEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`employeeID`, `eFirstName`, `eLastName`, `eEmail`) VALUES
(1, 'Bill', 'Bob', 'blbob@luigis.com'),
(2, 'Rose', 'Flower', 'patrick@luigis.com'),
(3, 'Patrick', '', 'patrick@luigis.com');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `orderID` int(11) NOT NULL,
  `dateOrdered` date NOT NULL,
  `orderedBy` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`orderID`, `dateOrdered`, `orderedBy`, `employeeID`) VALUES
(1, '2021-02-12', 7, 1),
(2, '2020-04-12', 2, 1),
(3, '2021-04-28', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL,
  `paidBy` int(11) NOT NULL,
  `amountPaid` decimal(10,0) NOT NULL,
  `datePaid` date NOT NULL,
  `paymentType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `paidBy`, `amountPaid`, `datePaid`, `paymentType`) VALUES
(1, 2, '3', '2021-03-21', 'CASH'),
(4, 2, '9', '2021-04-21', 'CREDIT'),
(7, 7, '9', '2021-03-21', 'CASH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `customerID` (`customerID`);

--
-- Indexes for table `employeeOrders`
--
ALTER TABLE `employeeOrders`
  ADD KEY `employeeID_fk` (`employeeID_fk`) USING BTREE,
  ADD KEY `orderID_fk` (`orderID_fk`) USING BTREE;

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `employeeID` (`employeeID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`orderID`),
  ADD UNIQUE KEY `orderID` (`orderID`),
  ADD KEY `orderedBy` (`orderedBy`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `paymentID` (`paymentID`),
  ADD KEY `payments_ibfk_1` (`paidBy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeeOrders`
--
ALTER TABLE `employeeOrders`
  ADD CONSTRAINT `employeeOrders_ibfk_1` FOREIGN KEY (`employeeID_fk`) REFERENCES `Employees` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employeeOrders_ibfk_2` FOREIGN KEY (`orderID_fk`) REFERENCES `Orders` (`orderID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`orderedBy`) REFERENCES `customers` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `Employees` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`paidBy`) REFERENCES `customers` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
