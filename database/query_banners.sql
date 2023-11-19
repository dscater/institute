ALTER TABLE `banners` ADD `titulo` VARCHAR(300) NULL AFTER `posicion`, ADD `descripcion` VARCHAR(400) NULL AFTER `titulo`;

ALTER TABLE `gestoria_banners` ADD `titulo` VARCHAR(300) NULL AFTER `posicion`, ADD `descripcion` VARCHAR(400) NULL AFTER `titulo`;