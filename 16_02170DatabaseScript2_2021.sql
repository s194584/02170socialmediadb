# Event ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set global event_scheduler = on;

CREATE EVENT removeStories ON SCHEDULE EVERY 5 SECOND DO 
	DELETE FROM stories WHERE (NOW() - interval 24 HOUR) > publishedAt;

# Function to determine whether or not the passed user can see the passed post -----------------------------------------------------------------------------------------------------------------------------------
-- PGRating, no associated group or membership in the group.
DROP FUNCTION IF EXISTS canSeePost;
DELIMITER //
CREATE FUNCTION canSeePost(uID INT, pID INT)
RETURNS boolean
BEGIN
	DECLARE age INT;
    DECLARE comID INT;
    DECLARE underagedTags INT;
    DECLARE memberCom INT;
    
    SELECT TIMESTAMPDIFF(year,dateOfBirth,now()) INTO age FROM users WHERE userID=uID;
    # Find and count the underaged tags
    SELECT COUNT(*) INTO underagedTags FROM tags WHERE tag IN (SELECT tag FROM tagged WHERE postID=pID) AND age<PGRating;
    # If any underaged tags are counted, then the user is underage.
    IF underagedTags != 0 THEN RETURN false; END IF;
    # See if whether the post is public or is in a group
    SELECT communityID INTO comID FROM posts WHERE postID=pID;
    IF comID is NULL THEN RETURN TRUE; END IF;
    # Then the post is part of a community, but is the user part of the community
    SELECT COUNT(*) INTO memberCom FROM members WHERE userID=uID AND communityID=comID;
    IF memberCom = 0 THEN RETURN FALSE; END IF;
     
    RETURN TRUE;
END; //
DELIMITER ;


# Procedure ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS notifyUser;

DELIMITER //
CREATE PROCEDURE notifyUser
(IN vuserID INT,IN vmessage VARCHAR(600))
BEGIN
	DECLARE vemail VARCHAR(40);
	SELECT email INTO vemail FROM users
    WHERE userID = vuserID;
    INSERT INTO notifications (email,message) VALUES (vemail,vmessage);
END //
DELIMITER ;

# Trigger ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS comment_after_insert;

DELIMITER //
CREATE TRIGGER comment_after_insert
AFTER INSERT ON comments FOR EACH ROW
BEGIN
	DECLARE vuserpostID INT;
    DECLARE vpostusername VARCHAR(40);
    DECLARE vcommentusername VARCHAR(40);
    SELECT userID INTO vuserpostID FROM posts
    WHERE postID = NEW.postID;
    SELECT userName INTO vpostusername FROM posts NATURAL JOIN users
    WHERE postID = NEW.postID;
    SELECT userName INTO vcommentusername FROM users
    WHERE userID = NEW.userID;
	CALL notifyUser(New.userID, CONCAT('Hello ', vpostusername, '!!! ', vcommentusername, ' commented this: "', New.commentText, '" on your post!'));
END //
DELIMITER ;

# Query to get user activity --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
((SELECT userID, postedAt AS activity FROM posts)
UNION ALL
(SELECT userID, commentedAt FROM comments))
UNION ALL
(SELECT userID, publishedAt FROM stories) ORDER BY userID;

# Query to find the most popular tags -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT tag,COUNT(*) as count FROM tagged GROUP BY tag HAVING COUNT(*) > 2 ORDER BY count DESC;

# Query - Get all posts by user -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT posts.postID, posts.postText, posts.postImage, posts.postedAt, users.userName, communities.communityName
FROM posts 
INNER JOIN users ON posts.userID = users.userID
INNER JOIN communities ON posts.communityID = communities.communityID
WHERE posts.userID = 9;

# Updating tag to PGRating 13 ... (SHOWING UPDATE) ----------------------------------------------------------------------------------------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM tags;

# look at change in
SELECT * FROM postPGRating;

UPDATE tags SET PGRating =
CASE
WHEN PGRating < 13
THEN 13
ELSE PGRating
END;

# Deleting all users who are younger than 13 ... (SHOWING DELETE) -------------------------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS age;
CREATE FUNCTION Age (vDate DATE) RETURNS INTEGER
RETURN TIMESTAMPDIFF(YEAR, vDate , CURDATE());

SELECT userID, userName, Age(dateOfBirth)as Age FROM users;

SELECT * 
from posts
Where userID = 4 or userID = 6;

DELETE FROM users
WHERE Age(dateOfBirth) < (SELECT min(PGRating) FROM tags);


# TESTS ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## VIEWS
SELECT * FROM thisWeeksHappenings;
SELECT * FROM communitiesWithOwner;
SELECT * FROM communityMemberAmount;
SELECT * FROM postPGRating;
SELECT * FROM communityPGRating;
SELECT * FROM publicPosts;
SELECT * FROM publicCommunities;
SELECT * FROM memberContactInfos;

## FUNCTIONS
SELECT * FROM posts WHERE canSeePost(6,postID);  # find all posts that user with ID 6 can see.

## EVENT - Show that storie from 24 hours ago is deleted.
INSERT INTO stories VALUES(11, "This should be deleted after the 5 SECONDS", 1, NOW() - interval 24 HOUR);
SELECT * FROM stories;
DO SLEEP(5);
SELECT * FROM stories;

## PROCEDURE
CALL notifyUser(1, 'hej');
SELECT * FROM notifications;

## TRIGGER
INSERT INTO comments VALUES
(1, 3, current_timestamp(), "You look so pretty xD");
SELECT * FROM notifications;
