/*
-- Query: select * From centro_informacion
LIMIT 0, 1000

-- Date: 2014-11-19 15:50
*/
--TABLA PARAMETROS*************************************************
INSERT INTO `parametro` (`id_Parametro`,`descripcion_Parametro`,`id_Tabla`,`nombre_Tabla`,`fecha_Creacion`,`fecha_Modificacion`) VALUES (1,'Universidad',1,'Tipo Centro Informacion','19/11/2014',NULL);
INSERT INTO `parametro` (`id_Parametro`,`descripcion_Parametro`,`id_Tabla`,`nombre_Tabla`,`fecha_Creacion`,`fecha_Modificacion`) VALUES (2,'Intituto',1,'Tipo Centro Informacion','19/11/2014',NULL);
--*************************************************************
--TABLA CENTRO INFORMACION*****************************************
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (1,'Univeridad Peruana de Ciencias',1,'http://www.upc.edu.pe','jpg',1500,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (2,'Cibertec',2,'http://www.cibertec.edu.pe','jpg',2500,1,'19/11/2014',null);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (3,'Universidad Tecnológica del Perú',1,'http://www.utp.edu.pe','jpg',1500,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (4,'Instituto Superior Tecnológico IDAT',2,'http://www.idat.edu.pe','jpg',2000,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (5,'ISIL',2,'http://www.isil.pe','jpg',2350,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (6,'IPAE - Escuela de empresarios',2,'http://www.ipae.edu.pe','jpg',1350,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (7,'Instituto SISE',2,'http://www.sise.edu.pe','jpg',3500,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (8,'USIL',1,'http://www.usil.edu.pe','jpg',3500,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (9,'ESAN',1,'http://www.esan.edu.pe','jpg',1350,1,'19/11/2014',NULL);
INSERT INTO `centro_informacion` (`id_Centro_Informacion`,`nombre_Centro_Informacion`,`id_Tipo_Centro`,`url_Centro_Informacion`,`extensionLogo_Centro_Informacion`,`monto_Pago`,`servicio_Pago`,`fecha_creacion`,`fecha_modificacion`) VALUES (10,'TECSUP ',2,'http://www.tecsup.edu.pe','jpg',2540,1,'19/11/2014',NULL);
--*****************************************************************

