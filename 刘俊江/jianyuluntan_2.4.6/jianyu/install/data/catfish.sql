SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE `catfish_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `yonghu` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `nicheng` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `shouji` varchar(20) DEFAULT '',
  `touxiang` varchar(255) DEFAULT '',
  `xingbie` smallint(1) DEFAULT 0,
  `qianming` varchar(500) DEFAULT '',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastlogin` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastonline` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastfatie` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastgentie` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `loginip` varchar(128) DEFAULT '',
  `randomcode` varchar(64) NOT NULL DEFAULT '',
  `status` smallint(1) NOT NULL DEFAULT 1,
  `utype` smallint(2) DEFAULT '20',
  `mtype` smallint(2) DEFAULT 0,
  `dengji` smallint(2) DEFAULT 1,
  `jifen` int(11) DEFAULT 0,
  `jinbi` int(11) unsigned DEFAULT 0,
  `fatie` int(11) unsigned DEFAULT 0,
  `pinglun` int(11) unsigned DEFAULT 0,
  `jingpin` int(11) unsigned DEFAULT 0,
  `chengzhang` int(11) DEFAULT 0,
  `xunzhang` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `yonghu` (`yonghu`),
  UNIQUE KEY `email` (`email`),
  KEY `shouji` (`shouji`),
  KEY `lastlogin` (`lastlogin`),
  KEY `fatie` (`fatie`),
  KEY `pinglun` (`pinglun`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_users_tongji` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `denglu` int(11) unsigned DEFAULT 0,
  `tjoriginal` int(11) unsigned DEFAULT 0,
  `tjreprint` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `denglu` (`denglu`),
  KEY `tjoriginal` (`tjoriginal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_users_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `url` varchar(200) NOT NULL DEFAULT '',
  `shengri` date DEFAULT '2000-01-01',
  `activation` varchar(60) NOT NULL DEFAULT '',
  `xuexiao` varchar(200) NOT NULL DEFAULT '',
  `qq` varchar(200) NOT NULL DEFAULT '',
  `weibo` varchar(200) NOT NULL DEFAULT '',
  `wechat` varchar(200) NOT NULL DEFAULT '',
  `facebook` varchar(200) NOT NULL DEFAULT '',
  `twitter` varchar(200) NOT NULL DEFAULT '',
  `skype` varchar(200) NOT NULL DEFAULT '',
  `line` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_online` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fkip` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `onlinetime` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fkip` (`fkip`),
  KEY `onlinetime` (`onlinetime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL,
  `option_value` text NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `sid` int(11) unsigned DEFAULT 0,
  `guanjianzi` varchar(255) DEFAULT '',
  `fabushijian` datetime DEFAULT '2000-01-01 00:00:00',
  `xiugai` datetime DEFAULT '2000-01-01 00:00:00',
  `biaoti` varchar(100) DEFAULT '',
  `zhaiyao` varchar(600) DEFAULT '',
  `review` tinyint(1) DEFAULT 1,
  `closecomment` tinyint(1) DEFAULT 0,
  `isclose` tinyint(1) DEFAULT 0,
  `lastvisit` datetime DEFAULT '2000-01-01 00:00:00',
  `commentime` datetime DEFAULT '2000-01-01 00:00:00',
  `ordertime` datetime DEFAULT '2000-01-01 00:00:00',
  `luid` int(11) unsigned DEFAULT 0,
  `pinglunshu` int(11) unsigned DEFAULT 0,
  `yuedu` int(11) unsigned DEFAULT 0,
  `zan` int(11) unsigned DEFAULT 0,
  `cai` int(11) unsigned DEFAULT 0,
  `shoucang` int(11) unsigned DEFAULT 0,
  `cangtime` datetime DEFAULT '2000-01-01 00:00:00',
  `istop` tinyint(1) NOT NULL DEFAULT 0,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `fstop` tinyint(1) NOT NULL DEFAULT 0,
  `fsrecommended` tinyint(1) NOT NULL DEFAULT 0,
  `jingpin` tinyint(1) NOT NULL DEFAULT 0,
  `tietype` smallint(3) NOT NULL DEFAULT 1,
  `annex` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `recoverytime` datetime DEFAULT '2000-01-01 00:00:00',
  `tu` varchar(600) DEFAULT '',
  `pinglun` varchar(600) DEFAULT '',
  `jifenleixing` tinyint(1) NOT NULL DEFAULT 0,
  `jifen` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sid` (`sid`),
  KEY `fabushijian` (`fabushijian`),
  KEY `commentime` (`commentime`),
  KEY `ordertime` (`ordertime`),
  KEY `recoverytime` (`recoverytime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_zan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `accesstime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_gentie_zan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `accesstime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_cai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `accesstime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_gentie_cai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `accesstime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tietype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpname` varchar(200) DEFAULT '',
  `bieming` varchar(200) DEFAULT '',
  `tongji` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_dengji` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jibie` smallint(2) DEFAULT 0,
  `djname` varchar(200) DEFAULT '',
  `chengzhang` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `jibie` (`jibie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_chengzhang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `czname` varchar(200) DEFAULT '',
  `chengzhang` int(11) DEFAULT 0,
  `jifen` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `czname` (`czname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_forum` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fujian` smallint(2) DEFAULT 0,
  `fujiandj` smallint(2) DEFAULT 1,
  `fujiandwn` smallint(2) DEFAULT 0,
  `tiezi` smallint(2) DEFAULT 0,
  `tupian` smallint(2) DEFAULT 0,
  `tupiandj` smallint(2) DEFAULT 1,
  `lianjie` smallint(2) DEFAULT 0,
  `lianjiedj` smallint(2) DEFAULT 1,
  `yanzhengzt` int(11) unsigned DEFAULT 0,
  `yanzhenggt` int(11) unsigned DEFAULT 0,
  `shichangzt` varchar(50) DEFAULT '',
  `shichanggt` varchar(50) DEFAULT '',
  `geshi` text NOT NULL DEFAULT '',
  `mingan` text NOT NULL DEFAULT '',
  `preaudit` tinyint(1) NOT NULL DEFAULT 0,
  `fpreaudit` tinyint(1) NOT NULL DEFAULT 0,
  `jifen` smallint(2) DEFAULT 0,
  `jifendj` smallint(2) DEFAULT 1,
  `kzleixing` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tienr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `laiyuan` varchar(300) DEFAULT '',
  `zhengwen` text DEFAULT '',
  `fujian` varchar(500) DEFAULT '',
  `fujianming` varchar(200) DEFAULT '',
  `fjsize` int(11) unsigned DEFAULT 0,
  `yuanyin` text DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_top` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `sid` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_fstop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_tuijian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `sid` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_fstuijian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_comm_ontact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `cid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `sid` int(11) unsigned DEFAULT 0,
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `xiugai` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `parentid` int(11) unsigned NOT NULL DEFAULT 0,
  `zan` int(11) unsigned DEFAULT 0,
  `cai` int(11) unsigned DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `content` text DEFAULT '',
  `yuanyin` text DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `xiugai` (`xiugai`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_favorites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `tid` int(11) unsigned DEFAULT 0,
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dizhi` varchar(255) NOT NULL,
  `mingcheng` varchar(255) NOT NULL,
  `tubiao` varchar(255) DEFAULT '',
  `target` varchar(25) NOT NULL DEFAULT '_blank',
  `miaoshu` text DEFAULT '',
  `shouye` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `listorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_msort` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sname` varchar(200) DEFAULT '',
  `bieming` varchar(200) DEFAULT '',
  `urlbm` varchar(200) DEFAULT '',
  `guanjianzi` varchar(255) DEFAULT '',
  `description` text DEFAULT '',
  `ismenu` tinyint(1) NOT NULL DEFAULT 0,
  `virtual` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT '',
  `image` varchar(300) DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT 0,
  `linkurl` varchar(300) DEFAULT '',
  `ismodule` tinyint(1) NOT NULL DEFAULT 0,
  `subclasses` tinyint(1) NOT NULL DEFAULT 0,
  `parentid` int(11) unsigned DEFAULT 0,
  `utype` smallint(2) DEFAULT 20,
  `jibie` smallint(2) DEFAULT 0,
  `listorder` int(11) NOT NULL DEFAULT 0,
  `zhutie` int(11) unsigned DEFAULT 0,
  `gentie` int(11) unsigned DEFAULT 0,
  `tjoriginal` int(11) unsigned DEFAULT 0,
  `tjreprint` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `urlbm` (`urlbm`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_mod_sec_ontact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `mtype` smallint(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tongji` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riqi` date DEFAULT '2000-01-01',
  `zhuce` int(11) unsigned DEFAULT 0,
  `zhutie` int(11) unsigned DEFAULT 0,
  `gentie` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `riqi` (`riqi`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `zhutie` tinyint(1) NOT NULL DEFAULT 0,
  `zhutietime` datetime DEFAULT '2000-01-01 00:00:00',
  `zhutieliyou` varchar(500) DEFAULT '',
  `gentie` tinyint(1) NOT NULL DEFAULT 0,
  `gentietime` datetime DEFAULT '2000-01-01 00:00:00',
  `gentieliyou` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_jifen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `paytime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `utid` (`uid`,`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_tie_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `accesstime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_points_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `zengjian` int(11) DEFAULT 0,
  `booktime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `miaoshu` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `booktime` (`booktime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_coin_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `zengjian` int(11) DEFAULT 0,
  `booktime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `miaoshu` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `catfish_sign_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT 0,
  `qiandao` date DEFAULT '2000-01-01',
  `lianxu` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `qiandao` (`qiandao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
