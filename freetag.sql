-- MySQL dump 9.11
-- Freetag Structure v2.02
--
-- Table structure for table `freetags`
--

CREATE TABLE freetags (
  id int(10) unsigned NOT NULL auto_increment,
  tag varchar(30) NOT NULL default '',
  raw_tag varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Table structure for table `freetagged_objects`
--

CREATE TABLE freetagged_objects (
  tag_id int(10) unsigned NOT NULL default '0',
  tagger_id int(10) unsigned NOT NULL default '0',
  object_id int(10) unsigned NOT NULL default '0',
  tagged_on datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tag_id`,`tagger_id`,`object_id`),
  KEY `tag_id_index` (`tag_id`),
  KEY `tagger_id_index` (`tagger_id`),
  KEY `object_id_index` (`object_id`)
) TYPE=MyISAM;


