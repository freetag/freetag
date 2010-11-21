-- Update script for v2.01 to upgrade to v2.02
-- Run on your freetags database.

ALTER TABLE `freetagged_objects` ADD PRIMARY KEY ( `tag_id` , `tagger_id` , `object_id` );
ALTER TABLE `freetagged_objects` ADD INDEX `tag_id_index` ( `tag_id` );
ALTER TABLE `freetagged_objects` ADD INDEX `tagger_id_index` ( `tagger_id` );
ALTER TABLE `freetagged_objects` ADD INDEX `object_id_index` ( `object_id` );
