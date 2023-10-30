-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- Schema peliculas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peliculas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peliculas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;



USE `peliculas` ;

-- -----------------------------------------------------
-- Table `peliculas`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  INDEX `idx_actor_id` (`actor_id` ASC) VISIBLE,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`category` (
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`language` (
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`film` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `language_language_id` INT NOT NULL,
  `inventory_inventory_id` INT NOT NULL,
  `category_category_id` INT NOT NULL,
  INDEX `idx_film_id` (`film_id` ASC) VISIBLE,
  PRIMARY KEY (`film_id`, `language_language_id`, `inventory_inventory_id`, `category_category_id`),
  INDEX `fk_film_language1_idx` (`language_language_id` ASC) VISIBLE,
  INDEX `fk_film_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  INDEX `fk_film_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_language1`
    FOREIGN KEY (`language_language_id`)
    REFERENCES `peliculas`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `peliculas`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `peliculas`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`film_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`film_actor` (
  `film_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `actor_id`),
  INDEX `actor_id` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `film_actor_ibfk_1`
    FOREIGN KEY (`film_id`)
    REFERENCES `peliculas`.`film` (`film_id`),
  CONSTRAINT `film_actor_ibfk_2`
    FOREIGN KEY (`actor_id`)
    REFERENCES `peliculas`.`actor` (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `peliculas`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `dias_renta` DOUBLE NULL DEFAULT NULL,
  `inventory_inventory_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `inventory_inventory_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `peliculas`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
