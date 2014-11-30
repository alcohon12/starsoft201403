------------- martel  -----------
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
 
    	
CREATE PROCEDURE SP_InsertarCentroInformacion
(
	pi_nombre_Centro_Informacion VARCHAR(500),
	pi_id_Tipo_Centro INT,
	pi_url_Centro_Informacion VARCHAR(500),
	pi_monto_Pago DECIMAL(10,0)
)
	INSERT INTO centro_informacion 
		(nombre_Centro_Informacion, id_Tipo_Centro, url_Centro_Informacion, monto_Pago)
	VALUES
		(pi_nombre_Centro_Informacion, pi_id_Tipo_Centro, pi_url_Centro_Informacion, pi_monto_Pago);
        
    	
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
    

    
    


----------- martel ------------
CREATE PROCEDURE SP_ValidarUsuario
(
	pi_correo_Usuario VARCHAR(100),
	pi_password_Usuario VARCHAR(1000)
)
	SELECT 
		id_Usuario,
		nombre_Usuario,
		paterno_Usuario,
		materno_Usuario 
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
	
CREATE PROCEDURE SP_ListarReunion
(
	pi_FechaDesde DATETIME,
	pi_FechaHasta DATETIME
)
	SELECT
		RE.id_Reunion,
		RE.observacion_Reunion,
		RE.id_Calificacion,
		PAR.descripcion_Parametro AS nombre_Calificacion,
		RE.id_Asesor,
		RE.fecha_Reunion
	FROM reunion RE
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
	
CREATE PROCEDURE SP_InsertarReunion
(
	pi_observacion_Reunion VARCHAR(500),
	pi_id_Calificacion INT,
	pi_id_Asesor INT,
	pi_fecha_Reunion DATETIME
)
	INSERT INTO reunion 
		(observacion_Reunion, id_Calificacion, id_Asesor, fecha_Reunion)
	VALUES
		(pi_observacion_Reunion, pi_id_Calificacion, pi_id_Asesor, pi_fecha_Reunion);
		
CREATE PROCEDURE SP_ActualizarReunion
(
	pi_id_Reunion INT,
	pi_observacion_Reunion VARCHAR(500),
	pi_id_Calificacion INT,
	pi_id_Asesor INT,
	pi_fecha_Reunion DATETIME
)
	UPDATE reunion 
	SET observacion_Reunion = pi_observacion_Reunion,
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
		RE.observacion_Reunion,
		RE.id_Calificacion,
		PAR.descripcion_Parametro AS nombre_Calificacion,
		RE.id_Asesor,
		RE.fecha_Reunion
	FROM reunion RE
	INNER JOIN parametro PAR
	ON PAR.id_Parametro = RE.id_Calificacion
	WHERE RE.id_Reunion = pi_id_Reunion;
	
CREATE PROCEDURE SP_EliminarReunion
(
	pi_id_Reunion INT
)
	DELETE FROM reunion 
	WHERE id_Reunion = pi_id_Reunion;
	
CREATE PROCEDURE SP_ListarIdea
(
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
	ON IDE.id_Estado = TIDE.id_Parametro
	
CREATE PROCEDURE SP_ListarPermiso
(
	pi_id_Usuario INT
)
	SELECT 
		PER.id_Permiso,
		PER.id_Idea,
		PER.votacion_Permiso
	FROM permiso PER
	INNER JOIN idea IDE
	ON IDE.id_Idea = PER.id_Idea
	WHERE PER.id_Usuario = pi_id_Usuario
