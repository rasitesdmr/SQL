USE deneme

CREATE TABLE customers(
    customer_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE VIEW vw_customers
AS 
SELECT first_name , last_name
FROM customers

CREATE TRIGGER tg_vw_customers
ON vw_customers
AFTER INSERT
AS
BEGIN
SELECT 'Yeni müşteri eklendi '
END


