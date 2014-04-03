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
  `name` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  INDEX `Agency_ID_idx` (`agency_id` ASC),
  CONSTRAINT `Department_Agency_ID_FK`
    FOREIGN KEY (`agency_id`)
    REFERENCES `careerjourney`.`Agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `careerjourney`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `careerjourney`.`Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `Roles_Department_ID_FK_idx` (`department_id` ASC),
  CONSTRAINT `Roles_Department_ID_FK`
    FOREIGN KEY (`department_id`)
    REFERENCES `careerjourney`.`Department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (5, 2, 'Communicate Effectively', 'Communicate clearly, actively listen to others and respond with respect');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (6, 2, 'Commit to Customer Service', 'Provide customer centric services in line with public service and organisational objectives');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (7, 2, 'Work Collaboratively', 'Collaborate with others and value their contribution');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (8, 2, 'Influence and Negotiate', 'Gain consensus and commitment from others and resolve issues and conflicts');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (9, 3, 'Deliver Results', 'Achieve results through efficient use of resources and a commitment to quality outcomes');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (10, 3, 'Plan and Prioritise', 'Plan to achieve priority outcomes and respond flexibly to changing circumstances');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (11, 3, 'Think and Solve Problems', 'Think, analyse and consider the broader context to develop practical solutions');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (12, 3, 'Demonstrate Accountability', 'Be responsible for own actions, adhere to legislation and policy and be proactive to address risk');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (13, 4, 'Finance', 'Understand and apply financial processes to achieve value for money and minimise financial risk');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (14, 4, 'Technology', 'Understand and use available technologies to maximise efficiencies and effectiveness');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (15, 4, 'Procurement and Contract Management', 'Understand and apply procurement processes to ensure effective purchasing and contract performance');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (16, 4, 'Project Management', 'Understand and apply effective planning, coordination and control methods');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (17, 5, 'Manage and Develop People', 'Engage and motivate staff and develop capability and potential in others');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (18, 5, 'Inspire Direction and Purpose', 'Communicate goals, priorities and vision and recognise achievements');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (19, 5, 'Optimise Business Outcomes', 'Manage resources effectively and apply sound workforce planning principles');
INSERT INTO `careerjourney`.`PSC_Cap_Name_Desc` (`id`, `psc_cap_group_id`, `name`, `descriptor`) VALUES (20, 5, 'Manage Reform and Change', 'Support, promote and champion change, and assist others to engage with change');

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
INSERT INTO `careerjourney`.`Department` (`id`, `agency_id`, `name`) VALUES (1, 4, 'Depot Operation');
INSERT INTO `careerjourney`.`Department` (`id`, `agency_id`, `name`) VALUES (2, 4, 'Network Control Centre');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (1, 'Duty Officer', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (2, 'Network Controller', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (3, 'Staff Supervisor', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (4, 'Duty Manager', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (5, 'Depot Manager', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (6, 'Regional General Manager', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (7, 'Senior Network Controller', 1);
INSERT INTO `careerjourney`.`Roles` (`id`, `title`, `department_id`) VALUES (8, 'Network Manager', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`PSC_Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (1, 1, 1, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (2, 1, 2, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (3, 1, 3, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (4, 1, 4, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (5, 1, 5, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (6, 1, 6, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (7, 1, 7, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (8, 1, 8, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (9, 1, 9, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (10, 1, 10, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (11, 1, 11, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (12, 1, 12, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (13, 1, 13, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (14, 1, 14, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (15, 1, 15, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (16, 1, 16, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (17, 1, 17, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (18, 1, 18, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (19, 1, 19, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (20, 1, 20, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (21, 2, 1, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (22, 2, 2, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (23, 2, 3, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (24, 2, 4, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (25, 2, 5, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (26, 2, 6, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (27, 2, 7, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (28, 2, 8, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (29, 2, 9, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (30, 2, 10, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (31, 2, 11, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (32, 2, 12, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (33, 2, 13, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (34, 2, 14, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (35, 2, 15, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (36, 2, 16, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (37, 2, 17, 5);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (38, 2, 18, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (39, 2, 19, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (40, 2, 20, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (41, 3, 1, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (42, 3, 2, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (43, 3, 3, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (44, 3, 4, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (45, 3, 5, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (46, 3, 6, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (47, 3, 7, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (48, 3, 8, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (49, 3, 9, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (50, 3, 10, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (51, 3, 11, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (52, 3, 12, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (53, 3, 13, 2);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (54, 3, 14, 1);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (55, 3, 15, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (56, 3, 16, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (57, 3, 17, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (58, 3, 18, 4);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (59, 3, 19, 3);
INSERT INTO `careerjourney`.`PSC_Roles` (`id`, `roles_id`, `psc_cap_name_desc_id`, `psc_level_id`) VALUES (60, 3, 20, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Role_Domain`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (1, 'Depot Operation');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (2, 'Network Control Centre');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (3, 'Roster/Scheduler');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (4, 'Regional Operation');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (5, 'Bus Operator Trainer (BOTS)');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (6, 'Bus Operators');
INSERT INTO `careerjourney`.`Role_Domain` (`id`, `name`) VALUES (7, 'Mechanics');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`Role_Linkage`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (1, 1, 1, 5);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (2, 1, 4, 4);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (3, 1, 3, 3);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (4, 1, 5, 2);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (5, 1, 6, 1);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (6, 2, 2, 3);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (7, 2, 7, 2);
INSERT INTO `careerjourney`.`Role_Linkage` (`id`, `role_domain_id`, `roles_id`, `rank`) VALUES (8, 2, 8, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSC_Cap_Group`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSC_Cap_Group` (`id`, `name`) VALUES (1, 'Operation Management');
INSERT INTO `careerjourney`.`OSC_Cap_Group` (`id`, `name`) VALUES (2, 'Infrastructure Management');
INSERT INTO `careerjourney`.`OSC_Cap_Group` (`id`, `name`) VALUES (3, 'System Management/Utilisation');
INSERT INTO `careerjourney`.`OSC_Cap_Group` (`id`, `name`) VALUES (4, 'Safety Management');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSC_Cap_Name`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (1, 1, 'Provide coverage of services (reschedule/adjust)');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (2, 1, 'Monitor Bus Operations/Services');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (3, 1, 'Coordinate Special Events');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (4, 1, 'Allocation of Buses for service/garaged correctly');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (5, 2, 'Servicing/repairs/replacement of AFC');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (6, 2, 'Maintain Pay-in facilities');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (7, 2, 'Maintain Opal card facilities');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (8, 2, 'User the Depot/Bus Video - serveillance system');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (9, 3, 'Hastus/DDAM/RosterPlus');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (10, 3, 'Your say line/Satisfy');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (11, 3, 'AFC');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (12, 3, 'STA Systems CHATS');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (13, 4, 'Environmental/Hazards Management');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (14, 4, 'Evacuation Procedures');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (15, 4, 'Emergency Response');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (16, 4, 'Conduct Injury/Incident Investigation');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (17, 1, 'Management of on time running');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (18, 1, 'Management of incidents and collisions');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (19, 1, 'Management of Emergency');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (20, 1, 'Management of Records and Record standards');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (21, 2, 'Provide Mechanical assistance to Bus Operators');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (22, 2, 'Provide AFC assistance');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (23, 2, 'Provide Opal Card assistance');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (24, 2, 'Liaison with Service Delivery, Mechanics and Depot');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (25, 3, '33+ Systems');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (26, 3, 'Radio Systems');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (27, 3, 'PTIPS');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (28, 3, 'Utilisation of Record Management tools');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (29, 4, 'Emergency Response Training');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (30, 4, 'Fatigue/Advance Fatigue');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (31, 4, 'Evaculation Procedure');
INSERT INTO `careerjourney`.`OSC_Cap_Name` (`id`, `osc_cap_group_id`, `name`) VALUES (32, 4, 'Incident Investigation and Reporting');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSC_Level`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSC_Level` (`id`, `level`, `description`) VALUES (1, 1, 'Tactical');
INSERT INTO `careerjourney`.`OSC_Level` (`id`, `level`, `description`) VALUES (2, 2, 'Operational');
INSERT INTO `careerjourney`.`OSC_Level` (`id`, `level`, `description`) VALUES (3, 3, 'Strategic');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSC_Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (1, 1, 1, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (2, 1, 2, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (3, 1, 3, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (4, 1, 4, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (5, 1, 5, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (6, 1, 6, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (7, 1, 7, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (8, 1, 8, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (9, 1, 9, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (10, 1, 10, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (11, 1, 11, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (12, 1, 12, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (13, 1, 13, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (14, 1, 14, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (15, 1, 15, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (16, 1, 16, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (17, 2, 1, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (18, 2, 2, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (19, 2, 3, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (20, 2, 4, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (21, 2, 5, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (22, 2, 6, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (23, 2, 7, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (24, 2, 8, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (25, 2, 9, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (26, 2, 10, 3);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (27, 2, 11, 3);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (28, 2, 12, 1);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (29, 2, 13, 3);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (30, 2, 14, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (31, 2, 15, 2);
INSERT INTO `careerjourney`.`OSC_Roles` (`id`, `roles_id`, `osc_cap_name_id`, `osc_levels_id`) VALUES (32, 2, 16, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSI_Group`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (1, 'Prerequisite Knowledge');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (2, 'Prerequisite Qualifications');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (3, 'Required Experience');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (4, 'Occupation Specific Competence');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (5, 'Authorisation Levels');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (6, 'Responsbilities/Accountabilities');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (7, 'Interface with Other Roles');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (8, 'Reporting Relationships');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (9, 'Shift / Non Shift Work');
INSERT INTO `careerjourney`.`OSI_Group` (`id`, `name`) VALUES (10, 'Available Training Courses');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSI_Info`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (1, 1, ' -  Bus Operators Award and relevant legislation, and operational procedures and systems (including those related to environment and safety), relevant to delivering Bus services to meet contract requirements\\r\\n - knowledge of the procedures for maintaining ticketing equipment and arranging necessary repairs.\\r\\n - knowledge of depot and Bus video surveillance systems and procedures for retrieval, securing and replacing of tapes or data discs as part of Incident Reporting Procedures.');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (2, 2, ' - Heavy Vehicle Drivers Licence\\r\\n - First Aid Certificate');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (3, 3, ' - Computer literacy and good working knowledge of Computer systems to provide administrative support\\r\\n - knowledge of and the demonstrated ability to implement customer Service policies and Procedures.');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (4, 4, '  <Refer to the Occuptional Specific Capability Framework>');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (5, 5, ' - N/A');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (6, 6, ' - Assistance in managing and monitoring depot operational performance\\r\\n - Supervision and coordination of the day-to-day operations of the depot\\r\\n - Effective customer relations\\r\\n - Effective customer relations');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (7, 7, ' - Bus Operator / Duty Manager / Staff Supervisor / Depot manager / Network Controller');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (8, 8, ' - Duty Manager in the respective region');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (9, 9, ' - This position is a shift work position');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (10, 10, ' - Induction Training');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (11, 1, ' - Be prepared to undertake and successfully complete all necessary training relevant to the position.\\r\\n - Extensive knowledge of State Transit operations, AFC, Revenue, Tickets, and passes.\\r\\n  - Extensive knowledge of relevant legislation, awards, regulations, and agreements affecting the operation of Sydney Buses, fleet and staff.\\r\\n - Familiarity with police and emergency services.\\r\\n - Broad mechanical knowledge of buses.\\r\\n - knowledge of Sydney Buses emergency Response Plan.\\r\\n - Understanding of and commitment to the principles of EEO, OH&S, equity and ethical practice.');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (12, 2, '  - N/A');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (13, 3, ' - Proven customer service skills in dealing with all levels of staff, the general public and outside organisations.L44');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (14, 4, '  <Refer to the Occuptional Specific Capability Framework>');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (15, 5, ' - N/A');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (16, 6, ' - Real-Time Service Monitoring – Use PTIPS to actively monitor allocated bus services or routes (covering both regular services and special events services), including monitoring of key performance information related to early running, late running, bus bunching, and bus diversions.  This is to identify current and/or potentially escalating operational problems. (As a guide, each Service Controller will be allocated approximately 150 buses)./r/n - Bus Service Co-ordination – As a result of service monitoring, apply State Transit’s PTIPS policies and procedures to make appropriate communication, intervention or other actions, to support scheduled service delivery, and effective safety and incident management./r/n - Communication with Bus Operators – Initiate contact with Bus Operators by using the radio system, in line with PTIPS service monitoring and service co-ordination above.  In addition, receive and respond to calls initiated by Bus Operators on issues such as changeovers, incidents, duress alarms, traffic diversions and other operational matters.');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (17, 7, ' - Bus Operator / Duty Manager / Staff Supervisor / Depot manager / Network Controller / Mechanics/ Emergency Divisions');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (18, 8, ' - Network Control Center Manager');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (19, 9, ' - This position is a shift work position');
INSERT INTO `careerjourney`.`OSI_Info` (`id`, `osi_group_id`, `description`) VALUES (20, 10, ' - Network Control Centre: 6 Week Development Training\\r\\n - Call Calibration Training');

COMMIT;


-- -----------------------------------------------------
-- Data for table `careerjourney`.`OSI_Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `careerjourney`;
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (1, 1, 1);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (2, 1, 2);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (3, 1, 3);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (4, 1, 4);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (5, 1, 5);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (6, 1, 6);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (7, 1, 7);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (8, 1, 8);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (9, 1, 9);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (10, 1, 10);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (11, 2, 11);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (12, 2, 12);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (13, 2, 13);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (14, 2, 14);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (15, 2, 15);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (16, 2, 16);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (17, 2, 17);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (18, 2, 18);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (19, 2, 19);
INSERT INTO `careerjourney`.`OSI_Roles` (`id`, `roles_id`, `osi_info_id`) VALUES (20, 2, 20);

COMMIT;

