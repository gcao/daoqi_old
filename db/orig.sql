/* Tables */
DROP TABLE IF EXISTS `dq_collection`;

CREATE TABLE `dq_collection` (
  `id`          int AUTO_INCREMENT NOT NULL,
  `name`        varchar(50) NOT NULL,
  `author`      varchar(50),
  `game_count`  int NOT NULL DEFAULT '0',
  `desc`        mediumtext,
  `updated_at`  datetime,
  `updated_by`  varchar(50),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `dq_collection_game`;

CREATE TABLE `dq_collection_game` (
  `collectionid`  int NOT NULL,
  `gameid`        int NOT NULL,
  `gameindex`     int NOT NULL DEFAULT '0',
  PRIMARY KEY (`collectionid`, `gameid`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `dq_game`;

CREATE TABLE `dq_game` (
  `id`                int NOT NULL,
  `type`              int(4) NOT NULL DEFAULT '0',
  `name`              varchar(50),
  `event`             varchar(100),
  `place`             varchar(50),
  `source`            varchar(50),
  `date`              date,
  `desc`              mediumtext,
  `boardsize`         int(4) NOT NULL DEFAULT '19',
  `blackid`           int,
  `blackname`         varchar(50),
  `blackrank`         varchar(20),
  `whiteid`           int,
  `whitename`         varchar(50),
  `whiterank`         varchar(20),
  `rule`              int(4) NOT NULL DEFAULT '0',
  `handicap`          int NOT NULL DEFAULT '0',
  `komi`              float(10,2) NOT NULL DEFAULT '0.00',
  `result`            varchar(50),
  `winner`            int(4) NOT NULL DEFAULT '0',
  `moves`             int(4),
  `firstplayercolor`  int(4) NOT NULL DEFAULT '0',
  `sgf`               mediumtext,
  `sgflocation`       varchar(255),
  `groupflag`         tinyint(1) NOT NULL DEFAULT '0',
  `commentlevel`      int(4) NOT NULL DEFAULT '0',
  `commentedby`       varchar(100),
  `editorrating`      int(6),
  `hits`              int NOT NULL DEFAULT '0',
  `updated_at`  datetime,
  `updated_by`  varchar(50),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  COLLATE `latin1_bin`;

DROP TABLE IF EXISTS `dq_nation_area`;

CREATE TABLE `dq_nation_area` (
  `id`    int NOT NULL,
  `name`  varchar(50) NOT NULL,
  `desc`  mediumtext,
  `updated_at`  datetime,
  `updated_by`  varchar(50),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `dq_player`;

CREATE TABLE `dq_player` (
  `id`            int AUTO_INCREMENT NOT NULL,
  `nationareaid`  int NOT NULL,
  `username`      varchar(100),
  `lastname`      varchar(50) NOT NULL,
  `firstname`     varchar(50) NOT NULL,
  `pinyinname`    varchar(50),
  `othernames`    varchar(100),
  `amateurflag`   tinyint(1) NOT NULL DEFAULT '1',
  `ancientflag`   tinyint(1) NOT NULL DEFAULT '0',
  `rank`          varchar(20),
  `sex`           tinyint(1) DEFAULT '0',
  `birthyear`     int,
  `website`       varchar(150),
  `email`         varchar(100),
  `desc`          mediumtext,
  `editorrating`  int(6),
  `hits`          int NOT NULL DEFAULT '0',
  `updated_at`  datetime,
  `updated_by`  varchar(50),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

/* Indexes */
CREATE UNIQUE INDEX `gameindex`
  ON `dq_collection_game`
  (`gameindex`);
