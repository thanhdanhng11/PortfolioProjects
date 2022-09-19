USE Northwind

GO

-- Return all the fields from all the shippers
SELECT * 
from Shippers

GO

-- Return CategoryName and Description in Categories table 
SELECT CategoryName, [Description]
FROM Categories

GO

-- Return sales representatives
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE Title = 'Sales Representative'

GO

-- Return all sales representatives in the United States
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE Title = 'Sales Representative' and Country = 'USA'

GO

-- Return orders placed by specific employeeID
SELECT OrderID, OrderDate
FROM Orders
WHERE EmployeeID = 5

GO

-- Return suppliers and contact titles with supplierID, contact name, and contact title 
SELECT SupplierID, ContactName, ContactTitle
FROM Suppliers
WHERE ContactTitle <> 'Marketing Manager'

GO

-- Return product name include the string "queso"
SELECT ProductID, ProductName
FROM Products
WHERE ProductName LIKE '%queso%'

GO

-- Return the orders where the shipCountry is either France or Belgium
SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium'

GO

-- Orders shipping to any country in Latin America
SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezula')

GO

-- Show the firstname, lastname, title, and birthdate order by birthday
SELECT FirstName, LastName, Title, BirthDate
FROM Employees
ORDER BY BirthDate

GO

-- Showing only the Date with a DateTime field
SELECT FirstName, LastName, Title, DateOnly = CONVERT(date, BirthDate)
FROM Employees
ORDER BY BirthDate

GO

-- Show full name Employees
SELECT FirstName, LastName, FullName = FirstName + ' ' + LastName
FROM Employees 


GO

-- OrderDetails amount per line item
SELECT TotalPrice = (UnitPrice * Quantity), *
FROM [Order Details]
ORDER BY OrderID, ProductID

GO 

-- Show customers in the Customers table
SELECT count(*)
FROM Customers

GO

-- Show the date of the first order 
SELECT FirstOrder = MIN(OrderDate)
FROM Orders

GO 

-- Show countries where there are customers
SELECT Country
FROM Customers
GROUP BY Country

GO

-- Show contact titles for customers
SELECT ContactTitle, count(ContactTitle)
FROM Customers
GROUP BY ContactTitle

GO

-- Products with associated supplier names
SELECT p.ProductID, p.ProductName, s.CompanyName
FROM Suppliers s, Products p
WHERE s.SupplierID = p.SupplierID
ORDER BY p.ProductID

GO

-- Show the orders and the shipper that was used
SELECT o.OrderID, DateOnly = CONVERT(date, o.OrderDate), s.CompanyName
FROM Orders o, Shippers s 
WHERE s.ShipperID = o.ShipVia AND o.OrderID < 10300
ORDER BY o.OrderID
