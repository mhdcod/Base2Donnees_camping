-- Projet camping 2023 Laouedj Mohamed @ Mehiaoui Mohamed
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema camping_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema camping_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `camping_bd` DEFAULT CHARACTER SET utf8 ;
USE `camping_bd` ;

-- -----------------------------------------------------
-- Table `camping_bd`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Client` (
  `Client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `date_naissance` DATE NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `numero_telephone` VARCHAR(45) NOT NULL,
  `adresse_mail` VARCHAR(45) NOT NULL,
  `mot_de_passe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Activité`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Activité` (
  `activite_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prix` INT NOT NULL,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `participation_max` INT NOT NULL,
  `contraintes_participation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`activite_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Administrateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Administrateur` (
  `Administrateur_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mot_de_passe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Administrateur_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Reservation` (
  `Reservation_id` INT NOT NULL AUTO_INCREMENT,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `statut` VARCHAR(45) NOT NULL,
  `Client_Client_id` INT NOT NULL,
  `Administrateur_Administrateur_id` INT NOT NULL,
  PRIMARY KEY (`Reservation_id`),
  INDEX `fk_Reservation_Client_idx` (`Client_Client_id` ASC),
  INDEX `fk_Reservation_Administrateur1_idx` (`Administrateur_Administrateur_id` ASC),
  CONSTRAINT `fk_Reservation_Client`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `camping_bd`.`Client` (`Client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Administrateur1`
    FOREIGN KEY (`Administrateur_Administrateur_id`)
    REFERENCES `camping_bd`.`Administrateur` (`Administrateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Paiement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Paiement` (
  `Paiement_id` INT NOT NULL AUTO_INCREMENT,
  `carte_credit_numero` VARCHAR(45) NOT NULL,
  `carte_credit_date_expiration` DATE NOT NULL,
  `carte_credit_cvc` VARCHAR(45) NULL,
  `Reservation_Reservation_id` INT NOT NULL,
  PRIMARY KEY (`Paiement_id`),
  INDEX `fk_Paiement_Reservation1_idx` (`Reservation_Reservation_id` ASC),
  CONSTRAINT `fk_Paiement_Reservation1`
    FOREIGN KEY (`Reservation_Reservation_id`)
    REFERENCES `camping_bd`.`Reservation` (`Reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Hebergement_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Hebergement_type` (
  `Hebergement_type_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `nombre_chambres` INT NOT NULL,
  `capacite_max` INT NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hebergement_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`ParkSpot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`ParkSpot` (
  `ParkSpot_id` INT NOT NULL AUTO_INCREMENT,
  `localisation` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `Administrateur_Administrateur_id` INT NOT NULL,
  PRIMARY KEY (`ParkSpot_id`),
  INDEX `fk_ParkSpot_Administrateur1_idx` (`Administrateur_Administrateur_id` ASC),
  CONSTRAINT `fk_ParkSpot_Administrateur1`
    FOREIGN KEY (`Administrateur_Administrateur_id`)
    REFERENCES `camping_bd`.`Administrateur` (`Administrateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`offre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`offre` (
  `offre_id` INT NOT NULL AUTO_INCREMENT,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `nouveau_prix` DECIMAL NOT NULL,
  `Administrateur_Administrateur_id` INT NOT NULL,
  PRIMARY KEY (`offre_id`),
  INDEX `fk_offre_Administrateur1_idx` (`Administrateur_Administrateur_id` ASC),
  CONSTRAINT `fk_offre_Administrateur1`
    FOREIGN KEY (`Administrateur_Administrateur_id`)
    REFERENCES `camping_bd`.`Administrateur` (`Administrateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`Hebergement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`Hebergement` (
  `Hebergement_id` INT NOT NULL AUTO_INCREMENT,
  `prix_journalier` DECIMAL NOT NULL,
  `prix_petit_dejeuner` DECIMAL NOT NULL,
  `offre` TINYINT NOT NULL,
  `offre_date_debut` DECIMAL NULL,
  `offre_date_fin` DECIMAL NULL,
  `offre_nouveau_prix` DECIMAL NULL,
  `Hebergement_type_Hebergement_type_id` INT NOT NULL,
  `ParkSpot_ParkSpot_id` INT NOT NULL,
  `offre_offre_id` INT NOT NULL,
  `Administrateur_Administrateur_id` INT NOT NULL,
  PRIMARY KEY (`Hebergement_id`),
  INDEX `fk_Hebergement_Hebergement_type1_idx` (`Hebergement_type_Hebergement_type_id` ASC),
  INDEX `fk_Hebergement_ParkSpot1_idx` (`ParkSpot_ParkSpot_id` ASC),
  INDEX `fk_Hebergement_offre1_idx` (`offre_offre_id` ASC),
  INDEX `fk_Hebergement_Administrateur1_idx` (`Administrateur_Administrateur_id` ASC),
  CONSTRAINT `fk_Hebergement_Hebergement_type1`
    FOREIGN KEY (`Hebergement_type_Hebergement_type_id`)
    REFERENCES `camping_bd`.`Hebergement_type` (`Hebergement_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hebergement_ParkSpot1`
    FOREIGN KEY (`ParkSpot_ParkSpot_id`)
    REFERENCES `camping_bd`.`ParkSpot` (`ParkSpot_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hebergement_offre1`
    FOREIGN KEY (`offre_offre_id`)
    REFERENCES `camping_bd`.`offre` (`offre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hebergement_Administrateur1`
    FOREIGN KEY (`Administrateur_Administrateur_id`)
    REFERENCES `camping_bd`.`Administrateur` (`Administrateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`contient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`contient` (
  `Hebergement_Hebergement_id` INT NOT NULL,
  `Reservation_Reservation_id` INT NOT NULL,
  PRIMARY KEY (`Hebergement_Hebergement_id`, `Reservation_Reservation_id`),
  INDEX `fk_Hebergement_has_Reservation_Reservation1_idx` (`Reservation_Reservation_id` ASC),
  INDEX `fk_Hebergement_has_Reservation_Hebergement1_idx` (`Hebergement_Hebergement_id` ASC),
  CONSTRAINT `fk_Hebergement_has_Reservation_Hebergement1`
    FOREIGN KEY (`Hebergement_Hebergement_id`)
    REFERENCES `camping_bd`.`Hebergement` (`Hebergement_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hebergement_has_Reservation_Reservation1`
    FOREIGN KEY (`Reservation_Reservation_id`)
    REFERENCES `camping_bd`.`Reservation` (`Reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `camping_bd`.`participation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `camping_bd`.`participation` (
  `Reservation_Reservation_id` INT NOT NULL,
  `Activité_activite_id` INT NOT NULL,
  PRIMARY KEY (`Reservation_Reservation_id`, `Activité_activite_id`),
  INDEX `fk_Reservation_has_Activité_Activité1_idx` (`Activité_activite_id` ASC),
  INDEX `fk_Reservation_has_Activité_Reservation1_idx` (`Reservation_Reservation_id` ASC),
  CONSTRAINT `fk_Reservation_has_Activité_Reservation1`
    FOREIGN KEY (`Reservation_Reservation_id`)
    REFERENCES `camping_bd`.`Reservation` (`Reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_has_Activité_Activité1`
    FOREIGN KEY (`Activité_activite_id`)
    REFERENCES `camping_bd`.`Activité` (`activite_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
