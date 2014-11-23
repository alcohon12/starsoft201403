CREATE PROCEDURE SP_ValidarUsuario
(
	pi_correo_Usuario VARCHAR(100),
	pi_password_Usuario VARCHAR(1000)
)
	SELECT 
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