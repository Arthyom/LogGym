INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('Agua', '100', '2017-01-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('Jugo', '1000', '2018-12-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('monster', '150', '2018-12-10');
INSERT INTO `mydb`.`inventario` (`Nombre_producto`, `Cantidad_almacen`, `Fecha_reeprovicionar`) VALUES ('yakul', '50', '2018-10-12');

INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('agua', '10', '2');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('jugo', '10.5', '3');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('monster', '52.9', '4');
INSERT INTO `mydb`.`productos` (`Nombre_producto`, `Precio_producto`, `Inventario_IdProducto`) VALUES ('yakul', '15.25', '5');

INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('juan carlos', '10:00', 'garrote');
INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('bernis', '12:00', 'programador');
INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('erick', '2:00', 'mirarCulos');
INSERT INTO `mydb`.`usuarios` (`Nombre_empleado`, `Horario_trabajo`, `Ocupacion`) VALUES ('cachis', '15:00', 'fotografo');

INSERT INTO `mydb`.`venta` (`IdProducto`, `Nombre_producto`, `Cantidad`, `Fecha`, `Empleados_IdEmpleado`) VALUES ('1', 'agua', '1', '2017-10-10', '2');
INSERT INTO `mydb`.`venta` (`IdProducto`, `Nombre_producto`, `Cantidad`, `Fecha`, `Empleados_IdEmpleado`) VALUES ('2', 'jugo', '1', '2017-10-10', '2');
INSERT INTO `mydb`.`venta` (`IdProducto`, `Nombre_producto`, `Cantidad`, `Fecha`, `Empleados_IdEmpleado`) VALUES ('3', 'monster', '1', '2017-10-10', '3');
INSERT INTO `mydb`.`venta` (`IdProducto`, `Nombre_producto`, `Cantidad`, `Fecha`, `Empleados_IdEmpleado`) VALUES ('4', 'yakul', '1', '2017-01-10', '4');

INSERT INTO `mydb`.`clientes` (`Nombre_cliente`, `Tipo_pago`, `MontoAcobrar`, `Fecha_ingreso`, `Venta_has_Productos_Venta_IdProducto`, `Venta_has_Productos_Productos_IdProducto`) VALUES ('pedro', 'efectivo', '300', '2017-05-05', '2', '2');
INSERT INTO `mydb`.`clientes` (`Nombre_cliente`, `Tipo_pago`, `MontoAcobrar`, `Fecha_ingreso`, `Venta_has_Productos_Venta_IdProducto`, `Venta_has_Productos_Productos_IdProducto`) VALUES ('daniel', 'efectivo', '300', '2017-05-05', '3', '3');
INSERT INTO `mydb`.`clientes` (`Nombre_cliente`, `Tipo_pago`, `MontoAcobrar`, `Fecha_ingreso`, `Venta_has_Productos_Venta_IdProducto`, `Venta_has_Productos_Productos_IdProducto`) VALUES ('maria', 'efectivo', '300', '2017-06-05', '4', '1');

INSERT INTO `mydb`.`cobro_mensualidad` (`Nombre_cliente`, `Monto_pago`, `Fecha_pago`, `Empleados_IdEmpleado`, `Clientes_idCliente`) VALUES ('pedro', '300', '2017-05-05', '1', '1');
INSERT INTO `mydb`.`cobro_mensualidad` (`Nombre_cliente`, `Monto_pago`, `Fecha_pago`, `Empleados_IdEmpleado`, `Clientes_idCliente`) VALUES ('daniel', '300', '2017-05-06', '2', '2');
INSERT INTO `mydb`.`cobro_mensualidad` (`Nombre_cliente`, `Monto_pago`, `Fecha_pago`, `Empleados_IdEmpleado`, `Clientes_idCliente`) VALUES ('maria', '300', '2017-05-07', '3', '3');

INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('123', 'usr1', '1');
INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('456', 'usr2', '2');
INSERT INTO `mydb`.`login` (`Contrasena`, `Nombre_usuario`, `Usuarios_IdEmpleado`) VALUES ('789', 'ur3', '3');