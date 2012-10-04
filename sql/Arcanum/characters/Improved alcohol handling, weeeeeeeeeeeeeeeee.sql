UPDATE characters SET drunk = (drunk * 256) & 0xFF;
ALTER TABLE characters CHANGE drunk drunk smallint(5) unsigned NOT NULL DEFAULT '0';