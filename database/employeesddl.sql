-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employees` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `employees` ;

-- -----------------------------------------------------
-- Table `employees`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`departments` (
  `dept_no` CHAR(4) NOT NULL,
  `dept_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE INDEX `dept_name` (`dept_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`employees` (
  `emp_no` INT NOT NULL,
  `birth_date` DATE NOT NULL,
  `first_name` VARCHAR(14) NOT NULL,
  `last_name` VARCHAR(16) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`dept_emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_emp` (
  `emp_no` INT NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`),
  INDEX `dept_no` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `dept_emp_ibfk_1`
    FOREIGN KEY (`emp_no`)
    REFERENCES `employees`.`employees` (`emp_no`)
    ON DELETE CASCADE,
  CONSTRAINT `dept_emp_ibfk_2`
    FOREIGN KEY (`dept_no`)
    REFERENCES `employees`.`departments` (`dept_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`dept_manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_manager` (
  `emp_no` INT NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`),
  INDEX `dept_no` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `dept_manager_ibfk_1`
    FOREIGN KEY (`emp_no`)
    REFERENCES `employees`.`employees` (`emp_no`)
    ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2`
    FOREIGN KEY (`dept_no`)
    REFERENCES `employees`.`departments` (`dept_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`salaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`salaries` (
  `emp_no` INT NOT NULL,
  `salary` INT NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci PARTITION BY RANGE(to_days(`from_date`)) PARTITIONS 41( PARTITION p01 VALUES LESS THAN (725007),  PARTITION p02 VALUES LESS THAN (725372),  PARTITION p03 VALUES LESS THAN (725737),  PARTITION p04 VALUES LESS THAN (726102),  PARTITION p05 VALUES LESS THAN (726468),  PARTITION p06 VALUES LESS THAN (726833),  PARTITION p07 VALUES LESS THAN (727198),  PARTITION p08 VALUES LESS THAN (727563),  PARTITION p09 VALUES LESS THAN (727929),  PARTITION p10 VALUES LESS THAN (728294),  PARTITION p11 VALUES LESS THAN (728659),  PARTITION p12 VALUES LESS THAN (729024),  PARTITION p13 VALUES LESS THAN (729390),  PARTITION p14 VALUES LESS THAN (729755),  PARTITION p15 VALUES LESS THAN (730120),  PARTITION p16 VALUES LESS THAN (730485),  PARTITION p17 VALUES LESS THAN (730851),  PARTITION p18 VALUES LESS THAN (730882),  PARTITION p19 VALUES LESS THAN (730910),  PARTITION p20 VALUES LESS THAN (730941),  PARTITION p21 VALUES LESS THAN (730971),  PARTITION p22 VALUES LESS THAN (731002),  PARTITION p23 VALUES LESS THAN (731032),  PARTITION p24 VALUES LESS THAN (731063),  PARTITION p25 VALUES LESS THAN (731094),  PARTITION p26 VALUES LESS THAN (731124),  PARTITION p27 VALUES LESS THAN (731155),  PARTITION p28 VALUES LESS THAN (731185),  PARTITION p29 VALUES LESS THAN (731216),  PARTITION p30 VALUES LESS THAN (731247),  PARTITION p31 VALUES LESS THAN (731275),  PARTITION p32 VALUES LESS THAN (731306),  PARTITION p33 VALUES LESS THAN (731336),  PARTITION p34 VALUES LESS THAN (731367),  PARTITION p35 VALUES LESS THAN (731397),  PARTITION p36 VALUES LESS THAN (731428),  PARTITION p37 VALUES LESS THAN (731459),  PARTITION p38 VALUES LESS THAN (731489),  PARTITION p39 VALUES LESS THAN (731520),  PARTITION p40 VALUES LESS THAN (731550),  PARTITION p41 VALUES LESS THAN (1095728)) ;


-- -----------------------------------------------------
-- Table `employees`.`titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`titles` (
  `emp_no` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`emp_no`, `title`, `from_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci PARTITION BY RANGE(to_days(`from_date`)) PARTITIONS 19( PARTITION p01 VALUES LESS THAN (725371),  PARTITION p02 VALUES LESS THAN (725736),  PARTITION p03 VALUES LESS THAN (726101),  PARTITION p04 VALUES LESS THAN (726467),  PARTITION p05 VALUES LESS THAN (726832),  PARTITION p06 VALUES LESS THAN (727197),  PARTITION p07 VALUES LESS THAN (727562),  PARTITION p08 VALUES LESS THAN (727928),  PARTITION p09 VALUES LESS THAN (728293),  PARTITION p10 VALUES LESS THAN (728658),  PARTITION p11 VALUES LESS THAN (729023),  PARTITION p12 VALUES LESS THAN (729389),  PARTITION p13 VALUES LESS THAN (729754),  PARTITION p14 VALUES LESS THAN (730119),  PARTITION p15 VALUES LESS THAN (730484),  PARTITION p16 VALUES LESS THAN (730850),  PARTITION p17 VALUES LESS THAN (731215),  PARTITION p18 VALUES LESS THAN (731580),  PARTITION p19 VALUES LESS THAN (1096092)) ;

USE `employees` ;

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`current_dept_emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`current_dept_emp` (`emp_no` INT, `dept_no` INT, `from_date` INT, `to_date` INT);

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`dept_emp_latest_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_emp_latest_date` (`emp_no` INT, `from_date` INT, `to_date` INT);

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`v_full_departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`v_full_departments` (`dept_no` INT, `dept_name` INT, `manager` INT);

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`v_full_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`v_full_employees` (`emp_no` INT, `first_name` INT, `last_name` INT, `birth_date` INT, `gender` INT, `hire_date` INT, `department` INT);

-- -----------------------------------------------------
-- function current_manager
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `current_manager`( dept_id char(4) ) RETURNS varchar(32) CHARSET utf8mb4
    READS SQL DATA
begin
    declare max_date date;
    set max_date = (
        select
            max(from_date)
        from
            dept_manager
        where
            dept_no = dept_id
    );
    set @max_date=max_date;
    return (
        select
            emp_name(emp_no)
        from
            dept_manager
        where
            dept_no = dept_id
            and
            from_date = max_date
            limit 1
    );
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function emp_dept_id
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `emp_dept_id`( employee_id int ) RETURNS char(4) CHARSET utf8mb4
    READS SQL DATA
begin
    declare max_date date;
    set max_date = (
        select
            max(from_date)
        from
            dept_emp
        where
            emp_no = employee_id
    );
    set @max_date=max_date;
    return (
        select
            dept_no
        from
            dept_emp
        where
            emp_no = employee_id
            and
            from_date = max_date
            limit 1
    );
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function emp_dept_name
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `emp_dept_name`( employee_id int ) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA
begin
    return (
        select
            dept_name
        from
            departments
        where
            dept_no = emp_dept_id(employee_id)
    );
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function emp_name
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `emp_name`(employee_id int) RETURNS varchar(32) CHARSET utf8mb4
    READS SQL DATA
begin
    return (
        select
            concat(first_name, ' ', last_name) as name
        from
            employees
        where
            emp_no = employee_id
    );
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure employees_help
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employees_help`()
    DETERMINISTIC
begin
    select employees_usage() as info;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function employees_usage
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `employees_usage`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN
'
    == USAGE ==
    ====================

    PROCEDURE show_departments()

        shows the departments with the manager and
        number of employees per department

    FUNCTION current_manager (dept_id)

        Shows who is the manager of a given departmennt

    FUNCTION emp_name (emp_id)

        Shows name and surname of a given employee

    FUNCTION emp_dept_id (emp_id)

        Shows the current department of given employee
';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure show_departments
-- -----------------------------------------------------

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_departments`()
    MODIFIES SQL DATA
begin
    DROP TABLE IF EXISTS department_max_date;
    DROP TABLE IF EXISTS department_people;
    CREATE TEMPORARY TABLE department_max_date
    (
        emp_no int not null primary key,
        dept_from_date date not null,
        dept_to_date  date not null, # bug#320513
        KEY (dept_from_date, dept_to_date)
    );
    INSERT INTO department_max_date
    SELECT
        emp_no, max(from_date), max(to_date)
    FROM
        dept_emp
    GROUP BY
        emp_no;

    CREATE TEMPORARY TABLE department_people
    (
        emp_no int not null,
        dept_no char(4) not null,
        primary key (emp_no, dept_no)
    );

    insert into department_people
    select dmd.emp_no, dept_no
    from
        department_max_date dmd
        inner join dept_emp de
            on dmd.dept_from_date=de.from_date
            and dmd.dept_to_date=de.to_date
            and dmd.emp_no=de.emp_no;
    SELECT
        dept_no,dept_name,manager, count(*)
        from v_full_departments
            inner join department_people using (dept_no)
        group by dept_no;
        # with rollup;
    DROP TABLE department_max_date;
    DROP TABLE department_people;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- View `employees`.`current_dept_emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`current_dept_emp`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employees`.`current_dept_emp` AS select `l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`l`.`from_date` AS `from_date`,`l`.`to_date` AS `to_date` from (`employees`.`dept_emp` `d` join `employees`.`dept_emp_latest_date` `l` on(((`d`.`emp_no` = `l`.`emp_no`) and (`d`.`from_date` = `l`.`from_date`) and (`l`.`to_date` = `d`.`to_date`))));

-- -----------------------------------------------------
-- View `employees`.`dept_emp_latest_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`dept_emp_latest_date`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employees`.`dept_emp_latest_date` AS select `employees`.`dept_emp`.`emp_no` AS `emp_no`,max(`employees`.`dept_emp`.`from_date`) AS `from_date`,max(`employees`.`dept_emp`.`to_date`) AS `to_date` from `employees`.`dept_emp` group by `employees`.`dept_emp`.`emp_no`;

-- -----------------------------------------------------
-- View `employees`.`v_full_departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`v_full_departments`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employees`.`v_full_departments` AS select `employees`.`departments`.`dept_no` AS `dept_no`,`employees`.`departments`.`dept_name` AS `dept_name`,`current_manager`(`employees`.`departments`.`dept_no`) AS `manager` from `employees`.`departments`;

-- -----------------------------------------------------
-- View `employees`.`v_full_employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`v_full_employees`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employees`.`v_full_employees` AS select `employees`.`employees`.`emp_no` AS `emp_no`,`employees`.`employees`.`first_name` AS `first_name`,`employees`.`employees`.`last_name` AS `last_name`,`employees`.`employees`.`birth_date` AS `birth_date`,`employees`.`employees`.`gender` AS `gender`,`employees`.`employees`.`hire_date` AS `hire_date`,`emp_dept_name`(`employees`.`employees`.`emp_no`) AS `department` from `employees`.`employees`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
