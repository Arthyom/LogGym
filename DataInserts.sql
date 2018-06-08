INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('Agua', '100', '2017-01-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('Jugo', '1000', '2018-12-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('monster', '150', '2018-12-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('yakul', '50', '2018-10-12');

INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('agua', '10', '2');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('jugo', '10.5', '3');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('monster', '52.9', '4');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('yakul', '15.25', '5');

INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('juan carlos', '10:00', 'Administrador');
INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('Bernardo', '12:00', 'programador');
INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('Alfredo', '15:00', 'programador');

INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('123', 'usr1', '1');
INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('456', 'usr2', '2');
INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('789', 'ur3', '3');