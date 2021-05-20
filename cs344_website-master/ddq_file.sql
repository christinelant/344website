# drop tables

DROP TABLE IF EXISTS `customers`;
DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `orderItems`;
DROP TABLE IF EXISTS `payments`;
DROP TABLE IF EXISTS `orders`;

# table creation

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `dateOrdered` DATE,
  `orderedBy` varchar(255),
  # gave me trouble if i left this as customerID, likewise with next table


  PRIMARY KEY (`orderID`)
  KEY `customerID` (`customerID`),
  CONSTRAINT `orders_fk` FOREIGN KEY (`orderedBy`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `payments` (
    `paymentID` INT(11) NOT NULL AUTO_INCREMENT,
    `paidBy` INT(11),
    `amountPaid` decimal(10,2) NOT NULL,
    `datePaid` DATE NOT NULL,
    `paymentType` TEXT NOT NULL,
    
    PRIMARY KEY(`paymentID`)
    KEY `paidBy` (`paidBy`),
    CONSTRAINT `payment_fk` FOREIGN KEY (`paidBy`) REFERENCES `customers` (`customerID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

# insert data into tables

INSERT INTO orders (dateOrdered)
VALUES ('2021-02-12'),
        ('2020-04-12'),
        ('2021-02-12');

INSERT INTO payments (amountPaid, datePaid, paymentType)
VALUES ('3.21','2021-04-21','CASH'),
        ('9.29','2021-04-21','CREDIT'),
        ('15.29','2021-03-21','CASH');