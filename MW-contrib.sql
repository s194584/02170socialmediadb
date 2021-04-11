-- 5. Implementation
-- Groups and their owners (join)
DROP VIEW IF EXISTS communitiesWithOwner;

CREATE VIEW communitiesWithOwner as
SELECT communityID, communityName, isPublic, ownerID, moderatorID, userName, dateOfBirth, email
FROM communities
INNER JOIN users ON communities.ownerID = users.userID;

-- 7. SQL Data Queries
-- Using join - get all post information 

-- NATURAL FULL OUTER JOIN isn't supported by MariaDB 🙄
-- SELECT *
-- FROM posts
-- NATURAL FULL OUTER JOIN comments ON posts.postID = comments.postID
-- NATURAL FULL OUTER JOIN reactions ON posts.postID = reactions.postID;

-- Alternative
-- Get all posts by user
SELECT posts.postID, posts.postText, posts.postImage, posts.postedAt, users.userName, communities.communityName
FROM posts 
INNER JOIN users ON posts.userID = users.userID
INNER JOIN communities ON posts.communityID = communities.communityID
WHERE posts.userID = 9;