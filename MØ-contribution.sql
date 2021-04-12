# Create view for easier access to the comminuty members contact info (here- name and email)
DROP VIEW IF EXISTS memberContactInfos;
CREATE VIEW memberContactInfos as
SELECT c.communityID,c.communityName,u.userName,u.email 
FROM members as m JOIN users as u JOIN communities as c 
ON m.userID=u.userID AND m.communityID=c.communityID;

# Query to find the most popular things (here- tags)
# The popularity will here based of being at least two mentions
SELECT tag,COUNT(*) as count FROM tagged GROUP BY tag HAVING COUNT(*) > 2 ORDER BY count DESC;

# Function to determine whether or not the passed user can see the passed post
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
    # See if whether the thingy is public or is in a group
    SELECT communityID INTO comID FROM posts WHERE postID=pID;
    IF comID is NULL THEN RETURN TRUE; END IF;
    # Then the post is part of a community, but is the user part of it
    SELECT COUNT(*) INTO memberCom FROM members WHERE userID=uID AND communityID=comID;
    IF memberCom = 0 THEN RETURN FALSE; END IF;
     
    RETURN TRUE;
END; //
DELIMITER ;

SELECT * FROM posts WHERE canSeePost(6,postID);