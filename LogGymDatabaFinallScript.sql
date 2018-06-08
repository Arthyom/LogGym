
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inventario` (
  `IdProducto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_producto` VARCHAR(45) NULL,
  `Cantidad_almacen` VARCHAR(45) NULL,
  `Fecha_reeprovicionar` DATE NULL,
  PRIMARY KEY (`IdProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `IdProducto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_producto` VARCHAR(45) NULL,
  `Precio_producto` INT NULL,
  `Inventario_IdProducto` INT NOT NULL,
  PRIMARY KEY (`IdProducto`, `Inventario_IdProducto`),
  INDEX `fk_Productos_Inventario1_idx` (`Inventario_IdProducto` ASC),
  CONSTRAINT `fk_Productos_Inventario1`
    FOREIGN KEY (`Inventario_IdProducto`)
    REFERENCES `mydb`.`Inventario` (`IdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `IdEmpleado` INT NOT NULL AUTO_INCREMENT,
  `Nombre_empleado` VARCHAR(45) NOT NULL,
  `Horario_trabajo` VARCHAR(45) NULL,
  `Ocupacion` VARCHAR(45) NULL,
  PRIMARY KEY (`IdEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `IdProducto` INT NOT NULL,
  `Nombre_producto` VARCHAR(45) NOT NULL,
  `Cantidad` INT NULL,
  `Fecha` DATE NULL,
  `Empleados_IdEmpleado` INT NOT NULL,
  PRIMARY KEY (`IdProducto`),
  INDEX `fk_Venta_Empleados_idx` (`Empleados_IdEmpleado` ASC),
  CONSTRAINT `fk_Venta_Empleados`
    FOREIGN KEY (`Empleados_IdEmpleado`)
    REFERENCES `mydb`.`Usuarios` (`IdEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Venta_has_Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venta_has_Productos` (
  `Venta_IdProducto` INT NOT NULL,
  `Productos_IdProducto` INT NOT NULL,
  PRIMARY KEY (`Venta_IdProducto`, `Productos_IdProducto`),
  INDEX `fk_Venta_has_Productos_Productos1_idx` (`Productos_IdProducto` ASC),
  INDEX `fk_Venta_has_Productos_Venta1_idx` (`Venta_IdProducto` ASC),
  CONSTRAINT `fk_Venta_has_Productos_Venta1`
    FOREIGN KEY (`Venta_IdProducto`)
    REFERENCES `mydb`.`Venta` (`IdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_has_Productos_Productos1`
    FOREIGN KEY (`Productos_IdProducto`)
    REFERENCES `mydb`.`Productos` (`IdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre_cliente` VARCHAR(45) NOT NULL,
  `Tipo_pago` VARCHAR(45) NULL,
  `MontoAcobrar` INT NULL,
  `Fecha_ingreso` DATE NULL,
  `Venta_has_Productos_Venta_IdProducto` INT NOT NULL,
  `Venta_has_Productos_Productos_IdProducto` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `Venta_has_Productos_Venta_IdProducto`, `Venta_has_Productos_Productos_IdProducto`),
  INDEX `fk_Clientes_Venta_has_Productos1_idx` (`Venta_has_Productos_Venta_IdProducto` ASC, `Venta_has_Productos_Productos_IdProducto` ASC),
  CONSTRAINT `fk_Clientes_Venta_has_Productos1`
    FOREIGN KEY (`Venta_has_Productos_Venta_IdProducto` , `Venta_has_Productos_Productos_IdProducto`)
    REFERENCES `mydb`.`Venta_has_Productos` (`Venta_IdProducto` , `Productos_IdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Cobro de mensualidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cobro_mensualidad` (
  `IdPago` INT NOT NULL AUTO_INCREMENT,
  `Nombre_cliente` VARCHAR(45) NOT NULL,
  `Monto_pago` INT NULL,
  `Fecha_pago` DATE NULL,
  `Empleados_IdEmpleado` INT NOT NULL,
  `Clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`IdPago`, `Clientes_idCliente`),
  INDEX `fk_Cobro de mensualidad_Empleados1_idx` (`Empleados_IdEmpleado` ASC),
  INDEX `fk_Cobro de mensualidad_Clientes1_idx` (`Clientes_idCliente` ASC),
  CONSTRAINT `fk_Cobro de mensualidad_Empleados1`
    FOREIGN KEY (`Empleados_IdEmpleado`)
    REFERENCES `mydb`.`Usuarios` (`IdEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cobro de mensualidad_Clientes1`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `mydb`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `IdEmpleados` INT NOT NULL AUTO_INCREMENT,
  `Contrasena` VARCHAR(45) NULL,
  `Nombre_usuario` VARCHAR(45) NULL,
  `Usuarios_IdEmpleado` INT NOT NULL,
  PRIMARY KEY (`IdEmpleados`),
  INDEX `fk_Login_Usuarios1_idx` (`Usuarios_IdEmpleado` ASC),
  CONSTRAINT `fk_Login_Usuarios1`
    FOREIGN KEY (`Usuarios_IdEmpleado`)
    REFERENCES `mydb`.`Usuarios` (`IdEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

