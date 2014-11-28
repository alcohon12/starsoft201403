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