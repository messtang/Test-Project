
CREATE TABLE `catfish_users_tongji_#yue#` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `yuefatie` int(11) unsigned DEFAULT 0,
  `yuepinglun` int(11) unsigned DEFAULT 0,
  `yuedenglu` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `yuefatie` (`yuefatie`),
  KEY `yuepinglun` (`yuepinglun`),
  KEY `yuedenglu` (`yuedenglu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
