SELECT 
    concat(p.FirstName, ' ',  p.LastName) AS SalesPersonName,
    st.Name AS Territory,
    SUM(soh.SubTotal) AS TotalSales,
    COUNT(soh.SalesOrderID) AS OrderCount,
    AVG(soh.SubTotal) AS AvgOrderValue
FROM Sales.SalesOrderHeader as soh
JOIN Sales.SalesPerson as sp 
    ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person as p 
    ON sp.BusinessEntityID = p.BusinessEntityID
JOIN Sales.SalesTerritory as st 
    ON sp.TerritoryID = st.TerritoryID
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName, st.Name
ORDER BY TotalSales DESC

