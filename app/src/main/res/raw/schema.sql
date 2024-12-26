-- MySQL Script generated by MySQL Workbench
-- Wed Dec 25 19:28:25 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Trainee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Trainee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Trainee` DEFAULT CHARACTER SET utf8 ;
USE `Trainee` ;

-- -----------------------------------------------------
-- Table `Trainee`.`Musculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`Musculo` (
  `idMusculo` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Grupo` ENUM('push', 'pull', 'leg') NOT NULL,
  PRIMARY KEY (`idMusculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trainee`.`Ejercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`Ejercicio` (
  `idEjercicio` INT NOT NULL,
  `mejorMarca` FLOAT NULL,
  `idMusculo` INT NOT NULL,
  PRIMARY KEY (`idEjercicio`, `idMusculo`),
  INDEX `fk_Ejercicio_Musculo1_idx` (`idMusculo` ASC) VISIBLE,
  CONSTRAINT `fk_Ejercicio_Musculo1`
    FOREIGN KEY (`idMusculo`)
    REFERENCES `Trainee`.`Musculo` (`idMusculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trainee`.`Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`Serie` (
  `idSerie` INT NOT NULL,
  `peso` FLOAT NULL,
  `repeticiones` INT NULL,
  `completado` TINYINT NULL,
  `idEjercicio` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idEjercicio`),
  INDEX `fk_Serie_Ejercicio1_idx` (`idEjercicio` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_Ejercicio1`
    FOREIGN KEY (`idEjercicio`)
    REFERENCES `Trainee`.`Ejercicio` (`idEjercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trainee`.`Rutina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`Rutina` (
  `idRutina` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idRutina`),
  INDEX `fk_Rutina_Usuario1_idx` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trainee`.`RutinaEjercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`RutinaEjercicio` (
  `idRutina` INT NOT NULL,
  `dEjercicio` INT NOT NULL,
  PRIMARY KEY (`idRutina`, `dEjercicio`),
  INDEX `fk_Rutina_has_Ejercicio_Ejercicio1_idx` (`dEjercicio` ASC) VISIBLE,
  INDEX `fk_Rutina_has_Ejercicio_Rutina1_idx` (`idRutina` ASC) VISIBLE,
  CONSTRAINT `fk_Rutina_has_Ejercicio_Rutina1`
    FOREIGN KEY (`idRutina`)
    REFERENCES `Trainee`.`Rutina` (`idRutina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rutina_has_Ejercicio_Ejercicio1`
    FOREIGN KEY (`dEjercicio`)
    REFERENCES `Trainee`.`Ejercicio` (`idEjercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trainee`.`Entrenamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trainee`.`Entrenamiento` (
  `idEntrenamiento` INT NOT NULL,
  `fechaRealizacion` DATE NULL,
  `pesoTotal` FLOAT NULL,
  `idRutina` INT NOT NULL,
  PRIMARY KEY (`idEntrenamiento`, `idRutina`),
  INDEX `fk_Entrenamiento_Rutina1_idx` (`idRutina` ASC) VISIBLE,
  CONSTRAINT `fk_Entrenamiento_Rutina1`
    FOREIGN KEY (`idRutina`)
    REFERENCES `Trainee`.`Rutina` (`idRutina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
