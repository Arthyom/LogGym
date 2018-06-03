CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE SCHEMA IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8 ;

CREATE SCHEMA IF NOT EXISTS `mysql` DEFAULT CHARACTER SET utf8 ;



-- -----------------------------------------------------

-- Table `mydb`.`Inventario`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Inventario` (

  `IdProducto` INT NOT NULL AUTO_INCREMENT,

  `Nombre_del_producto` VARCHAR(45) NULL ,

  `Cantidad_en_almacen` VARCHAR(45) NULL ,

  `Fecha_de_reeprovicionar` DATE NULL ,

  PRIMARY KEY (`IdProducto`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Productos`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Productos` (

  `IdProducto` INT NOT NULL AUTO_INCREMENT,

  `Nombre_del_producto` VARCHAR(45) NULL ,

  `Presio_del_producto` INT NULL ,

  `Inventario_IdProducto` INT NOT NULL ,

  PRIMARY KEY (`IdProducto`, `Inventario_IdProducto`) ,

  INDEX `fk_Productos_Inventario1_idx` (`Inventario_IdProducto` ASC) ,

  CONSTRAINT `fk_Productos_Inventario1`

    FOREIGN KEY (`Inventario_IdProducto` )

    REFERENCES `mydb`.`Inventario` (`IdProducto` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Usuarios`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Usuarios` (

  `IdEmpleado` INT NOT NULL AUTO_INCREMENT,

  `Nombre_del_empleado` VARCHAR(45) NOT NULL ,

  `Horario_de_trabajo` VARCHAR(45) NULL ,

  `Ocupación` VARCHAR(45) NULL ,

  PRIMARY KEY (`IdEmpleado`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Venta`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Venta` (

  `IdVenta` INT NOT NULL AUTO_INCREMENT,

  `Nombre del producto` VARCHAR(45) NOT NULL ,

  `Cantidad` INT NULL ,

  `Fecha` DATE NULL ,

  `Empleados_IdEmpleado` INT NOT NULL ,

  PRIMARY KEY (`IdVenta`) ,

  INDEX `fk_Venta_Empleados_idx` (`Empleados_IdEmpleado` ASC) ,

  CONSTRAINT `fk_Venta_Empleados`

    FOREIGN KEY (`Empleados_IdEmpleado` )

    REFERENCES `mydb`.`Usuarios` (`IdEmpleado` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Venta_has_Productos`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Venta_has_Productos` (

  `Venta_IdProducto` INT NOT NULL ,

  `Productos_IdProducto` INT NOT NULL ,

  PRIMARY KEY (`Venta_IdProducto`, `Productos_IdProducto`) ,

  INDEX `fk_Venta_has_Productos_Productos1_idx` (`Productos_IdProducto` ASC) ,

  INDEX `fk_Venta_has_Productos_Venta1_idx` (`Venta_IdProducto` ASC) ,

  CONSTRAINT `fk_Venta_has_Productos_Venta1`

    FOREIGN KEY (`Venta_IdProducto` )

    REFERENCES `mydb`.`Venta` (`IdProducto` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_Venta_has_Productos_Productos1`

    FOREIGN KEY (`Productos_IdProducto` )

    REFERENCES `mydb`.`Productos` (`IdProducto` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Clientes`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Clientes` (

  `idCliente` INT NOT NULL ,

  `Nombre_del_cliente` VARCHAR(45) NOT NULL ,

  `Tipo_de_pago` VARCHAR(45) NULL ,

  `Monto_a_cobrar` INT NULL ,

  `Fecha_de_ingreso` DATE NULL ,

  `Venta_has_Productos_Venta_IdProducto` INT NOT NULL ,

  `Venta_has_Productos_Productos_IdProducto` INT NOT NULL ,

  PRIMARY KEY (`idCliente`, `Venta_has_Productos_Venta_IdProducto`, `Venta_has_Productos_Productos_IdProducto`) ,

  INDEX `fk_Clientes_Venta_has_Productos1_idx` (`Venta_has_Productos_Venta_IdProducto` ASC, `Venta_has_Productos_Productos_IdProducto` ASC) ,

  CONSTRAINT `fk_Clientes_Venta_has_Productos1`

    FOREIGN KEY (`Venta_has_Productos_Venta_IdProducto` , `Venta_has_Productos_Productos_IdProducto` )

    REFERENCES `mydb`.`Venta_has_Productos` (`Venta_IdProducto` , `Productos_IdProducto` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Cobro de mensualidad`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Cobro de mensualidad` (

  `IdPago` INT NOT NULL ,

  `Nombre_del_cliente` VARCHAR(45) NOT NULL ,

  `Monto_del_pago` INT NULL ,

  `Fecha_del_pago` DATE NULL ,

  `Empleados_IdEmpleado` INT NOT NULL ,

  `Clientes_idCliente` INT NOT NULL ,

  PRIMARY KEY (`IdPago`, `Clientes_idCliente`) ,

  INDEX `fk_Cobro de mensualidad_Empleados1_idx` (`Empleados_IdEmpleado` ASC) ,

  INDEX `fk_Cobro de mensualidad_Clientes1_idx` (`Clientes_idCliente` ASC) ,

  CONSTRAINT `fk_Cobro de mensualidad_Empleados1`

    FOREIGN KEY (`Empleados_IdEmpleado` )

    REFERENCES `mydb`.`Usuarios` (`IdEmpleado` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_Cobrde mensualidad_Clientes1`

    FOREIGN KEY (`Clientes_idCliente` )

    REFERENCES `mydb`.`Clientes` (`idCliente` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `mydb`.`Login`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mydb`.`Login` (

  `IdEmpleados` INT NOT NULL ,

  `Password` VARCHAR(45) NULL ,

  `Nombre_del_usuario` VARCHAR(45) NULL ,

  `Usuarios_IdEmpleado` INT NOT NULL ,

  PRIMARY KEY (`IdEmpleados`) ,

  INDEX `fk_Login_Usuarios1_idx` (`Usuarios_IdEmpleado` ASC) ,

  CONSTRAINT `fk_Login_Usuarios1`

    FOREIGN KEY (`Usuarios_IdEmpleado` )

    REFERENCES `mydb`.`Usuarios` (`IdEmpleado` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;


-- -----------------------------------------------------

-- Table `mysql`.`columns_priv`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`columns_priv` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Table_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Column_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `Column_priv` SET('Select','Insert','Update','References') NOT NULL DEFAULT '' ,

  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'Column privileges';





-- -----------------------------------------------------

-- Table `mysql`.`db`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`db` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Select_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Insert_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Update_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Delete_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Drop_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Grant_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `References_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Index_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Alter_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_tmp_table_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Lock_tables_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Show_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Alter_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Execute_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Event_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Trigger_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  PRIMARY KEY (`Host`, `Db`, `User`) ,

  INDEX `User` (`User` ASC) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'Database privileges';





-- -----------------------------------------------------

-- Table `mysql`.`engine_cost`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`engine_cost` (

  `engine_name` VARCHAR(64) NOT NULL ,

  `device_type` INT(11) NOT NULL ,

  `cost_name` VARCHAR(64) NOT NULL ,

  `cost_value` FLOAT NULL DEFAULT NULL ,

  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `comment` VARCHAR(1024) NULL DEFAULT NULL ,

  PRIMARY KEY (`cost_name`, `engine_name`, `device_type`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `mysql`.`event`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`event` (

  `db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `name` CHAR(64) NOT NULL DEFAULT '' ,

  `body` LONGBLOB NOT NULL ,

  `definer` CHAR(93) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `execute_at` DATETIME NULL DEFAULT NULL ,

  `interval_value` INT(11) NULL DEFAULT NULL ,

  `interval_field` ENUM('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') NULL DEFAULT NULL ,

  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,

  `last_executed` DATETIME NULL DEFAULT NULL ,

  `starts` DATETIME NULL DEFAULT NULL ,

  `ends` DATETIME NULL DEFAULT NULL ,

  `status` ENUM('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED' ,

  `on_completion` ENUM('DROP','PRESERVE') NOT NULL DEFAULT 'DROP' ,

  `sql_mode` SET('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '' ,

  `comment` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `originator` INT(10) UNSIGNED NOT NULL ,

  `time_zone` CHAR(64) CHARACTER SET 'latin1' NOT NULL DEFAULT 'SYSTEM' ,

  `character_set_client` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `collation_connection` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `db_collation` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `body_utf8` LONGBLOB NULL DEFAULT NULL ,

  PRIMARY KEY (`db`, `name`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COMMENT = 'Events';





-- -----------------------------------------------------

-- Table `mysql`.`func`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`func` (

  `name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `ret` TINYINT(1) NOT NULL DEFAULT '0' ,

  `dl` CHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `type` ENUM('function','aggregate') CHARACTER SET 'utf8' NOT NULL ,

  PRIMARY KEY (`name`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'User defined functions';





-- -----------------------------------------------------

-- Table `mysql`.`gtid_executed`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`gtid_executed` (

  `source_uuid` CHAR(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.' ,

  `interval_start` BIGINT(20) NOT NULL COMMENT 'First number of interval.' ,

  `interval_end` BIGINT(20) NOT NULL COMMENT 'Last number of interval.' ,

  PRIMARY KEY (`source_uuid`, `interval_start`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `mysql`.`help_category`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`help_category` (

  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL ,

  `name` CHAR(64) NOT NULL ,

  `parent_category_id` SMALLINT(5) UNSIGNED NULL DEFAULT NULL ,

  `url` TEXT NOT NULL ,

  PRIMARY KEY (`help_category_id`) ,

  UNIQUE INDEX `name` (`name` ASC) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'help categories';





-- -----------------------------------------------------

-- Table `mysql`.`help_keyword`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`help_keyword` (

  `help_keyword_id` INT(10) UNSIGNED NOT NULL ,

  `name` CHAR(64) NOT NULL ,

  PRIMARY KEY (`help_keyword_id`) ,

  UNIQUE INDEX `name` (`name` ASC) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'help keywords';





-- -----------------------------------------------------

-- Table `mysql`.`help_relation`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`help_relation` (

  `help_topic_id` INT(10) UNSIGNED NOT NULL ,

  `help_keyword_id` INT(10) UNSIGNED NOT NULL ,

  PRIMARY KEY (`help_keyword_id`, `help_topic_id`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'keyword-topic relation';





-- -----------------------------------------------------

-- Table `mysql`.`help_topic`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`help_topic` (

  `help_topic_id` INT(10) UNSIGNED NOT NULL ,

  `name` CHAR(64) NOT NULL ,

  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL ,

  `description` TEXT NOT NULL ,

  `example` TEXT NOT NULL ,

  `url` TEXT NOT NULL ,

  PRIMARY KEY (`help_topic_id`) ,

  UNIQUE INDEX `name` (`name` ASC) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'help topics';





-- -----------------------------------------------------

-- Table `mysql`.`innodb_index_stats`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`innodb_index_stats` (

  `database_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `table_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `index_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `stat_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `stat_value` BIGINT(20) UNSIGNED NOT NULL ,

  `sample_size` BIGINT(20) UNSIGNED NULL DEFAULT NULL ,

  `stat_description` VARCHAR(1024) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  PRIMARY KEY (`database_name`, `table_name`, `index_name`, `stat_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin;





-- -----------------------------------------------------

-- Table `mysql`.`innodb_table_stats`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`innodb_table_stats` (

  `database_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `table_name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `n_rows` BIGINT(20) UNSIGNED NOT NULL ,

  `clustered_index_size` BIGINT(20) UNSIGNED NOT NULL ,

  `sum_of_other_index_sizes` BIGINT(20) UNSIGNED NOT NULL ,

  PRIMARY KEY (`database_name`, `table_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin;





-- -----------------------------------------------------

-- Table `mysql`.`ndb_binlog_index`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`ndb_binlog_index` (

  `Position` BIGINT(20) UNSIGNED NOT NULL ,

  `File` VARCHAR(255) NOT NULL ,

  `epoch` BIGINT(20) UNSIGNED NOT NULL ,

  `inserts` INT(10) UNSIGNED NOT NULL ,

  `updates` INT(10) UNSIGNED NOT NULL ,

  `deletes` INT(10) UNSIGNED NOT NULL ,

  `schemaops` INT(10) UNSIGNED NOT NULL ,

  `orig_server_id` INT(10) UNSIGNED NOT NULL ,

  `orig_epoch` BIGINT(20) UNSIGNED NOT NULL ,

  `gci` INT(10) UNSIGNED NOT NULL ,

  `next_position` BIGINT(20) UNSIGNED NOT NULL ,

  `next_file` VARCHAR(255) NOT NULL ,

  PRIMARY KEY (`epoch`, `orig_server_id`, `orig_epoch`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `mysql`.`plugin`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`plugin` (

  `name` VARCHAR(64) NOT NULL DEFAULT '' ,

  `dl` VARCHAR(128) NOT NULL DEFAULT '' ,

  PRIMARY KEY (`name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'MySQL plugins';





-- -----------------------------------------------------

-- Table `mysql`.`proc`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`proc` (

  `db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `name` CHAR(64) NOT NULL DEFAULT '' ,

  `type` ENUM('FUNCTION','PROCEDURE') NOT NULL ,

  `specific_name` CHAR(64) NOT NULL DEFAULT '' ,

  `language` ENUM('SQL') NOT NULL DEFAULT 'SQL' ,

  `sql_data_access` ENUM('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL' ,

  `is_deterministic` ENUM('YES','NO') NOT NULL DEFAULT 'NO' ,

  `security_type` ENUM('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER' ,

  `param_list` BLOB NOT NULL ,

  `returns` LONGBLOB NOT NULL ,

  `body` LONGBLOB NOT NULL ,

  `definer` CHAR(93) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,

  `sql_mode` SET('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '' ,

  `comment` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `character_set_client` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `collation_connection` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `db_collation` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `body_utf8` LONGBLOB NULL DEFAULT NULL ,

  PRIMARY KEY (`db`, `name`, `type`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COMMENT = 'Stored Procedures';





-- -----------------------------------------------------

-- Table `mysql`.`procs_priv`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`procs_priv` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Routine_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '' ,

  `Routine_type` ENUM('FUNCTION','PROCEDURE') CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `Grantor` CHAR(93) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Proc_priv` SET('Execute','Alter Routine','Grant') NOT NULL DEFAULT '' ,

  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`) ,

  INDEX `Grantor` (`Grantor` ASC) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'Procedure privileges';





-- -----------------------------------------------------

-- Table `mysql`.`proxies_priv`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`proxies_priv` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Proxied_host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Proxied_user` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `With_grant` TINYINT(1) NOT NULL DEFAULT '0' ,

  `Grantor` CHAR(93) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`) ,

  INDEX `Grantor` (`Grantor` ASC) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'User proxy privileges';





-- -----------------------------------------------------

-- Table `mysql`.`server_cost`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`server_cost` (

  `cost_name` VARCHAR(64) NOT NULL ,

  `cost_value` FLOAT NULL DEFAULT NULL ,

  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `comment` VARCHAR(1024) NULL DEFAULT NULL ,

  PRIMARY KEY (`cost_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `mysql`.`servers`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`servers` (

  `Server_name` CHAR(64) NOT NULL DEFAULT '' ,

  `Host` CHAR(64) NOT NULL DEFAULT '' ,

  `Db` CHAR(64) NOT NULL DEFAULT '' ,

  `Username` CHAR(64) NOT NULL DEFAULT '' ,

  `Password` CHAR(64) NOT NULL DEFAULT '' ,

  `Port` INT(4) NOT NULL DEFAULT '0' ,

  `Socket` CHAR(64) NOT NULL DEFAULT '' ,

  `Wrapper` CHAR(64) NOT NULL DEFAULT '' ,

  `Owner` CHAR(64) NOT NULL DEFAULT '' ,

  PRIMARY KEY (`Server_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'MySQL Foreign Servers table';





-- -----------------------------------------------------

-- Table `mysql`.`slave_master_info`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`slave_master_info` (

  `Number_of_lines` INT(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file.' ,

  `Master_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT 'The name of the master binary log currently being read from the master.' ,

  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.' ,

  `Host` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The host name of the master.' ,

  `User_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The user name used to connect to the master.' ,

  `User_password` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The password used to connect to the master.' ,

  `Port` INT(10) UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.' ,

  `Connect_retry` INT(10) UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.' ,

  `Enabled_ssl` TINYINT(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.' ,

  `Ssl_ca` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The file used for the Certificate Authority (CA) certificate.' ,

  `Ssl_capath` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The path to the Certificate Authority (CA) certificates.' ,

  `Ssl_cert` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The name of the SSL certificate file.' ,

  `Ssl_cipher` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The name of the cipher in use for the SSL connection.' ,

  `Ssl_key` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The name of the SSL key file.' ,

  `Ssl_verify_server_cert` TINYINT(1) NOT NULL COMMENT 'Whether to verify the server certificate.' ,

  `Heartbeat` FLOAT NOT NULL ,

  `Bind` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'Displays which interface is employed when connecting to the MySQL server' ,

  `Ignored_server_ids` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs' ,

  `Uuid` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The master server uuid.' ,

  `Retry_count` BIGINT(20) UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.' ,

  `Ssl_crl` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The file used for the Certificate Revocation List (CRL)' ,

  `Ssl_crlpath` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'The path used for Certificate Revocation List (CRL) files' ,

  `Enabled_auto_position` TINYINT(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.' ,

  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication' ,

  `Tls_version` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'Tls version' ,

  PRIMARY KEY (`Channel_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'Master Information';





-- -----------------------------------------------------

-- Table `mysql`.`slave_relay_log_info`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`slave_relay_log_info` (

  `Number_of_lines` INT(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.' ,

  `Relay_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT 'The name of the current relay log file.' ,

  `Relay_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The relay log position of the last executed event.' ,

  `Master_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.' ,

  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last executed event.' ,

  `Sql_delay` INT(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.' ,

  `Number_of_workers` INT(10) UNSIGNED NOT NULL ,

  `Id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal Id that uniquely identifies this record.' ,

  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication' ,

  PRIMARY KEY (`Channel_name`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'Relay Log Information';





-- -----------------------------------------------------

-- Table `mysql`.`slave_worker_info`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`slave_worker_info` (

  `Id` INT(10) UNSIGNED NOT NULL ,

  `Relay_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `Relay_log_pos` BIGINT(20) UNSIGNED NOT NULL ,

  `Master_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL ,

  `Checkpoint_relay_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `Checkpoint_relay_log_pos` BIGINT(20) UNSIGNED NOT NULL ,

  `Checkpoint_master_log_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,

  `Checkpoint_master_log_pos` BIGINT(20) UNSIGNED NOT NULL ,

  `Checkpoint_seqno` INT(10) UNSIGNED NOT NULL ,

  `Checkpoint_group_size` INT(10) UNSIGNED NOT NULL ,

  `Checkpoint_group_bitmap` BLOB NOT NULL ,

  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication' ,

  PRIMARY KEY (`Channel_name`, `Id`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8

COMMENT = 'Worker Information';





-- -----------------------------------------------------

-- Table `mysql`.`tables_priv`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`tables_priv` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Table_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Grantor` CHAR(93) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,

  `Table_priv` SET('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') NOT NULL DEFAULT '' ,

  `Column_priv` SET('Select','Insert','Update','References') NOT NULL DEFAULT '' ,

  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`) ,

  INDEX `Grantor` (`Grantor` ASC) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'Table privileges';

-- -----------------------------------------------------

-- Table `mysql`.`user`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `mysql`.`user` (

  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `User` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,

  `Select_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Insert_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Update_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Delete_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Drop_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Reload_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Shutdown_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Process_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `File_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Grant_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `References_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Index_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Alter_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Show_db_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Super_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_tmp_table_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Lock_tables_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Execute_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Repl_slave_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Repl_client_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Show_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Alter_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_user_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Event_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Trigger_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `Create_tablespace_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `ssl_type` ENUM('','ANY','X509','SPECIFIED') CHARACTER SET 'utf8' NOT NULL DEFAULT '' ,

  `ssl_cipher` BLOB NOT NULL ,

  `x509_issuer` BLOB NOT NULL ,

  `x509_subject` BLOB NOT NULL ,

  `max_questions` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,

  `max_updates` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,

  `max_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,

  `max_user_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,

  `plugin` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'mysql_native_password' ,

  `authentication_string` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,

  `password_expired` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  `password_last_changed` TIMESTAMP NULL DEFAULT NULL ,

  `password_lifetime` SMALLINT(5) UNSIGNED NULL DEFAULT NULL ,

  `account_locked` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,

  PRIMARY KEY (`Host`, `User`) )

ENGINE = MyISAM

DEFAULT CHARACTER SET = utf8

COLLATE = utf8_bin

COMMENT = 'Users and global privileges';

USE `mydb` ;

USE `mysql` ;

DELIMITER $$



DELIMITER ;



DELIMITER $$



DELIMITER ;



SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
