-- MySQL Script generated by MySQL Workbench
-- 11/20/14 21:59:46
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema StarSoft
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StarSoft` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `StarSoft` ;

-- -----------------------------------------------------
-- Table `StarSoft`.`Parametro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Parametro` (
  `id_Parametro` INT NOT NULL,
  `descripcion_Parametro` VARCHAR(100) NOT NULL,
  `id_Tabla` INT NOT NULL,
  `nombre_Tabla` VARCHAR(100) NOT NULL,
  `fecha_Creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_Modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Parametro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Centro_Informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Centro_Informacion` (
  `id_Centro_Informacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_Centro_Informacion` VARCHAR(100) NOT NULL,
  `id_Tipo_Centro` INT NOT NULL,
  `url_Centro_Informacion` VARCHAR(150) NOT NULL,
  `extensionLogo_Centro_Informacion` VARCHAR(20) NULL,
  `monto_Pago` DECIMAL NOT NULL DEFAULT 0,
  `servicio_Pago` BIT NOT NULL,
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Centro_Informacion`),
  UNIQUE INDEX `url_Centro_Informacion_UNIQUE` (`url_Centro_Informacion` ASC),
  INDEX `fk_Centro_Informacion_Parametro1_idx` (`id_Tipo_Centro` ASC),
  CONSTRAINT `fk_Centro_Informacion_Parametro1`
    FOREIGN KEY (`id_Tipo_Centro`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Usuario` (
  `id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_Usuario` VARCHAR(50) NOT NULL,
  `paterno_Usuario` VARCHAR(50) NOT NULL,
  `materno_Usuario` VARCHAR(50) NOT NULL,
  `id_Genero` INT NOT NULL,
  `id_Tipo_Documento` INT NOT NULL,
  `NroDocumento` VARCHAR(20) NOT NULL,
  `correo_Usuario` VARCHAR(100) NOT NULL,
  `celular_Usuario` VARCHAR(15) NULL,
  `password_Usuario` VARCHAR(1000) NOT NULL,
  `id_Tipo_Usuario` INT NOT NULL,
  `id_Centro_Informacion` INT NOT NULL,
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Usuario`),
  INDEX `fk_Usuario_Parametro1` (`id_Tipo_Usuario` ASC),
  INDEX `fk_Usuario_Parametro2` (`id_Tipo_Documento` ASC),
  INDEX `fk_Usuario_Parametro3_idx` (`id_Genero` ASC),
  UNIQUE INDEX `correo_Usuario_UNIQUE` (`correo_Usuario` ASC),
  INDEX `fk_Usuario_Centro_Informacion1_idx` (`id_Centro_Informacion` ASC),
  CONSTRAINT `fk_Usuario_Parametro1`
    FOREIGN KEY (`id_Tipo_Usuario`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Parametro2`
    FOREIGN KEY (`id_Tipo_Documento`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Parametro3`
    FOREIGN KEY (`id_Genero`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Centro_Informacion1`
    FOREIGN KEY (`id_Centro_Informacion`)
    REFERENCES `StarSoft`.`Centro_Informacion` (`id_Centro_Informacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Idea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Idea` (
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
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
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
    REFERENCES `StarSoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Idea_Usuario2`
    FOREIGN KEY (`id_Asesor`)
    REFERENCES `StarSoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Idea_Parametro1`
    FOREIGN KEY (`id_Estado`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Permiso` (
  `id_Permiso` INT NOT NULL AUTO_INCREMENT,
  `id_Idea` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  `votacion_Permiso` INT NOT NULL DEFAULT 0 COMMENT 'Solo 1,2,3,4 � 5 estrellas',
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_Permiso`),
  INDEX `fk_Publicacion_Idea` (`id_Idea` ASC),
  INDEX `fk_Publicacion_Usuario1` (`id_Usuario` ASC),
  CONSTRAINT `fk_Publicacion_Idea`
    FOREIGN KEY (`id_Idea`)
    REFERENCES `StarSoft`.`Idea` (`id_Idea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicacion_Usuario1`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `StarSoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Discucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Discucion` (
  `id_Discucion` INT NOT NULL AUTO_INCREMENT,
  `id_Idea` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  `comentario` VARCHAR(500) NOT NULL,
  `id_DiscucionPadre` INT NOT NULL DEFAULT 0,
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_Discucion`),
  INDEX `fk_Discucion_Idea1_idx` (`id_Idea` ASC),
  INDEX `fk_Discucion_Discucion1_idx` (`id_DiscucionPadre` ASC),
  CONSTRAINT `fk_Discucion_Idea1`
    FOREIGN KEY (`id_Idea`)
    REFERENCES `StarSoft`.`Idea` (`id_Idea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Discucion_Discucion1`
    FOREIGN KEY (`id_DiscucionPadre`)
    REFERENCES `StarSoft`.`Discucion` (`id_Discucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Reunion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Reunion` (
  `id_Reunion` INT NOT NULL AUTO_INCREMENT,
  `observacion_Reunion` VARCHAR(500) NOT NULL,
  `id_Calificacion` INT NOT NULL,
  `id_Asesor` INT NOT NULL,
  `fecha_Reunion` DATETIME NOT NULL,
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_modificacion` DATETIME NULL,
  PRIMARY KEY (`id_Reunion`),
  INDEX `fk_Reunion_Parametro1` (`id_Calificacion` ASC),
  INDEX `fk_Reunion_Usuario1` (`id_Asesor` ASC),
  CONSTRAINT `fk_Reunion_Parametro1`
    FOREIGN KEY (`id_Calificacion`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reunion_Usuario1`
    FOREIGN KEY (`id_Asesor`)
    REFERENCES `StarSoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StarSoft`.`Mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StarSoft`.`Mensaje` (
  `idMensaje` INT NOT NULL,
  `mensaje` TEXT NOT NULL,
  `id_Estado_Mensaje` INT NOT NULL,
  `fecha_Expiracion` DATETIME NULL,
  `fecha_Creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
  `Usuario_id_Usuario` INT NOT NULL,
  PRIMARY KEY (`idMensaje`),
  INDEX `fk_Mensaje_Usuario1_idx` (`Usuario_id_Usuario` ASC),
  INDEX `fk_Mensaje_Parametro1_idx` (`id_Estado_Mensaje` ASC),
  CONSTRAINT `fk_Mensaje_Usuario1`
    FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `StarSoft`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Parametro1`
    FOREIGN KEY (`id_Estado_Mensaje`)
    REFERENCES `StarSoft`.`Parametro` (`id_Parametro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
