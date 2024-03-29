/*------------- melissa  -----------*/
CREATE  PROCEDURE SP_CentroFormacion_Pagos( Mes int)
select x.nombre,Tipo,x.monto_pago,x.cantidad,x.cantidad * x.monto_pago as "Pago" 
from (
		select c.nombre_Centro_Informacion as "Nombre",d.descripcion_Parametro as Tipo,c.monto_Pago,count(*) as "Cantidad"
		from idea a,usuario b, centro_informacion c,parametro d
		where a.id_Alumno=b.id_Usuario and c.id_Centro_Informacion=b.id_Centro_Informacion and d.id_Parametro=c.id_Tipo_Centro
		and MONTH(a.fecha_creacion)=Mes
		group by c.nombre_Centro_Informacion,c.monto_Pago ,d.descripcion_Parametro

) x;


DELIMITER //
create procedure sp_Listar_IdeasReporte
(

p_F1 DATETIME,
p_F2 DATETIME,
p_idEstado varchar(10),
p_Titulo varchar(100),
p_Descripcion varchar(100)
)
begin
IF(p_idEstado='0') THEN
	SET p_idEstado=NULL;
END IF;
 
select  a.id_Idea,a.titulo_Idea,a.descripcion_Idea,
a.palabrasClave1,a.palabrasClave2,a.palabrasClave3,a.palabrasClave4,
a.fecha_creacion,b.nombre_Usuario
from idea a, usuario b
where a.id_Alumno=b.id_Usuario 
and
a.fecha_creacion between p_F1 and p_F2
and a.id_Estado=IFNULL(p_idEstado,id_Estado) and 
a.titulo_Idea like  CONCAT  ('%',IFNULL(p_Titulo,titulo_Idea),'%') and
a.descripcion_Idea like  CONCAT  ('%',IFNULL(p_Descripcion,descripcion_Idea),'%');
END //
DELIMITER ;


/*------------- martel  -----------*/
create PROCEDURE SP_ListarCentroInformacion
(
	Nombre VARCHAR(200)
)
	SELECT
		a.id_Centro_Informacion,
        a.nombre_Centro_Informacion,
        a.id_Tipo_Centro,
        PAR.descripcion_Parametro,
        a.url_Centro_Informacion,
        a.monto_Pago
        
	FROM centro_informacion a    
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = a.id_Tipo_Centro
	WHERE a.nombre_Centro_Informacion LIKE CONCAT('%',Nombre,'%');
    

create PROCEDURE SP_ObtenerCentroInformacion
(
	pi_id_Centro_Informacion INT
)
	SELECT
		a.id_Centro_Informacion,
        a.nombre_Centro_Informacion,
        a.id_Tipo_Centro,
        PAR.descripcion_Parametro,
        a.url_Centro_Informacion,
        a.monto_Pago
        
	FROM centro_informacion a    
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = a.id_Tipo_Centro
	where id_Centro_Informacion=pi_id_Centro_Informacion ;
 
    	
CREATE PROCEDURE SP_InsertarCentroInformacion(
	pi_nombre_Centro_Informacion VARCHAR(500),
	pi_id_Tipo_Centro INT,
	pi_url_Centro_Informacion VARCHAR(500),
	pi_monto_Pago DECIMAL(10,0)
)
INSERT INTO centro_informacion 
		(nombre_Centro_Informacion, id_Tipo_Centro, url_Centro_Informacion, monto_Pago,servicio_Pago)
	VALUES
		(pi_nombre_Centro_Informacion, pi_id_Tipo_Centro, pi_url_Centro_Informacion, pi_monto_Pago,0);
        
    	
CREATE PROCEDURE SP_ActualizarCentroInformacion
(
	
	pi_nombre_Centro_Informacion VARCHAR(500),
	pi_id_Tipo_Centro INT,
	pi_url_Centro_Informacion VARCHAR(500),
	pi_monto_Pago DECIMAL(10,0),
    pi_id_Centro_Informacion INT
)
	UPDATE centro_informacion  SET 
		nombre_Centro_Informacion=pi_nombre_Centro_Informacion,id_Tipo_Centro=pi_id_Tipo_Centro, 
        url_Centro_Informacion=pi_url_Centro_Informacion, monto_Pago=pi_monto_Pago
	where id_Centro_Informacion=pi_id_Centro_Informacion ;
        

    	
CREATE PROCEDURE SP_EliminarCentroInformacion
(
	pi_id_Centro_Informacion INT

)
	DELETE FROM centro_informacion  
	where id_Centro_Informacion=pi_id_Centro_Informacion ;
    
/*----------- Victor ------------*/
CREATE PROCEDURE SP_ListarIdeaMiembro
(
	pi_id_Idea INT
)
	SELECT 
		USU.nombre_Usuario,
		USU.paterno_Usuario,
		USU.materno_Usuario,
		PAR.descripcion_Parametro AS nombreTipoUsuario
	FROM permiso PER
	INNER JOIN usuario USU
	ON PER.id_Usuario = USU.id_Usuario
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = USU.id_Tipo_Usuario
	WHERE PER.id_Idea = pi_id_Idea;
	
CREATE PROCEDURE SP_ValidarUsuario
(
	pi_correo_Usuario VARCHAR(100),
	pi_password_Usuario VARCHAR(1000)
)
	SELECT 
		id_Usuario,
		nombre_Usuario,
		paterno_Usuario,
		materno_Usuario,
		id_Tipo_Usuario
	FROM usuario 
	WHERE correo_Usuario = pi_correo_Usuario 
	AND password_Usuario = pi_password_Usuario;

CREATE PROCEDURE SP_ListarUsuario
(
	pi_Campo INT,
	pi_Filtro VARCHAR(50)
)
	SELECT 
		USU.id_Usuario,
		USU.nombre_Usuario,
		USU.paterno_Usuario,
		USU.materno_Usuario,
		TUSU.descripcion_Parametro AS nombre_Tipo_Usuario,
		USU.correo_Usuario
	FROM usuario USU
	INNER JOIN parametro TUSU
	ON USU.id_Tipo_Usuario = TUSU.id_Parametro
	WHERE USU.nombre_Usuario LIKE CASE WHEN pi_Campo = 1 THEN pi_Filtro ELSE '%%' END
	AND USU.paterno_Usuario LIKE CASE WHEN pi_Campo = 2 THEN pi_Filtro ELSE '%%' END 
	AND USU.materno_Usuario LIKE CASE WHEN pi_Campo = 3 THEN pi_Filtro ELSE '%%' END;
	
CREATE PROCEDURE SP_ObtenerUsuario
(
	pi_id_Usuario INT
)
	SELECT 
		USU.id_Usuario,
		USU.nombre_Usuario,
		USU.paterno_Usuario,
		USU.materno_Usuario,
		USU.id_Genero,
		USU.id_Tipo_Documento,
		USU.NroDocumento,
		USU.correo_Usuario,
		USU.celular_Usuario,
		USU.password_Usuario,
		USU.id_Tipo_Usuario,
		USU.id_Centro_Informacion
	FROM usuario USU
	WHERE USU.id_Usuario = pi_id_Usuario;
	
CREATE PROCEDURE SP_InsertarUsuario
(
	pi_nombre_Usuario VARCHAR(50),
	pi_paterno_Usuario VARCHAR(50),
	pi_materno_Usuario VARCHAR(50),
	pi_id_Genero INT,
	pi_id_Tipo_Documento INT,
	pi_NroDocumento VARCHAR(20),
	pi_correo_Usuario VARCHAR(100),
	pi_celular_Usuario VARCHAR(15),
	pi_password_Usuario VARCHAR(1000),
	pi_id_Tipo_Usuario INT,
	pi_id_Centro_Informacion INT
)
	INSERT INTO usuario 
		(nombre_Usuario, paterno_Usuario, materno_Usuario, id_Genero, id_Tipo_Documento, NroDocumento, correo_Usuario, celular_Usuario, password_Usuario, id_Tipo_Usuario, id_Centro_Informacion)
	VALUES 
		(pi_nombre_Usuario, pi_paterno_Usuario, pi_materno_Usuario, pi_id_Genero, pi_id_Tipo_Documento, pi_NroDocumento, pi_correo_Usuario, pi_celular_Usuario, pi_password_Usuario, pi_id_Tipo_Usuario, pi_id_Centro_Informacion);	
	
CREATE PROCEDURE SP_ActualizarUsuario
(
	pi_id_Usuario INT,
	pi_nombre_Usuario VARCHAR(50),
	pi_paterno_Usuario VARCHAR(50),
	pi_materno_Usuario VARCHAR(50),
	pi_id_Genero INT,
	pi_id_Tipo_Documento INT,
	pi_NroDocumento VARCHAR(20),
	pi_correo_Usuario VARCHAR(100),
	pi_celular_Usuario VARCHAR(15),
	pi_password_Usuario VARCHAR(1000),
	pi_id_Tipo_Usuario INT,
	pi_id_Centro_Informacion INT
)
	UPDATE usuario
	SET nombre_Usuario = pi_nombre_Usuario,
		paterno_Usuario = pi_paterno_Usuario,
		materno_Usuario = pi_materno_Usuario,
		id_Genero = pi_id_Genero,
		id_Tipo_Documento = pi_id_Tipo_Documento,
		NroDocumento = pi_NroDocumento,
		correo_Usuario = pi_correo_Usuario,
		celular_Usuario = pi_celular_Usuario,
		password_Usuario = pi_password_Usuario,
		id_Tipo_Usuario = pi_id_Tipo_Usuario,
		id_Centro_Informacion = pi_id_Centro_Informacion
	WHERE id_Usuario = pi_id_Usuario;
	
CREATE PROCEDURE SP_EliminarUsuario
(
	pi_id_Usuario INT
)
	DELETE FROM usuario
	WHERE id_Usuario = pi_id_Usuario;
	
CREATE PROCEDURE SP_ListarReunion
(
	pi_FechaDesde DATETIME,
	pi_FechaHasta DATETIME
)
	SELECT
		RE.id_Reunion,
		RE.id_Idea,
		IDE.titulo_Idea,
		RE.observacion_Reunion,
		RE.id_Calificacion,
		PAR.descripcion_Parametro AS nombre_Calificacion,
		RE.id_Asesor,
		RE.fecha_Reunion
	FROM reunion RE
	INNER JOIN idea IDE
	ON IDE.id_Idea = RE.id_Idea
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = RE.id_Calificacion
	WHERE RE.fecha_Reunion BETWEEN pi_FechaDesde AND pi_FechaHasta;
	
CREATE PROCEDURE SP_ListarParametro
(
	pi_id_Tabla INT
)
	SELECT
		PAR.id_Parametro,
		PAR.descripcion_Parametro
	FROM parametro PAR
	WHERE PAR.id_Tabla = pi_id_Tabla;

CREATE PROCEDURE SP_RegistroMensaje
(
mensaje VARCHAR(500),
id_estado_Mensaje INT,
fecha_Expiracion DATETIME
)
INSERT INTO mensaje
		(mensaje, id_estado_Mensaje, fecha_Expiracion, fecha_Creacion)
	VALUES
		(mensaje, id_estado_Mensaje, fecha_Expiracion, now());


CREATE PROCEDURE SP_RegistroParametro
(
	descripcion_Parametro VARCHAR(500),
	id_Tabla INT,
	nombre_Tabla VARCHAR(500),
	fecha_Creacion DATETIME,
	fecha_Modificacion DATETIME
)
INSERT INTO parametro
		(descripcion_Parametro, id_Tabla, nombre_Tabla, fecha_Creacion, fecha_Modificacion)
	VALUES
		(descripcion_Parametro, id_Tabla, nombre_Tabla, fecha_Creacion, now());

		
CREATE PROCEDURE SP_InsertarReunion
(
	pi_id_Idea INT,
	pi_observacion_Reunion VARCHAR(500),
	pi_id_Calificacion INT,
	pi_id_Asesor INT,
	pi_fecha_Reunion DATETIME
)
	INSERT INTO reunion 
		(id_Idea, observacion_Reunion, id_Calificacion, id_Asesor, fecha_Reunion)
	VALUES
		(pi_id_Idea, pi_observacion_Reunion, pi_id_Calificacion, pi_id_Asesor, pi_fecha_Reunion);
		
CREATE PROCEDURE SP_ActualizarReunion
(
	pi_id_Reunion INT,
	pi_id_Idea INT,
	pi_observacion_Reunion VARCHAR(500),
	pi_id_Calificacion INT,
	pi_id_Asesor INT,
	pi_fecha_Reunion DATETIME
)
	UPDATE reunion 
	SET id_Idea = pi_id_Idea,
		observacion_Reunion = pi_observacion_Reunion,
		id_Calificacion = pi_id_Calificacion,
		id_Asesor = pi_id_Asesor,
		fecha_Reunion = pi_fecha_Reunion,
		fecha_modificacion = NOW()
	WHERE id_Reunion = pi_id_Reunion;
	
CREATE PROCEDURE SP_ObtenerReunion
(
	pi_id_Reunion INT
)
	SELECT
		RE.id_Reunion,
		RE.id_Idea,
		IDE.titulo_Idea,
		RE.observacion_Reunion,
		RE.id_Calificacion,
		PAR.descripcion_Parametro AS nombre_Calificacion,
		RE.id_Asesor,
		RE.fecha_Reunion
	FROM reunion RE
	INNER JOIN idea IDE
	ON IDE.id_Idea = RE.id_Idea
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = RE.id_Calificacion
	WHERE RE.id_Reunion = pi_id_Reunion;
	
CREATE PROCEDURE SP_EliminarReunion
(
	pi_id_Reunion INT
)
	DELETE FROM reunion 
	WHERE id_Reunion = pi_id_Reunion;
	
CREATE PROCEDURE SP_ListarIdeaAsesor
(
	pi_id_Asesor INT
)
	SELECT 
		IDE.id_Idea,
        IDE.titulo_Idea
	FROM idea IDE
	WHERE IDE.id_Asesor = pi_id_Asesor;
	
/*------------FRANK ---------------------------*/
	
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ListarIdea`(
)
SELECT 
		IDE.id_Idea,
        IDE.titulo_Idea,
        IDE.descripcion_Idea,
		IDE.palabrasClave1,
        IDE.palabrasClave2,
        IDE.palabrasClave3,
        IDE.palabrasClave4,
        IDE.extensionArchivo_Idea,
        IDE.id_Estado,
        IDE.fecha_creacion,
        TIDE.descripcion_Parametro
	FROM idea IDE
	INNER JOIN parametro TIDE
	ON IDE.id_Estado = TIDE.id_Parametro;

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ActualizarVotacionPermiso`(
	pi_id_Permiso INT,
    pi_Votacion INT
)
UPDATE permiso SET votacion_Permiso = pi_Votacion
	WHERE id_Permiso = pi_id_Permiso;
    

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ListarDiscusion`(
	pi_id_Idea INT
)
SELECT DIS.id_Discucion, DIS.id_Usuario, DIS.comentario, DIS.id_DiscucionPadre, DIS.fecha_creacion, USU.nombre_Usuario
FROM DISCUCION DIS
INNER JOIN USUARIO USU ON DIS.id_Usuario = USU.id_Usuario
where DIS.id_Idea = pi_id_Idea
order by DIS.fecha_creacion asc;


CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ListarPermiso`(
	pi_id_Usuario INT
)
SELECT 
		PER.id_Permiso,
		PER.id_Idea,
		PER.votacion_Permiso,
        IDE.titulo_Idea,
        IDE.descripcion_Idea
	FROM permiso PER
	INNER JOIN idea IDE
	ON IDE.id_Idea = PER.id_Idea
	WHERE PER.id_Usuario = pi_id_Usuario;
	
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertarDiscusion`(
	pi_id_Idea INT,
    pi_id_Usuario INT,
    pi_Comentario VARCHAR(500),
    pi_id_DiscucionPadre INT
)
if (pi_id_DiscucionPadre = 0) then
	insert into discucion (id_Idea,id_Usuario,comentario) 
	values (pi_id_Idea,pi_id_Usuario,pi_Comentario);
else
	insert into discucion (id_Idea,id_Usuario,comentario,id_DiscucionPadre) 
	values (pi_id_Idea,pi_id_Usuario,pi_Comentario,pi_id_DiscucionPadre);
end if