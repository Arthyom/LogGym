DROP DATABASE IF EXISTS GYM;
CREATE DATABASE IF NOT EXISTS GYM;

use GYM;


CREATE  TABLE `gym`.`Clientes` (
  
	`idCliente` INT NOT NULL AUTO_INCREMENT ,  
	`Nombre_cliente` VARCHAR(45) NOT NULL ,
	`Tipo_pago` VARCHAR(45) NOT NULL ,
  
	`Monto_A_Pagar` INT NOT NULL ,
  
	`Baja` INT NOT NULL  ,
  
	`Fecha_Ingreso` DATE NOT NULL ,

	PRIMARY KEY (`idCliente`) 
)
COMMENT = 'Tabla de clientes';

CREATE  TABLE `gym`.`Productos` (
  
	`idProducto` INT NOT NULL AUTO_INCREMENT ,
  
	`Nombre_producto` VARCHAR(45) NOT NULL ,
  	
	`PresioUnitario` VARCHAR(45) NOT NULL ,
  
	`Baja` INT NOT NULL  ,

	PRIMARY KEY (`idProducto`) 
	)
COMMENT = 'Productos';



CREATE  TABLE `gym`.`Inventario` (
	`idInventario` INT NOT NULL AUTO_INCREMENT ,
  
  
	`idProducto` INT NOT NULL ,
  
	`Cantidad_En_Almacen` INT NOT NULL ,
  
	PRIMARY KEY (`idInventario`),
	CONSTRAINT FK_ProductoInventario FOREIGN KEY (`idProducto`) REFERENCES `Productos`(`idProducto`) 
	)
COMMENT = 'Inventario del gymnacio';

CREATE  TABLE `gym`.`Usuarios` (
  
	`idEmpleado` INT NOT NULL AUTO_INCREMENT ,
  
	`NombreEmpleado` VARCHAR(45) NOT NULL ,
  
	`Horario_trabajo` VARCHAR(45) NOT NULL ,
  
	`Labor` VARCHAR(45) NOT NULL ,
  
	`Password` VARCHAR(45) NOT NULL,
	`Baja` INT NOT NULL  ,

	PRIMARY KEY (`idEmpleado`) 
	)
COMMENT = 'Usuarios que utiizan el programa';

CREATE  TABLE `gym`.`Cobro_Mensualidad` (
  
	`IdPago` INT NOT NULL AUTO_INCREMENT ,
  
	`MontoAPagar` INT NOT NULL ,
  
	`Fecha_Pago` DATE NOT NULL ,
  
	`IdEmpleado` INT NULL ,
  
	`IdCliente` INT NULL ,
  
	PRIMARY KEY (`IdPago`) ,
  
	CONSTRAINT FK_EmpleadoCobroMensualidad FOREIGN KEY (`IdEmpleado`) REFERENCES `Usuarios`(`idEmpleado`),
	CONSTRAINT FK_ClienteCobroMensualidad FOREIGN KEY (`IdCliente`) REFERENCES `Clientes`(`IdCliente`)
	)
COMMENT = 'Cobro de la mensualidad al cliente';




CREATE  TABLE `gym`.`Ventas` 
(
  
	`idVenta` INT NOT NULL AUTO_INCREMENT ,
  
	`Idproducto` INT NOT NULL ,
  
	`idEmpleado` INT NOT NULL ,

	`Cantidad` VARCHAR(45) NOT NULL ,
   
	PRIMARY KEY (`idVenta`) ,
  
	CONSTRAINT FK_ProductoVentas FOREIGN KEY (`Idproducto`) REFERENCES `Productos`(`idProducto`),
	CONSTRAINT FK_EmpleadoVentas FOREIGN KEY (`idEmpleado`) REFERENCES `Usuarios`(`idEmpleado`)
)
COMMENT = 'Registro de ventas';


INSERT INTO `GYM`.`clientes` (`Nombre_cliente`,`Tipo_pago`,`Monto_A_Pagar`,`Baja`,`Fecha_Ingreso`
) VALUES ('Luis Guzman', 'Normal', '350','0', '2018-06-02');

INSERT INTO `GYM`.`clientes` (`Nombre_cliente`,`Tipo_pago`,`Monto_A_Pagar`,`Baja`,`Fecha_Ingreso`
) VALUES ('Jose Lalo Hernandez', 'Estudiante', '300','0', '2018-06-03');

INSERT INTO `GYM`.`clientes` (`Nombre_cliente`,`Tipo_pago`,`Monto_A_Pagar`,`Baja`,`Fecha_Ingreso`
) VALUES ('Ana Karen Herrera', 'Estudiante', '300','0', '2018-06-07');

INSERT INTO `GYM`.`clientes` (`Nombre_cliente`,`Tipo_pago`,`Monto_A_Pagar`,`Baja`,`Fecha_Ingreso`
) VALUES ('Loaisa Larga', 'Normal', '350','0', '2018-02-02');


INSERT INTO `GYM`.`Productos` (`Nombre_producto`,`PresioUnitario`,`Baja`) VALUES ('Way Protein', '1200','0');

INSERT INTO `GYM`.`Productos` (`Nombre_producto`,`PresioUnitario`,`Baja`) VALUES ('Gaytorade 600','10','0');
INSERT INTO `GYM`.`Productos` (`Nombre_producto`,`PresioUnitario`,`Baja`) VALUES ('Agua 600 ml', '10','0');

INSERT INTO `GYM`.`Productos` (`Nombre_producto`,`PresioUnitario`,`Baja`) VALUES ('Medida de glutamina', '20', '0');
	

INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`,
 `Horario_trabajo`,`Labor`,`Password`,`Baja`
) VALUES ('Bernrdito', '8 a 10 Lun-Vie', 'Barrendero','123','0');

INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`,
 `Horario_trabajo`,`Labor`,`Password`,`Baja`
) VALUES ('Juan Carlos', '8 a 10 Lun-Vie', 'Instructor','123','0');

INSERT INTO `GYM`.`Usuarios` (`NombreEmpleado`,
 `Horario_trabajo`,`Labor`,`Password`,`Baja`
) VALUES ('Alfredito', '8 a 10 Lun-Vie', 'Limpia vidrios','123','0');


INSERT INTO `GYM`.`Ventas` (`Idproducto`, `idEmpleado`,`Cantidad`) VALUES ('1',  '1', '1');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `idEmpleado`,`Cantidad`) VALUES ('2',  '1', '1');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `idEmpleado`,`Cantidad`) VALUES ('3',  '2', '2');

INSERT INTO `GYM`.`Ventas` (`Idproducto`, `idEmpleado`,`Cantidad`) VALUES ('4',  '1', '2');


INSERT INTO `GYM`.`Inventario` (`idProducto`, `Cantidad_En_Almacen`) VALUES ('1','3');

INSERT INTO `GYM`.`Inventario` (`idProducto`,`Cantidad_En_Almacen`) VALUES ('3','30');

INSERT INTO `GYM`.`Inventario` (`idProducto`,`Cantidad_En_Almacen`) VALUES ('2','20');

INSERT INTO `GYM`.`Inventario` (`idProducto`,`Cantidad_En_Almacen`) VALUES ('4','59');


INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`,`Fecha_Pago`,`IdEmpleado`,`IdCliente`) VALUES ('300', '2018-06-02', '1', '2');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`,`Fecha_Pago`,`IdEmpleado`,`IdCliente`) VALUES ('300', '2018-06-02', '1', '3');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`,`Fecha_Pago`,`IdEmpleado`,`IdCliente`) VALUES ('350', '2018-06-03', '2', '1');

INSERT INTO `GYM`.`cobro_mensualidad` (`MontoAPagar`,`Fecha_Pago`,`IdEmpleado`,`IdCliente`) VALUES ('350', '2018-06-03', '2', '4');


