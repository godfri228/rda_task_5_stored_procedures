DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

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
