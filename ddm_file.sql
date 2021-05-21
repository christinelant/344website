# orders
--------------------------------------
# shows all orders
SELECT * FROM `orders`

# inserts values
INSERT INTO `Orders`(`orderID`, `dateOrdered`, `orderedBy`, `employeeID`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]') WHERE (criteria)

# update values
UPDATE `Orders` SET `orderID`='[value-1]',`dateOrdered`='[value-2]',`orderedBy`='[value-3]',`employeeID`='[value-4]' WHERE (criteria)

# delete values
DELETE FROM `Orders` WHERE (criteria)

--------------------------------------


# payments
--------------------------------------
# shows all payments
SELECT * FROM `payments`

# inserts values
INSERT INTO `payments`(`paymentID`, `paidBy`, `amountPaid`, `datePaid`, `paymentType`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')

# update values
UPDATE `payments` SET `paymentID`='[value-1]',`paidBy`='[value-2]',`amountPaid`='[value-3]',`datePaid`='[value-4]',`paymentType`='[value-5]'

# delete values
DELETE FROM `payments`

--------------------------------------