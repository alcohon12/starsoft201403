/*
-- Query: select * From centro_informacion
LIMIT 0, 1000

-- Date: 2014-11-19 15:50
*/
INSERT INTO parametro VALUES (1,'Universidad',1,'Tipo Centro Informacion',CURDATE(),NULL);
INSERT INTO parametro VALUES (2,'Intituto',1,'Tipo Centro Informacion',CURDATE(),NULL);

INSERT INTO parametro VALUES (3,'Masculino',2,'Genero',CURDATE(),NULL);
INSERT INTO parametro VALUES (4,'Femenino',2,'Genero',CURDATE(),NULL);

INSERT INTO parametro VALUES (5,'DNI',3,'Tipo Documento',CURDATE(),NULL);
INSERT INTO parametro VALUES (6,'CE',3,'Tipo Documento',CURDATE(),NULL);
INSERT INTO parametro VALUES (7,'PASS',3,'Tipo Documento',CURDATE(),NULL);

INSERT INTO parametro VALUES (8,'Estudiantes',3,'Tipo Usuario',CURDATE(),NULL);
INSERT INTO parametro VALUES (9,'Docentes',3,'Tipo Usuario',CURDATE(),NULL);
INSERT INTO parametro VALUES (10,'Evaluadores',3,'Tipo Usuario',CURDATE(),NULL);

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