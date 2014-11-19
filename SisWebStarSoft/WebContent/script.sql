-- -----------------------------------------------------
-- Schema Starsoft
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Starsoft` ;

-- -----------------------------------------------------
-- Schema Starsoft
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Starsoft` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `Starsoft` ;

-- -----------------------------------------------------
-- Table `Starsoft`.`Parametro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Parametro` (
  `id_Parametro` INT NOT NULL,
  `descripcion_Parametro` VARCHAR(100) NOT NULL,
  `id_Tabla` INT NOT NULL,
  `nombre_Tabla` VARCHAR(100) NULL,
  `fecha_Creacion` DATETIME NOT NULL,
  `fecha_Modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Parametro`)
  )
ENGINE = InnoDB;
 

-- -----------------------------------------------------
-- Table `Starsoft`.`Centro_Informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Centro_Informacion` (
  `id_Centro_Informacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_Centro_Informacion` VARCHAR(100) NOT NULL,
  `id_Tipo_Centro` INT NOT NULL,
  `url_Centro_Informacion` VARCHAR(150) NOT NULL,
  `extensionLogo_Centro_Informacion` VARCHAR(20) NULL,
  `monto_Pago` DECIMAL NOT NULL DEFAULT 0,
  `servicio_Pago` BIT NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Centro_Informacion`),
  UNIQUE INDEX `url_Centro_Informacion_UNIQUE` (`url_Centro_Informacion` ASC),
  INDEX `fk_Centro_Informacion_Parametro1_idx` (`id_Tipo_Centro` ASC),
  CONSTRAINT `fk_Centro_Informacion_Parametro1`
    FOREIGN KEY (`id_Tipo_Centro`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Usuario` (
  `id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_Usuario` VARCHAR(50) NULL,
  `paterno_Usuario` VARCHAR(50) NULL,
  `materno_Usuario` VARCHAR(50) NULL,
  `id_Genero` INT NOT NULL,
  `id_Tipo_Documento` INT NOT NULL,
  `NroDocumento` VARCHAR(20) NOT NULL,
  `correo_Usuario` VARCHAR(100) NOT NULL,
  `celular_Usuario` VARCHAR(15) NOT NULL,
  `password_Usuario` VARCHAR(1000) NOT NULL,
  `id_Tipo_Usuario` INT NOT NULL,
  `id_Centro_Informacion` INT NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Usuario`),
  INDEX `fk_Usuario_Parametro1` (`id_Tipo_Usuario` ASC),
  INDEX `fk_Usuario_Parametro2` (`id_Tipo_Documento` ASC),
  INDEX `fk_Usuario_Parametro3_idx` (`id_Genero` ASC),
  UNIQUE INDEX `correo_Usuario_UNIQUE` (`correo_Usuario` ASC),
  INDEX `fk_Usuario_Centro_Informacion1_idx` (`id_Centro_Informacion` ASC),
  CONSTRAINT `fk_Usuario_Parametro1`
    FOREIGN KEY (`id_Tipo_Usuario`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Parametro2`
    FOREIGN KEY (`id_Tipo_Documento`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Parametro3`
    FOREIGN KEY (`id_Genero`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Centro_Informacion1`
    FOREIGN KEY (`id_Centro_Informacion`)
    REFERENCES `Starsoft`.`Centro_Informacion` (`id_Centro_Informacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Idea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Idea` (
  `id_Idea` INT NOT NULL AUTO_INCREMENT,
  `titulo_Idea` VARCHAR(200) NOT NULL,
  `descripcion_Idea` VARCHAR(500) NOT NULL,
  `palabrasClave1` VARCHAR(50) NOT NULL,
  `palabrasClave2` VARCHAR(50) NOT NULL,
  `palabrasClave3` VARCHAR(50) NOT NULL,
  `palabrasClave4` VARCHAR(50) NOT NULL,
  `extensionArchivo_Idea` VARCHAR(20) NULL,
  `id_Estado` INT NOT NULL DEFAULT 1,
  `id_Alumno` INT NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NULL,
  `fecha_aprobacion` DATETIME NULL,
  `id_Asesor` INT NOT NULL,
  PRIMARY KEY (`id_Idea`),
  UNIQUE INDEX `titulo_Idea_UNIQUE` (`titulo_Idea` ASC),
  INDEX `fk_Idea_Usuario1` (`id_Alumno` ASC),
  INDEX `fk_Idea_Usuario2` (`id_Asesor` ASC),
  INDEX `fk_Idea_Parametro1` (`id_Estado` ASC),
  CONSTRAINT `fk_Idea_Usuario1`
    FOREIGN KEY (`id_Alumno`)
    REFERENCES `Starsoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Idea_Usuario2`
    FOREIGN KEY (`id_Asesor`)
    REFERENCES `Starsoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Idea_Parametro1`
    FOREIGN KEY (`id_Estado`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Permiso` (
  `id_Permiso` INT NOT NULL AUTO_INCREMENT,
  `id_Idea` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  `votacion_Permiso` INT NOT NULL DEFAULT 0 COMMENT 'Solo 1,2,3,4 ó 5 estrellas',
  `fecha_creacion` DATETIME NOT NULL,
  PRIMARY KEY (`id_Permiso`),
  INDEX `fk_Publicacion_Idea` (`id_Idea` ASC),
  INDEX `fk_Publicacion_Usuario1` (`id_Usuario` ASC),
  CONSTRAINT `fk_Publicacion_Idea`
    FOREIGN KEY (`id_Idea`)
    REFERENCES `Starsoft`.`Idea` (`id_Idea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicacion_Usuario1`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `Starsoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Discucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Discucion` (
  `id_Discucion` INT NOT NULL AUTO_INCREMENT,
  `id_Idea` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  `comentario` VARCHAR(500) NOT NULL,
  `id_DiscucionPadre` INT NOT NULL DEFAULT 0,
  `fecha_creacion` DATETIME NOT NULL,
  PRIMARY KEY (`id_Discucion`),
  INDEX `fk_Discucion_Idea1_idx` (`id_Idea` ASC),
  INDEX `fk_Discucion_Discucion1_idx` (`id_DiscucionPadre` ASC),
  CONSTRAINT `fk_Discucion_Idea1`
    FOREIGN KEY (`id_Idea`)
    REFERENCES `Starsoft`.`Idea` (`id_Idea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Discucion_Discucion1`
    FOREIGN KEY (`id_DiscucionPadre`)
    REFERENCES `Starsoft`.`Discucion` (`id_Discucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Reunion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Reunion` (
  `id_Reunion` INT NOT NULL AUTO_INCREMENT,
  `observacion_Reunion` VARCHAR(500) NOT NULL,
  `id_Calificacion` INT NOT NULL,
  `id_Asesor` INT NOT NULL,
  `fecha_Reunion` DATETIME NOT NULL,
  `fecha_creacion` DATETIME NOT NULL ,
  `fecha_modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Reunion`),
  INDEX `fk_Reunion_Parametro1` (`id_Calificacion` ASC),
  INDEX `fk_Reunion_Usuario1` (`id_Asesor` ASC),
  CONSTRAINT `fk_Reunion_Parametro1`
    FOREIGN KEY (`id_Calificacion`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reunion_Usuario1`
    FOREIGN KEY (`id_Asesor`)
    REFERENCES `Starsoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starsoft`.`Mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starsoft`.`Mensaje` (
  `idMensaje` INT NOT NULL,
  `mensaje` TEXT NOT NULL,
  `id_Estado_Mensaje` INT NOT NULL,
  `fecha_Expiracion` DATETIME NULL,
  `fecha_Creacion` DATETIME NULL,
  `Usuario_id_Usuario` INT NOT NULL,
  PRIMARY KEY (`idMensaje`),
  INDEX `fk_Mensaje_Usuario1_idx` (`Usuario_id_Usuario` ASC),
  INDEX `fk_Mensaje_Parametro1_idx` (`id_Estado_Mensaje` ASC),
  CONSTRAINT `fk_Mensaje_Usuario1`
    FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `Starsoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Parametro1`
    FOREIGN KEY (`id_Estado_Mensaje`)
    REFERENCES `Starsoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;