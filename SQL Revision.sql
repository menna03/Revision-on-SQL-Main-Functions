/* All SQL Main Functions and codes Revision  */

/*Select ALL Customer */
select*
from Customers

/*Select  CustomerID,ContactName,ContactTitle,city  */
Select CustomerID,ContactName,ContactTitle,city
from Customers

/*Select  ContactName,Phone,City AND they are From London ie CITY=London */
Select ContactName,Phone,City
From  Customers
Where City='London'

/*Select  ContactName,Phone,City AND ContactName is canged in to NAME */
Select ContactName as NAME,Phone,City
FROM Customers

/*Select  ProductName,UnitPrice AND NEW colem After TAX "Price After TAX" && UnitPriceIS larger than 50  */
Select ProductName,UnitPrice ,(UnitPrice*1.15) as "Price After TAX"
FROM Products
where UnitPrice>50

/*Select CompanyName,City,Phone FROM Suppliers and ALL countryes Exsept USA and UK */
SELECT CompanyName,City,Phone
From Suppliers
Where Country != 'USA' AND Country != 'UK'

 /*other way VIP*/
 SELECT CompanyName,City,Phone
From Suppliers
Where Country not in ('USA' , 'UK')

/*SELECT ALL Products berween 20 and 50 IE 20 and 50 ARE included it is like <= >= */
select *
From Products
WHERE UnitPrice between 20 and 50

/*other way VIP*/
select *
From Products
WHERE UnitPrice >=20 AND UnitPrice <= 50

/*SELECT ALL Products outside range  20 and 50 IE LOWER Than 20 Higher than 50 */
select *
From Products
WHERE UnitPrice NOT between 20 and 50

/*SELECT CompanyName,ProductName,UnitPrice ,Country BUT That are from Diff tables so we used join */
 SELECT CompanyName,ProductName,UnitPrice ,Country
From Suppliers inner join Products
on Suppliers.SupplierID=Products.ProductID
Where Country  = 'USA' 
order by CompanyName 

/*SELECT CompanyName ,Num of Order and Group them by ContactName */
SELECT ContactName  ,count(*)AS "Num of Orders"
FROM Customers join Orders
on Customers.CustomerID=Orders.CustomerID
Group BY ContactName

/*SELECT CompanyName ,Num of Order and Group them by ContactName */
SELECT CompanyName  ,count(*)AS "Num of Orders"
FROM Suppliers join Products
on Suppliers.SupplierID=Products.SupplierID
Group BY CompanyName
having count(*)>3/*order by is the last thing in the sentence + HAVING is like WHERE BUT BUT we use it in Group BY*/
order by  count(*)

/*top 10 Productes */
select top 10 ProductName,UnitPrice
from Products
order by UnitPrice desc

/*top 10 % Productes */
select top 10 percent ProductName,UnitPrice
from Products
order by UnitPrice desc

/*SUb QUERY*/
select *
from Products
where UnitPrice>(select AVG(UnitPrice) from Products)

/*ALL IN ONE*/
select  distinct *
From Customers join Orders 
on Customers.CustomerID =Orders.CustomerID 
join [Order Details] 
on [Order Details].OrderID=Orders.OrderID
where [Order Details].ProductID in
(select distinct ProductID
From Customers join Orders 
on Customers.CustomerID =Orders.CustomerID 
join [Order Details] 
on [Order Details].OrderID=Orders.OrderID and CompanyName like '%A' )
