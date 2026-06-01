DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
  ID INT,
  Name VARCHAR(50),
  PRIMARY KEY (ID)
);

CREATE TABLE Products (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(50),
  PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(50),
  Address VARCHAR(50),
  CountryID INT,
  FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
  PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
  ID INT,
  ProductID INT,
  FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
  WarehouseAmount INT,
  WarehouseID INT,
  FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
  PRIMARY KEY (ID)
);

DROP PROCEDURE IF EXISTS get_warehouse_product_inventory;

DELIMITER //

CREATE PROCEDURE get_warehouse_product_inventory(IN warehouseID INT)
BEGIN
  SELECT p.Name, pi.WarehouseAmount
  FROM ProductInventory pi
  JOIN Products p ON pi.ProductID = p.ID
  WHERE pi.WarehouseID = warehouseID;
END //

DELIMITER ;
