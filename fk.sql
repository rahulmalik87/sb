ALTER TABLE `tt_2`
ADD CONSTRAINT `fk_tt_2_tt_1`
FOREIGN KEY (`i3`)
REFERENCES `tt_1` (`ipkey`)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE `tt_4`
ADD CONSTRAINT `fk_tt_4_tt_3`
FOREIGN KEY (`i3`)
REFERENCES `tt_3` (`ipkey`)
ON DELETE CASCADE
ON UPDATE CASCADE;



