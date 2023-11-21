ALTER TABLE `asignacion_grupos` ADD `calificacion` DOUBLE(8,2) NULL AFTER `curso_id`, ADD `estado` VARCHAR(255) NOT NULL DEFAULT 'PENDIENTE' AFTER `calificacion`;


ALTER TABLE `envio_correos` ADD `host` VARCHAR(255) NOT NULL DEFAULT 'smtp.gmail.com' AFTER `id`, ADD `puerto` VARCHAR(100) NOT NULL DEFAULT '465' AFTER `host`, ADD `encryptado` VARCHAR(100) NOT NULL DEFAULT 'ssl' AFTER `puerto`;
ALTER TABLE `envio_correos` ADD `driver` VARCHAR(255) NOT NULL DEFAULT 'smtp' AFTER `password`;