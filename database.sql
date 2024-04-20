CREATE DATABASE SwiftMotors;

USE SwiftMotors;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    CustomerType VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    Location VARCHAR(255),
    Address VARCHAR(255),
    ContactInfo VARCHAR(255),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Make VARCHAR(255),
    Model VARCHAR(255),
    Year INT,
    Price DECIMAL(10, 2),
    Color VARCHAR(50),
    Mileage INT,
    VIN VARCHAR(17),
    Category VARCHAR(50),
    EngineCapacity INT,
    Transmission VARCHAR(50),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    BranchID INT,
    VehicleID INT,
    Quantity INT,
    DateReceived DATE,
    Notes VARCHAR(255),
    SupplierID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);



CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    VehicleID INT,
    CustomerID INT,
    EmployeeID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    PolicyNumber VARCHAR(50),
    VehicleID INT,
    InsuranceCompany VARCHAR(255),
    CoverageDetails VARCHAR(255),
    ExpirationDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE Leasing (
    LeaseID INT PRIMARY KEY,
    LeaseNumber VARCHAR(50),
    VehicleID INT,
    LesseeName VARCHAR(255),
    LeaseStartDate DATE,
    LeaseEndDate DATE,
    MonthlyPayment DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

INSERT INTO Suppliers (SupplierID, Name, ContactInfo)
VALUES
    (1, 'JV-Imports', 'manager@jvimports.com'),
    (2, 'JP-Auction', 'manager@japanauction.com');

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, CustomerType)
VALUES
    (1, 'Mughal', 'Zia', 'Mughal@example.com', '123-456-7890', 'Buyer'),
    (2, 'Kashif', 'Hassan', 'Kashif@example.com', '987-654-3210', 'Seller');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, ContactInfo)
VALUES
    (101, 'Hassan', 'Mustafa', 'Manager', 'Hassan@swiftmotors.com'),
    (102, 'Ramsha', 'Fatima', 'Salesperson', 'Ramsha@swiftmotors.com'),
    (103, 'Zoraiz', 'Kashif', 'Salesperson', 'Zoraiz@swiftmotors.com'),
	(104, 'Alisha', 'Farooq', 'Salesperson', 'Alisha@swiftmotors.com'),
    (105, 'Ayesha', 'Aslam', 'Manager', 'Ayesha@swiftmotors.com'),
    (106, 'Noor', 'Zia', 'Salesperson', 'Noor@swiftmotors.com'),
    (107, 'Habiba', 'Bhatti', 'Manager', 'Habiba@swiftmotors.com'),
	(108, 'Mustafa', 'Amir', 'Salesperson', 'Mustafa@swiftmotors.com'),
	(109, 'Ibrahim', 'Mughal', 'Manager', 'Ibrahim@swiftmotors.com'),
 	(110, 'Arman', 'Ali', 'Salesperson', 'Arman@swiftmotors.com'),   
	(111, 'Fahad', 'Waqar', 'Manager', 'Fahad@swiftmotors.com');

INSERT INTO Branches (BranchID, Location, Address, ContactInfo, ManagerID)
VALUES
    (1, 'Karachi', 'Jauhar Road', '123-456-7890', 101),
    (2, 'Lahore', 'Model Town', '987-654-3210', 105),
    (3, 'Islamabad', '9th Avenue', '111-222-3333', 107),
    (4, 'Multan', 'Multan Road', '111-777-3333', 109),
	(5, 'Peshawar', 'Ring Road', '221-777-3333', 111);

INSERT INTO Vehicles (VehicleID, Make, Model, Year, Price, Color, Mileage, VIN, Category, EngineCapacity, Transmission, BranchID)
VALUES 
(1, 'Toyota', 'Camry', 2020, 25000.00, 'Blue', 15000, 'WAUZZZ8V8KA091321', 'Sedan', 2500, 'Automatic', 1),
(2, 'Honda', 'Civic', 2019, 22000.00, 'Red', 20000, 'JHMES1F65KG836765', 'Compact', 1500, 'Manual', 1),
(3, 'Ford', 'F-150', 2021, 40000.00, 'White', 5000, '1FT8W2DW3KFC32167', 'Pickup Truck', 5000, 'Automatic', 2),
(4, 'Toyota', 'Fortuner', 2020, 38000.00, 'Black', 10000, '1GCGCEDF3KA012345', 'SUV', 6000, 'Automatic', 2),
(5, 'Nissan', 'Leaf', 2018, 18000.00, 'Silver', 30000, '5Y1BL3F85KA123456', 'Hatchback', 2000, 'Continuously Variable', 3),
(6, 'Hyundai', 'Elantra', 2021, 23000.00, 'Gray', 8000, 'KMHNV2A35KG856789', 'Sedan', 2000, 'Automatic', 3),
(7, 'Kia', 'Sportage', 2019, 28000.00, 'Blue', 18000, 'WAUZZZ8V7MA012345', 'Crossover-SUV', 2000, 'Continuously Variable', 5),
(8, 'Jeep', 'Wrangler', 2020, 36000.00, 'Orange', 12000, '1C4BJWEG9KA123456', 'SUV', 3900, 'Manual', 2),
(9, 'Toyota', 'Hilux-Revo', 2021, 45000.00, 'Blue', 4000, '1FT6W2DW9KF856789', 'Pickup Truck', 2700, 'Automatic', 3),
(10, 'Toyota', 'Yaris', 2018, 16000.00, 'White', 40000, 'WAUZZZ8V9MA012345', 'Sedan', 1400, 'Manual', 1),
(11, 'Mazda', 'RX-8', 2004, 27000.00, 'Black', 25000, 'JM1BL3F80KG856789', 'Coupe', 1300, 'Automatic', 2),
(12, 'BMW', '3 Series', 2020, 35000.00, 'Red', 15000, 'WBA3N1C52KFD32167', 'Sedan', 2500, 'Automatic', 3),
(13, 'Audi', 'A6', 2021, 42000.00, 'Silver', 7000, 'WBA3N2DF3KFD32172','Sedan', 1500, 'Continuously Variable', 3),
(14, 'Tesla', 'Model 3', 2022, 45000, 'Red', 5000, 'WAUZZZ8V5KA083726', 'Sedan', 2500, 'Automatic', 1),
       (15, 'Honda', 'Civic', 2021, 22000, 'Blue', 10000, 'JHMES1F66KA028266', 'Sedan', 1500, 'Manual', 4),
       (16, 'Ford', 'Mustang', 2022, 60000, 'Black', 8000, '1FMPU8D8XKA123457', 'Coupe', 3000, 'Manual', 5),
       (17, 'Chevrolet', 'Corvette', 2022, 80000, 'White', 3000, '3GKALCEV9KA098766', 'Coupe', 6200, 'Automatic', 3),
       (18, 'Audi', 'A4', 2022, 40000, 'Silver', 7000, 'WAUGF78K8KA098766', 'Sedan', 2000, 'Automatic', 4),
       (19, 'BMW', '3 Series', 2022, 50000, 'Gray', 9000, 'WBA3N1C52KA098766', 'Sedan', 2500, 'Automatic', 4),
       (20, 'Mercedes-Benz', 'C-Class', 2022, 60000, 'Black', 10000, 'WDDGF8EB2KA098766', 'Sedan', 2000, 'Automatic', 4),
       (21, 'Lexus', 'IS', 2022, 45000, 'Blue', 6000, '5Y1BR1F83KA032109', 'Sedan', 2500, 'Automatic', 5),
       (22, 'Volvo', 'S60', 2022, 40000, 'Green', 8000, 'JF1CJRE89KA098766', 'Sedan', 2000, 'Automatic', 3),
       (23, 'Jaguar', 'XE', 2022, 50000, 'Orange', 5000, 'WA1CJRE89KA098765', 'Sedan', 2500, 'Automatic', 5);
	


INSERT INTO Inventory (InventoryID, BranchID, VehicleID, Quantity, DateReceived, Notes, SupplierID)
VALUES
    (1, 1, 23, 5, '2023-12-15', 'New stock arrived', 1),
    (2, 2, 13, 3, '2024-01-16', 'Limited stock available', 1),
    (3, 3, 11, 5, '2024-02-17', 'First unit in stock', 2),
	(4, 4, 10, 8, '2024-03-15', 'New stock arrived', 1),
    (5, 5, 4, 10, '2024-04-16', 'Limited stock available', 2);

INSERT INTO Sales (SaleID, VehicleID, CustomerID, EmployeeID, SaleDate, SalePrice)
VALUES
    (1, 1, 1, 102, '2024-04-18', 16000.00),
    (2, 2, 2, 103, '2024-04-19', 18000.00);

INSERT INTO Insurance (InsuranceID, PolicyNumber, VehicleID, InsuranceCompany, CoverageDetails, ExpirationDate)
VALUES
    (1, '123456789', 1, 'InsuranceCo', 'Full coverage', '2025-04-18'),
    (2, '987654321', 2, 'InsuranceCo', 'Comprehensive', '2025-04-19');

INSERT INTO Leasing (LeaseID, LeaseNumber, VehicleID, LesseeName, LeaseStartDate, LeaseEndDate, MonthlyPayment)
VALUES
    (1, 'A123', 3, 'Leasee1', '2024-04-18', '2025-04-18', 500.00),
    (2, 'B456', 3, 'Leasee2', '2024-04-19', '2025-04-19', 550.00);
