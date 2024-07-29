-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema harryBdd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema harryBdd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `harryBdd` DEFAULT CHARACTER SET utf8 ;
USE `harryBdd` ;

-- -----------------------------------------------------
-- Table `harryBdd`.`house`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `harryBdd`.`house` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `houseName` VARCHAR(100) NULL,
  `housePoint` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `harryBdd`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `harryBdd`.`character` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NULL,
  `lastname` VARCHAR(100) NULL,
  `image` VARCHAR(255) NULL,
  `house_id` INT NOT NULL,
  PRIMARY KEY (`id`, `house_id`),
  INDEX `fk_student_house_idx` (`house_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_house`
    FOREIGN KEY (`house_id`)
    REFERENCES `harryBdd`.`house` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `harryBdd`.`spell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `harryBdd`.`spell` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `spellName` VARCHAR(100) NULL,
  `spellEffect` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `harryBdd`.`characterHasSpell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `harryBdd`.`characterHasSpell` (
  `character_id` INT NOT NULL,
  `spell_id` INT NOT NULL,
  PRIMARY KEY (`character_id`, `spell_id`),
  INDEX `fk_character_has_spell_spell1_idx` (`spell_id` ASC) VISIBLE,
  INDEX `fk_character_has_spell_character1_idx` (`character_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_has_spell_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `harryBdd`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_spell_spell1`
    FOREIGN KEY (`spell_id`)
    REFERENCES `harryBdd`.`spell` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
