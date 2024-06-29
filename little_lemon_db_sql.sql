-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`salary` (
  `salary_id` INT NOT NULL COMMENT 'The role that the salary amount is associated to. Serves as the foreign key to the staff table.',
  `salary_amount` INT NOT NULL COMMENT 'The amount the specific role should earn annually.',
  PRIMARY KEY (`salary_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL COMMENT 'The first name of the staff member',
  `last_name` VARCHAR(255) NOT NULL COMMENT 'The last name of the staff member',
  `role` VARCHAR(255) NOT NULL COMMENT 'The current role that the staff member is employed with at the restaurant. For example as a manager or waiter.',
  `salary_id` INT NOT NULL COMMENT 'The id of the salary the staff member is assigned. Serves as the foreign key to the salary table.',
  PRIMARY KEY (`staff_id`),
  INDEX `salary_id_fk_idx` (`salary_id` ASC) VISIBLE,
  CONSTRAINT `salary_id_fk`
    FOREIGN KEY (`salary_id`)
    REFERENCES `little_lemon_db`.`salary` (`salary_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`booking_tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`booking_tables` (
  `table_id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` INT NOT NULL COMMENT 'Indicates the staff member assigned to the table. Serves as the foreign key to the staff table.',
  PRIMARY KEY (`table_id`),
  INDEX `staff_id_fk_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `little_lemon_db`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL COMMENT 'The first name of the customer.',
  `last_name` VARCHAR(255) NOT NULL COMMENT 'The last name of the customer',
  `email` VARCHAR(255) NOT NULL COMMENT 'The contact email address for the customer.',
  `phone` INT NOT NULL COMMENT 'The constact phone number of the customer.',
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL COMMENT 'The date that the booking is scheduled for.',
  `table_id` INT NOT NULL COMMENT 'The table number that the booking is assigned to. Serves as the foreign key to the tables table.',
  `customer_id` INT NOT NULL COMMENT 'The orders made under the given booking. Serves as the foreign key to the orders table.',
  PRIMARY KEY (`booking_id`),
  INDEX `table_id_fk_idx` (`table_id` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `table_id_fk`
    FOREIGN KEY (`table_id`)
    REFERENCES `little_lemon_db`.`booking_tables` (`table_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer__booking_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_db`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`order_status` (
  `order_status_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(255) NOT NULL COMMENT 'The current status of the order delivery such as in progress, completed.',
  PRIMARY KEY (`order_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(255) NOT NULL COMMENT 'The type of cuisine the menu has such as Greek, Italian, French, etc.',
  `category` VARCHAR(255) NOT NULL COMMENT 'The category of menu such as starter, course, drink, dessert.',
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL COMMENT 'Indicates the date the order was created.',
  `quantity` INT NOT NULL COMMENT 'Indicates the quantity of the menu item ordered.',
  `order_total` DECIMAL(6,2) NOT NULL COMMENT 'Indicates the total cost of the order based on the menu item price and quantity of the item ordered.',
  `order_status_id` INT NOT NULL COMMENT 'Serves as the foreign key to the order status table.',
  `menu_id` INT NOT NULL COMMENT 'Serves as the foreign key to the menu items table.',
  `customer_id` INT NOT NULL COMMENT 'Relates to the customer table',
  PRIMARY KEY (`order_id`),
  INDEX `order_status_id_fk_idx` (`order_status_id` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`menu_id` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `order_status_id_fk`
    FOREIGN KEY (`order_status_id`)
    REFERENCES `little_lemon_db`.`order_status` (`order_status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little_lemon_db`.`menu` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_order_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_db`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu_items` (
  `menu_item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(255) NOT NULL COMMENT 'The name of the menu item.',
  `price` DECIMAL(6,2) NOT NULL COMMENT 'The price to charge for the menu item when ordered.',
  PRIMARY KEY (`menu_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu_has_menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu_has_menu_items` (
  `menu_menu_id` INT NOT NULL,
  `menu_items_menu_item_id` INT NOT NULL,
  PRIMARY KEY (`menu_menu_id`, `menu_items_menu_item_id`),
  INDEX `fk_menu_has_menu_items_menu_items1_idx` (`menu_items_menu_item_id` ASC) VISIBLE,
  INDEX `fk_menu_has_menu_items_menu1_idx` (`menu_menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_menu_has_menu_items_menu1`
    FOREIGN KEY (`menu_menu_id`)
    REFERENCES `little_lemon_db`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_items_menu_item_id`)
    REFERENCES `little_lemon_db`.`menu_items` (`menu_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
