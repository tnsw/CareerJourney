SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `careerjourney` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `careerjourney` ;

-- -----------------------------------------------------
-- Table `careerjourney`.`PSC_Cap_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`PSC_Cap_Group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`PSC_Cap_Name_Desc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`PSC_Cap_Name_Desc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `psc_cap_group_id` INT NULL,
  `name` VARCHAR(256) NULL,
  `descriptor` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `PSC_Cap_Group_ID_idx` (`psc_cap_group_id` ASC),
  CONSTRAINT `PSC_Cap_Name_Desc_PSC_Cap_Group_ID_FK`
    FOREIGN KEY (`psc_cap_group_id`)
    REFERENCES `careerjourney`.`PSC_Cap_Group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`PSC_Level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`PSC_Level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`PSC_Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`PSC_Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roles_id` INT NULL,
  `psc_cap_name_desc_id` INT NULL,
  `psc_level_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `PSC_Cap_Name_Desc_ID_idx` (`psc_cap_name_desc_id` ASC),
  INDEX `PSC_Level_ID_idx` (`psc_level_id` ASC),
  INDEX `Role_ID_idx` (`roles_id` ASC),
  CONSTRAINT `PSC_Roles_Roles_ID_FK`
    FOREIGN KEY (`roles_id`)
    REFERENCES `careerjourney`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PSC_Roles_PSC_Cap_Name_Desc_ID_FK`
    FOREIGN KEY (`psc_cap_name_desc_id`)
    REFERENCES `careerjourney`.`PSC_Cap_Name_Desc` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PSC_Roles_PSC_Level_ID_FK`
    FOREIGN KEY (`psc_level_id`)
    REFERENCES `careerjourney`.`PSC_Level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Agency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Agency` (
  `id` INT NOT NULL DEFAULT 6,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `agency_id` INT NULL,
  `roles_id` INT NULL,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  INDEX `Agency_ID_idx` (`agency_id` ASC),
  INDEX `Role_ID_idx` (`roles_id` ASC),
  CONSTRAINT `Department_Agency_ID_FK`
    FOREIGN KEY (`agency_id`)
    REFERENCES `careerjourney`.`Agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Department_Role_ID_FK`
    FOREIGN KEY (`roles_id`)
    REFERENCES `careerjourney`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Role_Domain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Role_Domain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Role_Linkage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Role_Linkage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_domain_id` INT NULL,
  `roles_id` INT NULL,
  `rank` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `Role_Linkage_Role_Domain_ID_idx` (`role_domain_id` ASC),
  INDEX `Role_Linkage_Roles_ID_idx` (`roles_id` ASC),
  CONSTRAINT `Role_Linkage_Role_Domain_ID`
    FOREIGN KEY (`role_domain_id`)
    REFERENCES `careerjourney`.`Role_Domain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Role_Linkage_Roles_ID`
    FOREIGN KEY (`roles_id`)
    REFERENCES `careerjourney`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSC_Cap_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSC_Cap_Group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSC_Cap_Name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSC_Cap_Name` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `osc_cap_group_id` INT NULL,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  INDEX `OSC_Cap_Group_ID_idx` (`osc_cap_group_id` ASC),
  CONSTRAINT `OSC_Cap_Name_OSC_Cap_Group_ID_FK`
    FOREIGN KEY (`osc_cap_group_id`)
    REFERENCES `careerjourney`.`OSC_Cap_Group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSC_Level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSC_Level` (
  `id` INT NOT NULL,
  `level` INT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSC_Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSC_Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roles_id` INT NULL,
  `osc_cap_name_id` INT NULL,
  `osc_levels_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `OSC_Cap_Name_ID_idx` (`osc_cap_name_id` ASC),
  INDEX `Role_ID_idx` (`roles_id` ASC),
  INDEX `OSC_Level_ID_FK_idx` (`osc_levels_id` ASC),
  CONSTRAINT `OSC_Roles_OSC_Cap_Name_ID_FK`
    FOREIGN KEY (`osc_cap_name_id`)
    REFERENCES `careerjourney`.`OSC_Cap_Name` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OSC_Roles_Roles_ID_FK`
    FOREIGN KEY (`roles_id`)
    REFERENCES `careerjourney`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OSC_Level_ID_FK`
    FOREIGN KEY (`osc_levels_id`)
    REFERENCES `careerjourney`.`OSC_Level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSI_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSI_Group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSI_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSI_Info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `osi_group_id` INT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `OSI_Group_ID_idx` (`osi_group_id` ASC),
  CONSTRAINT `OSI_Info_OSI_Group_ID_FK`
    FOREIGN KEY (`osi_group_id`)
    REFERENCES `careerjourney`.`OSI_Group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`OSI_Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`OSI_Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roles_id` INT NULL,
  `osi_info_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `Roles_ID_idx` (`roles_id` ASC),
  INDEX `OSI_Info_ID_idx` (`osi_info_id` ASC),
  CONSTRAINT `OSI_Roles_Roles_ID_FK`
    FOREIGN KEY (`roles_id`)
    REFERENCES `careerjourney`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OSI_Roles_OSI_Info_ID_FK`
    FOREIGN KEY (`osi_info_id`)
    REFERENCES `careerjourney`.`OSI_Info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`ci_sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`ci_sessions` (
  `session_id` VARCHAR(40) NOT NULL DEFAULT 0,
  `ip_address` VARCHAR(45) NOT NULL DEFAULT 0,
  `user_agent` VARCHAR(120) NOT NULL,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` TEXT NOT NULL,
  PRIMARY KEY (`session_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `careerjourney`.`PSC_Cap_Group`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`PSC_Cap_Group` (`id`, `name`) VALUES (1, 'Personal Attributes');
INSERT INTO `careerjourney`.`PSC_Cap_Group` (`id`, `name`) VALUES (2, 'Relationships');
INSERT INTO `careerjourney`.`PSC_Cap_Group` (`id`, `name`) VALUES (3, 'Results');
INSERT INTO `careerjourney`.`PSC_Cap_Group` (`id`, `name`) VALUES (4, 'Business Enablers');
INSERT INTO `careerjourney`.`PSC_Cap_Group` (`id`, `name`) VALUES (5, 'People Management');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`PSC_Cap_Name_Desc`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (1, 1, 'Display Resilience and Courage', 'Be open and honest, prepared to express your views, and willing to acept and commit to change');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (2, 1, 'Act with Integrity', 'Be ethical and professional, and adhere to the Public Sector Values');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (3, 1, 'Manage Self', 'Show drive and motivation, a measured approach and a commitment to learning');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (4, 1, 'Value Diversity', 'Show respect for diverse backgrounds, experiences and perspectives');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`PSC_Level`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`PSC_Level` (`id`, `name`) VALUES (1, 'Foundational');
INSERT INTO `careerjourney`.`PSC_Level` (`id`, `name`) VALUES (2, 'Intermediate');
INSERT INTO `careerjourney`.`PSC_Level` (`id`, `name`) VALUES (3, 'Adept');
INSERT INTO `careerjourney`.`PSC_Level` (`id`, `name`) VALUES (4, 'Advanced');
INSERT INTO `careerjourney`.`PSC_Level` (`id`, `name`) VALUES (5, 'Highly Advanced');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (1, 'Duty Officer', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (2, 'Network Controller', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Agency`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Agency` (`id`, `name`) VALUES (1, 'TfNSW');
INSERT INTO `careerjourney`.`Agency` (`id`, `name`) VALUES (2, 'Sydney Trains');
INSERT INTO `careerjourney`.`Agency` (`id`, `name`) VALUES (3, 'NSW Trains');
INSERT INTO `careerjourney`.`Agency` (`id`, `name`) VALUES (4, 'State Transit');
INSERT INTO `careerjourney`.`Agency` (`id`, `name`) VALUES (5, 'Roads and Maritime Services');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Department` (`id`, `agency_id`, `roles_id`, `name`) VALUES (1, 4, 1, 'Depot Operation');
INSERT INTO `careerjourney`.`Department` (`id`, `agency_id`, `roles_id`, `name`) VALUES (2, 4, 2, 'Network Control Centre');

COMMIT;

