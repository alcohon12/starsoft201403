INSERT INTO parametro VALUES (1,'Universidad',1,'Tipo Centro Informacion',CURDATE(),NULL);
INSERT INTO parametro VALUES (2,'Intituto',1,'Tipo Centro Informacion',CURDATE(),NULL);

INSERT INTO parametro VALUES (3,'Masculino',2,'Genero',CURDATE(),NULL);
INSERT INTO parametro VALUES (4,'Femenino',2,'Genero',CURDATE(),NULL);

INSERT INTO parametro VALUES (5,'DNI',3,'Tipo Documento',CURDATE(),NULL);
INSERT INTO parametro VALUES (6,'CE',3,'Tipo Documento',CURDATE(),NULL);
INSERT INTO parametro VALUES (7,'PASS',3,'Tipo Documento',CURDATE(),NULL);

INSERT INTO parametro VALUES (8,'Estudiantes',4,'Tipo Usuario',CURDATE(),NULL);
INSERT INTO parametro VALUES (9,'Docentes',4,'Tipo Usuario',CURDATE(),NULL);
INSERT INTO parametro VALUES (10,'Evaluadores',4,'Tipo Usuario',CURDATE(),NULL);

INSERT INTO parametro VALUES (11,'Bueno',5,'Tipo Calificacion',CURDATE(),NULL);
INSERT INTO parametro VALUES (12,'Medio',5,'Tipo Calificacion',CURDATE(),NULL);
INSERT INTO parametro VALUES (13,'Mejorar',5,'Tipo Calificacion',CURDATE(),NULL);

INSERT INTO parametro VALUES (14,'Publicada',6,'Idea',CURDATE(),NULL);
INSERT INTO parametro VALUES (15,'Aprobada',6,'Idea',CURDATE(),NULL);
INSERT INTO parametro VALUES (16,'Rechazada',6,'Idea',CURDATE(),NULL);
INSERT INTO parametro VALUES (17,'Registrado',6,'Idea',CURDATE(),NULL);

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


