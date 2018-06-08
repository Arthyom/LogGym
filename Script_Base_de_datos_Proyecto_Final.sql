CREATE DATABASE IF NOT EXISTS GYM;

use GYM;


CREATE  TABLE `gym`.`Clientes` (
  
	`idClientes` INT NOT NULL AUTO_INCREMENT ,
  
	`Nombre_Cliente` VARCHAR(45) NOT NULL ,
  
	`Tipo_Pago` VARCHAR(45) NOT NULL ,
  
	`Monto_A_Pagar` INT NOT NULL ,
  
	`Fecha_Ingreso` DATE NOT NULL ,
  `
	` VARCHAR(45) NULL ,
  
	PRIMARY KEY (`idClientes`) 
)
COMMENT = 'Tabla de clientes';

CREATE  TABLE `gym`.`Cobro_Mensualidad` (
  
	`IdPago` INT NOT NULL ,
  
	`MontoAPagar` INT NOT NULL ,
  
	`Fecha_Pago` DATE NOT NULL ,
  
	`IdEmpleado` INT NULL ,
  
	`IdCliente` INT NULL ,
  
	PRIMARY KEY (`IdPago`) ,
  
	INDEX `idCliente_Pago_idx` 
	(`IdCliente` ASC) ,
  
	CONSTRAINT `idCliente_Pago`
    
	FOREIGN KEY (`IdCliente` )
    
	REFERENCES `gym`.`clientes` (`idClientes` )
    
	ON DELETE 
	NO ACTION
    
	ON UPDATE 
	NO ACTION
	)
	
COMMENT = 'Cobro de la mensualidad al cliente';



CREATE  TABLE `gym`.`Productos` (
  
	`idProductos` INT NOT NULL AUTO_INCREMENT ,
  
	`NombreProducto` VARCHAR(45) NOT NULL ,
  	
	`PresioUnitario` VARCHAR(45) NOT NULL ,
  
	PRIMARY KEY (`idProductos`) 
	)
COMMENT = 'Productos';



CREATE  TABLE `gym`.`inventarios` (
  
	`idProducto` INT NOT NULL ,
  
	`nombreProducto` VARCHAR(45) NOT NULL ,
  
	`Cantidad_En_Almacen` INT NOT NULL ,
  
	`Fecha_Reeprovicion` DATE NOT NULL ,
  
	PRIMARY KEY (`idProducto`) 
	)
COMMENT = 'Inventario del gymnacio';

CREATE  TABLE `gym`.`Usuarios` (
  
	`idUsuario` INT NOT NULL AUTO_INCREMENT ,
  
	`NombreEmpleado` VARCHAR(45) NOT NULL ,
  
	`Horario de trabajo` VARCHAR(45) NOT NULL ,
  
	`Labor` VARCHAR(45) NOT NULL ,
  
	PRIMARY KEY (`idUsuario`) 
	)
COMMENT = 'Usuarios que utiizan el programa';


ALTER TABLE `gym`.`productos` 

ADD UNIQUE INDEX `NombreProducto_UNIQUE` 
(`NombreProducto` ASC) ;


ALTER TABLE `gym`.`productos` 

DROP PRIMARY KEY 
, 
ADD PRIMARY KEY (`idProductos`, `NombreProducto`) 
, 
DROP INDEX `NombreProducto_UNIQUE` ;



CREATE  TABLE `gym`.`Ventas` 
(
  
`idVenta` INT NOT NULL AUTO_INCREMENT ,
  
`Idproducto` INT NOT NULL ,
  
`Nombre del producto` VARCHAR(45) NOT NULL ,
  
`Cantidad` VARCHAR(45) NOT NULL ,
  
`FechaVenta` DATE NOT NULL ,
  
PRIMARY KEY (`idVenta`) ,
  
CONSTRAINT `Venta_Producto`
    
FOREIGN KEY (`Idproducto` 
)
    
REFERENCES `gym`.`productos` (`idProductos` )
    
ON DELETE NO ACTION
    
ON UPDATE NO ACTION
)
COMMENT = 'Registro de ventas';



ALTER TABLE `gym`.`ventas` 
  
ADD CONSTRAINT `Nombre_productos`
  
FOREIGN KEY (`Nombre del producto` )
  
REFERENCES `gym`.`productos` (`NombreProducto` )
  
ON DELETE 
NO ACTION
  
ON UPDATE
NO ACTION
, 
ADD INDEX `Nombre_productos_idx` (`Nombre del producto` ASC) ;



ALTER TABLE `gym`.`productos` 

DROP PRIMARY KEY 
, 
ADD PRIMARY KEY (`idProductos`) ;



ALTER TABLE `gym`.`ventas` 
ADD COLUMN `IdEmpleado` 
INT NOT NULL  AFTER `FechaVenta` , 
  
ADD CONSTRAINT `Venta_Empleado`
  
FOREIGN KEY (`IdEmpleado` )
  
REFERENCES `gym`.`usuarios` (`idUsuario` )
  
ON DELETE 
NO ACTION
  
ON UPDATE 
NO ACTION
, 
ADD INDEX `Venta_Empleado_idx` (`IdEmpleado` ASC) ;



ALTER TABLE `gym`.`inventario` 
DROP COLUMN `Inventariocol` , 
  
ADD CONSTRAINT `IDProductos`
  
FOREIGN KEY (`IdProducto` )
  
REFERENCES `gym`.`productos` (`idProductos` )
  
ON DELETE 
NO ACTION
  
ON UPDATE 
NO ACTION
, 
ADD INDEX `IDProductos_idx` (`IdProducto` ASC) 
, 
ADD PRIMARY KEY (`IdProducto`) ;



ALTER TABLE `gym`.`cobro_mensualidad` 
DROP FOREIGN KEY `idCliente_Pago` ;


ALTER TABLE `gym`.`cobro_mensualidad` 
CHANGE COLUMN `IdEmpleado` `IdEmpleado` INT(11) NOT NULL  , 
CHANGE COLUMN `IdCliente` `IdCliente` INT(11) NOT NULL  , 
  
ADD CONSTRAINT `idCliente_Pago`
  FOREIGN KEY (`IdCliente` )
  
REFERENCES `gym`.`clientes` (`idClientes` )
  
ON DELETE 
NO ACTION
  
ON UPDATE 
NO ACTION, 
  
ADD CONSTRAINT `IdCobro_Empleado`
  
FOREIGN KEY (`IdEmpleado` )
  
REFERENCES `gym`.`usuarios` (`idUsuario` )
  
ON DELETE 
NO ACTION
  
ON UPDATE 
NO ACTION
, 
ADD INDEX `IdCobro_Empleado_idx` (`IdEmpleado` ASC) ;


SELECT * FROM GYM.clientes;
INSERT INTO `GYM`.`clientes` (`Nombre_Cliente`, `Tipo_Pago`, `Monto_A_Pagar`, `Fecha_Ingreso`) VALUES ('Luis Guzman', 'Normal', '350', '2018-06-02');

INSERT INTO `GYM`.`clientes` (`Nombre_Cliente`, `Tipo_Pago`, `Monto_A_Pagar`, `Fecha_Ingreso`) VALUES ('Jose Lalo Hernandez', 'Estudiante', '300', '2018-06-03');

INSERT INTO `GYM`.`clientes` (`Nombre_Cliente`, `Tipo_Pago`, `Monto_A_Pagar`, `Fecha_Ingreso`) VALUES ('Ana Karen Herrera', 'Estudiante', '300', '2018-06-07');

INSERT INTO `GYM`.`clientes` (`Nombre_Cliente`, `Tipo_Pago`, `Monto_A_Pagar`, `Fecha_Ingreso`) VALUES ('Loaisa Larga', 'Normal', '350', '2018-02-02');


SELECT * FROM GYM.Productos;
INSERT INTO `GYM`.`Productos` (`NombreProducto`, `PresioUnitario`) VALUES ('Way Protein', '1200');

INSERT INTO `GYM`.`Productos` (`NombreProducto`, `PresioUnitario`) VALUES ('Gaytorade 600', 
INSERT INTO `GYM`.`Productos` (`NombreProducto`, `PresioUnitario`) VALUES ('Agua 600 ml', '10');

INSERT INTO `GYM`.`Productos` (`NombreProducto`, `PresioUnitario`) VALUES ('Medida de glutamina', '20');
	


SELECT * FROM GYM.Usuarios;
INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`, `Horario de trabajo`, `Labor`) VALUES ('Bernrdito', '8 a 10 Lun-Vie', 'Barrendero');

INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`, `Horario de trabajo`, `Labor`) VALUES ('Juan Carlos', '8 a 10 Lun-Vie', 'Instructor');

INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`, `Horario de trabajo`, `Labor`) VALUES ('Alfredito', '8 a 10 Lun-Vie', 'Limpia vidrios');


SELECT * FROM GYM.Ventas;
INSERT INTO `GYM`.`Ventas` (`Idproducto`, `Nombre del producto`, `Cantidad`, `FechaVenta`, `IdEmpleado`) VALUES ('1', 'Proteina', '1', '2018-06-02', '1');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `Nombre del producto`, `Cantidad`, `FechaVenta`, `IdEmpleado`) VALUES ('2', 'gaytorade', '1', '2018-06-04', '1');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `Nombre del producto`, `Cantidad`, `FechaVenta`, `IdEmpleado`) VALUES ('3', 'agua', '2', '2018-06-03', '2');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `Nombre del producto`, `Cantidad`, `FechaVenta`, `IdEmpleado`) VALUES ('4', 'Medida', '1', '2018-06-03', '2');


SELECT * FROM GYM.Inventario;
INSERT INTO `GYM`.`Inventario` (`IdProducto`, `NombreProducto`, `Cantidad_En_Almacen`, `Fecha_Reeprovicionar`) VALUES ('1', 'Prtoteina', '3', '2018-06-15');

INSERT INTO `GYM`.`Inventario` (`IdProducto`, `NombreProducto`, `Cantidad_En_Almacen`, `Fecha_Reeprovicionar`) VALUES ('3', 'agua', '30', '2018-06-15');

INSERT INTO `GYM`.`Inventario` (`IdProducto`, `NombreProducto`, `Cantidad_En_Almacen`, `Fecha_Reeprovicionar`) VALUES ('2', 'Gaytorade', '20', '2018-06-10');

INSERT INTO `GYM`.`Inventario` (`IdProducto`, `NombreProducto`, `Cantidad_En_Almacen`, `Fecha_Reeprovicionar`) VALUES ('4', 'Medidas', '59', '2018-06-15');


SELECT * FROM GYM.cobro_mensualidad;
INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`, `Fecha_Pago`, `IdEmpleado`, `IdCliente`) VALUES ('300', '2018-06-02', '1', '2');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`, `Fecha_Pago`, `IdEmpleado`, `IdCliente`) VALUES ('300', '2018-06-02', '1', '3');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`, `Fecha_Pago`, `IdEmpleado`, `IdCliente`) VALUES ('350', '2018-06-03', '2', '1');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`, `Fecha_Pago`, `IdEmpleado`, `IdCliente`) VALUES ('350', '2018-06-03', '2', '4');

ALTER TABLE `gym`.`inventario` DROP COLUMN `NombreProducto` ;
ALTER TABLE `gym`.`inventario` DROP COLUMN `Fecha_Reeprovicionar` ;