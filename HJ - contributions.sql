# Drop views if they already exists
DROP VIEW IF EXISTS ThisWeeksHappenings;

# Create views
CREATE VIEW ThisWeeksHappenings(happenID, startTime, endTime) as
SELECT happenID, startTime, endTime FROM happenings 
WHERE startTime >= current_timestamp() && startTime <= CURRENT_TIMESTAMP() + INTERVAL 7 DAY;

-- Test
SELECT * FROM ThisWeeksHappenings;

# Query to get user activity
((select userID, postedAt as activity from posts)
union all
(select userID, commentedAt from comments))
union all
(select userID, publishedAt from stories);