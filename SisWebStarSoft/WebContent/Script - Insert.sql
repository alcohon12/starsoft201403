INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Universidad',1,'Tipo Centro Informacion');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Intituto',1,'Tipo Centro Informacion');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Masculino',2,'Genero');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Femenino',2,'Genero');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('DNI',3,'Tipo Documento');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('CE',3,'Tipo Documento');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('PASS',3,'Tipo Documento');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Estudiantes',4,'Tipo Usuario');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Docentes',4,'Tipo Usuario');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Evaluadores',4,'Tipo Usuario');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Bueno',5,'Tipo Calificacion');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Medio',5,'Tipo Calificacion');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Mejorar',5,'Tipo Calificacion');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Publicada',6,'Idea');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Aprobada',6,'Idea');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Rechazada',6,'Idea');
INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Registrado',6,'Idea');

INSERT INTO parametro (`descripcion_Parametro`, `id_Tabla`, `nombre_Tabla`) VALUES ('Administradores',4,'Tipo Usuario');

INSERT INTO centro_informacion VALUES (1,'Univeridad Peruana de Ciencias',1,'http://www.upc.edu.pe','jpg',1500,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (2,'Cibertec',2,'http://www.cibertec.edu.pe','jpg',2500,1,CURDATE(),null);
INSERT INTO centro_informacion VALUES (3,'Universidad Tecnológica del Perú',1,'http://www.utp.edu.pe','jpg',1500,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (4,'Instituto Superior Tecnológico IDAT',2,'http://www.idat.edu.pe','jpg',2000,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (5,'ISIL',2,'http://www.isil.pe','jpg',2350,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (6,'IPAE - Escuela de empresarios',2,'http://www.ipae.edu.pe','jpg',1350,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (7,'Instituto SISE',2,'http://www.sise.edu.pe','jpg',3500,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (8,'USIL',1,'http://www.usil.edu.pe','jpg',3500,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (9,'ESAN',1,'http://www.esan.edu.pe','jpg',1350,1,CURDATE(),NULL);
INSERT INTO centro_informacion VALUES (10,'TECSUP ',2,'http://www.tecsup.edu.pe','jpg',2540,1,CURDATE(),NULL);

INSERT INTO usuario VALUES (1,'Estudiante','Prueba','01',3,5,'123456','estudiante@prueba.com','','123',8,1,CURDATE(),NULL);
INSERT INTO usuario VALUES (2,'Docente','Prueba','01',3,5,'123456','docente@prueba.com','','123',9,1,CURDATE(),NULL);
INSERT INTO usuario VALUES (3,'Evaluador','Prueba','01',3,5,'123456','evaluador@prueba.com','','123',10,1,CURDATE(),NULL);
INSERT INTO usuario VALUES (4,'Administrador','Prueba','01',3,5,'123456','administrador@prueba.com','','123',18,1,CURDATE(),NULL);

INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 1', 'Esta es la primera idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'jpg', '15', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 2', 'Esta es la segunda idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '14', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 3', 'Esta es la tercera idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '16', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 4', 'Esta es la cuarta idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'jpg', '15', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 5', 'Esta es la quinta idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '14', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 6', 'Esta es la sexta idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '16', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 7', 'Esta es la setima idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'jpg', '15', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 8', 'Esta es la octava idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '14', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 9', 'Esta es la novena idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '16', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 10', 'Esta es la decima idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'jpg', '15', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 11', 'Esta es la onceava idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '14', '1', '1');
INSERT INTO `starsoft`.`idea` (`titulo_Idea`, `descripcion_Idea`, `palabrasClave1`, `palabrasClave2`, `palabrasClave3`, `palabrasClave4`, `extensionArchivo_Idea`, `id_Estado`, `id_Alumno`, `id_Asesor`) VALUES ('Idea de prueba 12', 'Esta es la doceava idea de prueba', 'palabra1', 'palabra2', 'palabra3', 'palabra4', 'png', '16', '1', '1');


INSERT INTO `starsoft`.`permiso` (`id_Permiso`, `id_Idea`, `id_Usuario`) VALUES (1, 1, 1);
INSERT INTO `starsoft`.`permiso` (`id_Permiso`, `id_Idea`, `id_Usuario`) VALUES (2, 2, 1);
INSERT INTO `starsoft`.`permiso` (`id_Permiso`, `id_Idea`, `id_Usuario`) VALUES (3, 3, 1);
INSERT INTO `starsoft`.`permiso` (`id_Permiso`, `id_Idea`, `id_Usuario`) VALUES (4, 4, 1);
INSERT INTO `starsoft`.`permiso` (`id_Permiso`, `id_Idea`, `id_Usuario`) VALUES (5, 5, 1);
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('1', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('2', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('3', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('4', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('5', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('6', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('7', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('8', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('9', '4', '0');
INSERT INTO `starsoft`.`permiso` (`id_Idea`, `id_Usuario`, `votacion_Permiso`) VALUES ('10', '4', '0');


