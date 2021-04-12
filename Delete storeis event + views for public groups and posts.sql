USE socialmediadb;

INSERT INTO stories VALUES(11, "This should be deleted after the 10 minutes", 1, NOW() - interval 24 HOUR);

select * from stories;

CREATE EVENT removeStories ON SCHEDULE EVERY 1 MINUTE DO 
	DELETE FROM stories WHERE (NOW() - interval 24 HOUR) > publishedAt;

set global event_scheduler = on;

select * from stories;