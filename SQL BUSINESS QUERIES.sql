
-- Query 1: List all suppliers in the UK
SELECT
    CompanyName,
    ContactName,
    City,
    Country,
    Phone
FROM
    Supplier
WHERE
    Country = 'UK';

-- Query 2: List customer names and city, concatenating first and last name
SELECT
    FirstName,
    LastName,
    City,
    -- Concatenate FirstName, LastName, and City using CONCAT for NULL-safe string combining
    CONCAT(FirstName, ' ', LastName, ', ', City) AS FullNameAndCity
FROM
    Customer;

-- Query 3: List all customers in Sweden
SELECT
    Id,
    FirstName,
    LastName,
    City,
    Country,
    Phone
FROM
    Customer
WHERE
    Country = 'Sweden';


-- Query 4: List all suppliers in alphabetical order by CompanyName
SELECT
    CompanyName,
    ContactName,
    City,
    Country,
    Phone
FROM
    Supplier
ORDER BY
    CompanyName ASC; -- ASC for ascending order (A-Z)

-- Query 5: List all suppliers and their products
SELECT
    S.CompanyName AS SupplierName,
    P.ProductName,
    P.UnitPrice,
    P.Package
FROM
    Supplier AS S
INNER JOIN
    Product AS P ON S.Id = P.SupplierId
ORDER BY
    S.CompanyName, P.ProductName;

-- Query 6: List all orders with customer information
SELECT
    O.Id AS OrderId,
    O.OrderNumber,
    O.OrderDate,
    O.TotalAmount,
    C.FirstName,
    C.LastName,
    C.City,
    C.Country
FROM
    "Order" AS O -- Using double quotes because "Order" is a reserved keyword
INNER JOIN
    Customer AS C ON O.CustomerId = C.Id
ORDER BY
    O.OrderDate DESC, O.OrderNumber;

-- Query 7: List all orders with product name, quantity, and price
SELECT
    O.OrderNumber,
    O.OrderDate,
    P.ProductName,
    OI.Quantity,
    OI.UnitPrice AS OrderedUnitPrice, -- Price at the time of order
    (OI.Quantity * OI.UnitPrice) AS LineTotal
FROM
    "Order" AS O
INNER JOIN
    OrderItem AS OI ON O.Id = OI.OrderId
INNER JOIN
    Product AS P ON OI.ProductId = P.Id
ORDER BY
    O.OrderNumber ASC, P.ProductName ASC;

-- Query 8: List product availability using a CASE statement
SELECT
    ProductName,
    IsDiscontinued,
    CASE
        WHEN IsDiscontinued = 1 THEN 'Not Available' -- Assuming 1 means discontinued/not available
        WHEN IsDiscontinued = 0 THEN 'Available'     -- Assuming 0 means available
        ELSE 'Unknown'                               -- Handle any other potential values
    END AS ProductAvailabilityStatus
FROM
    Product
ORDER BY
    ProductName;

-- Query 9: List suppliers and their implied language based on country
SELECT
    CompanyName,
    Country,
    CASE Country
        WHEN 'UK' THEN 'English'
        WHEN 'USA' THEN 'English'
        WHEN 'Germany' THEN 'German'
        WHEN 'France' THEN 'French'
        WHEN 'Sweden' THEN 'Swedish'
        WHEN 'Spain' THEN 'Spanish'
        WHEN 'Italy' THEN 'Italian'
        WHEN 'Japan' THEN 'Japanese'
        WHEN 'Australia' THEN 'English'
        WHEN 'Canada' THEN 'English/French' -- Canada has two official languages
        WHEN 'Brazil' THEN 'Portuguese'
        WHEN 'Norway' THEN 'Norwegian'
        WHEN 'Denmark' THEN 'Danish'
        WHEN 'Finland' THEN 'Finnish'
        WHEN 'Netherlands' THEN 'Dutch'
        WHEN 'Mexico' THEN 'Spanish'
        WHEN 'Singapore' THEN 'Malay/English/Mandarin/Tamil' -- Singapore has 4 official languages
        -- Add more countries and their languages as needed based on your data
        ELSE 'Unknown Language'
    END AS SpokenLanguage
FROM
    Supplier
ORDER BY
    CompanyName;

-- Query 10: List all products packaged in 'Jars'
SELECT
    ProductName,
    UnitPrice,
    Package
FROM
    Product
WHERE
    Package = 'Jars';

-- Query 11: List products starting with 'Ca'
SELECT
    ProductName,
    UnitPrice,
    Package
FROM
    Product
WHERE
    ProductName LIKE 'Ca%'; -- The % is a wildcard character meaning any sequence of zero or more characters

-- Query 12: Count products per supplier, sorted by count (high to low)
SELECT
    S.CompanyName AS SupplierName,
    COUNT(P.Id) AS NumberOfProducts
FROM
    Supplier AS S
INNER JOIN
    Product AS P ON S.Id = P.SupplierId
GROUP BY
    S.CompanyName
ORDER BY
    NumberOfProducts DESC; -- DESC for descending order (high to low)

-- Query 13: Count customers per country
SELECT
    Country,
    COUNT(Id) AS NumberOfCustomers
FROM
    Customer
GROUP BY
    Country
ORDER BY
    Country ASC; -- Order by country name for readability

-- Query 14: Count customers per country, sorted by count (high to low)
SELECT
    Country,
    COUNT(Id) AS NumberOfCustomers
FROM
    Customer
GROUP BY
    Country
ORDER BY
    NumberOfCustomers DESC; -- Sort by customer count in descending order

-- Query 15: Calculate total order amount per customer, sorted by total amount (high to low)
SELECT
    C.FirstName,
    C.LastName,
    C.Country,
    SUM(O.TotalAmount) AS TotalOrderAmount
FROM
    Customer AS C
INNER JOIN
    "Order" AS O ON C.Id = O.CustomerId
GROUP BY
    C.Id, C.FirstName, C.LastName, C.Country -- Group by all non-aggregated columns from Customer
ORDER BY
    TotalOrderAmount DESC;

-- Query 16: List countries with more than 2 suppliers
SELECT
    Country,
    COUNT(Id) AS NumberOfSuppliers
FROM
    Supplier
GROUP BY
    Country
HAVING
    COUNT(Id) > 2
ORDER BY
    NumberOfSuppliers DESC;

-- Query 17: Count customers per country, only for countries with > 10 customers
SELECT
    Country,
    COUNT(Id) AS NumberOfCustomers
FROM
    Customer
GROUP BY
    Country
HAVING
    COUNT(Id) > 10
ORDER BY
    NumberOfCustomers DESC;

-- Query 18: Count customers per country (excluding USA), with >= 9 customers, sorted high to low
SELECT
    Country,
    COUNT(Id) AS NumberOfCustomers
FROM
    Customer
WHERE
    Country <> 'USA' -- Exclude USA
GROUP BY
    Country
HAVING
    COUNT(Id) >= 9 -- Include countries with 9 or more customers
ORDER BY
    NumberOfCustomers DESC;

-- Query 19: Customers with average order amount between $1000 and $1200
SELECT
    C.FirstName,
    C.LastName,
    C.Country,
    AVG(O.TotalAmount) AS AverageOrderAmount
FROM
    Customer AS C
INNER JOIN
    "Order" AS O ON C.Id = O.CustomerId
GROUP BY
    C.Id, C.FirstName, C.LastName, C.Country
HAVING
    AVG(O.TotalAmount) BETWEEN 1000 AND 1200
ORDER BY
    AverageOrderAmount DESC;

-- Query 20: Number of orders and total amount sold in January 2013
SELECT
    COUNT(Id) AS NumberOfOrders,
    SUM(TotalAmount) AS TotalAmountSold
FROM
    "Order"
WHERE
    OrderDate >= '2013-01-01' AND OrderDate <= '2013-01-31';
    -- Alternatively, for date ranges, you can use:
    -- OrderDate >= '2013-01-01' AND OrderDate < '2013-02-01';
    -- This handles timestamps correctly by including all of Jan 31st and excluding Feb 1st.