# orders
--------------------------------------
# shows all orders
SELECT * FROM orders;

# inserts values
INSERT INTO orders (dateOrdered)
VALUES dateOrdered = :%s;

# update values
UPDATE orders SET dateOrderd=:%s;

# delete values
DELETE FROM orders where dateOrdered =:%s;

--------------------------------------


# payments
--------------------------------------
# shows all orders
SELECT * FROM payments;

# inserts values
INSERT INTO payments (amountPaid, datePaid, paymentType)
VALUES amountPaid = :%s, datePaid = :%s, paymentType = :%s;

# update values
UPDATE payments SET amountPaid = :%s, datePaid = :%s, paymentType = :%s;

# delete values
DELETE FROM orders where (amountPaid = :%s, datePaid = :%s, paymentType = :%s;)

--------------------------------------