USE `isuports`;

DROP TABLE IF EXISTS `tenant`;
DROP TABLE IF EXISTS `id_generator`;
DROP TABLE IF EXISTS `visit_history`;

CREATE TABLE `tenant` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `display_name` VARCHAR(255) NOT NULL,
  `created_at` BIGINT NOT NULL,
  `updated_at` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE `id_generator` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `stub` CHAR(1) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE `visit_history` (
  `player_id` VARCHAR(255) NOT NULL,
  `tenant_id` BIGINT UNSIGNED NOT NULL,
  `competition_id` VARCHAR(255) NOT NULL,
  `created_at` BIGINT NOT NULL,
  `updated_at` BIGINT NOT NULL,
  INDEX `tenant_id_idx` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;
CREATE INDEX idx_tenant_id_competition_id_player_id_created_at ON visit_history (tenant_id, competition_id, player_id, created_at);

CREATE TABLE `billing_report` (
  `tenant_id` BIGINT UNSIGNED NOT NULL,
  `competition_id` VARCHAR(255) NOT NULL,
  `competition_title` TEXT NOT NULL,
  `player_count` BIGINT NOT NULL,
  `visitor_count` BIGINT NOT NULL,
  `billing_player_yen` BIGINT NOT NULL,
  `billing_visitor_yen` BIGINT NOT NULL,
  `billing_yen` BIGINT NOT NULL,
  PRIMARY KEY (`tenant_id`, `competition_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;