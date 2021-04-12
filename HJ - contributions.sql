# Drop views if they already exists
DROP VIEW IF EXISTS thisWeeksHappenings;

# Create views
CREATE VIEW thisWeeksHappenings(happenID, startTime, endTime) as
SELECT happenID, startTime, endTime FROM happenings 
WHERE startTime >= current_timestamp() && startTime <= CURRENT_TIMESTAMP() + INTERVAL 7 DAY;

-- Test
SELECT * FROM thisWeeksHappenings;

# Query to get user activity
((SELECT userID, postedAt AS activity FROM posts)
UNION ALL
(SELECT userID, commentedAt FROM comments))
UNION ALL
(SELECT userID, publishedAt FROM stories) ORDER BY userID;