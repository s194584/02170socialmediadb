

## View of communities and there respective amount of members
DROP VIEW IF EXISTS communityMemberAmount;

CREATE VIEW communityMemberAmount as
SELECT communityID, communityName , COUNT(userID) as amountOfMembers
FROM members natural join communities
GROUP BY communityID
ORDER BY amountOfMembers DESC;

SELECT * FROM communityMemberAmount;

## View of PGRating of communities based on tags on their posts
DROP VIEW IF EXISTS postPGRating;

CREATE VIEW postPGRating as
(SELECT postID, max(PGRating) as PGRating
FROM tagged JOIN tags USING(tag)
GROUP BY postID);

SELECT * FROM postPGRating;

DROP VIEW IF EXISTS communityPGRating;

CREATE VIEW communityPGRating as
SELECT communityID, max(PGRating) as PGRating
FROM communities LEFT OUTER JOIN posts USING(communityID) 
				 LEFT OUTER JOIN postPGRating USING (postID)
GROUP BY communityID
ORDER BY communityID;

SELECT * FROM communityPGRating;

## Updating tag to PGRating 13
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

## Deleting all users who are younger than 13
CREATE FUNCTION Age (vDate DATE) RETURNS INTEGER
RETURN TIMESTAMPDIFF(YEAR, vDate , CURDATE());

SELECT userID, userName, Age(dateOfBirth)as Age FROM users;

SELECT * 
from posts
Where userID = 4 or userID = 6;

DELETE FROM users
WHERE Age(dateOfBirth) < (SELECT min(PGRating) FROM tags);






