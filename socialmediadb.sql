# Creating the database
DROP DATABASE socialmediadb;
CREATE DATABASE socialmediadb;
USE socialmediadb;

# Dropping tables if they already exist
-- DROP TABLE IF EXISTS participants;
-- DROP TABLE IF EXISTS members;
-- DROP TABLE IF EXISTS communities;
-- DROP TABLE IF EXISTS moderators;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS posts;
-- DROP TABLE IF EXISTS happenings;
-- DROP TABLE IF EXISTS stories;
-- DROP TABLE IF EXISTS comments;
-- DROP TABLE IF EXISTS followers;
-- DROP TABLE IF EXISTS reactions;
-- DROP TABLE IF EXISTS tags;
-- DROP TABLE IF EXISTS tagged;


# Creating tables
CREATE TABLE moderators(
	moderatorID INT,
	salary INT,
	moderatorName VARCHAR(40),
	PRIMARY KEY (moderatorID)
);

CREATE TABLE users(
	userID INT,
    userName VARCHAR(40),
    dateOfBirth DATE,
    createdAt DATE,
    email VARCHAR(40),
    PRIMARY KEY (userID)
);

CREATE TABLE communities(
	communityID INT,
    communityName VARCHAR(40),
    createdAt DATETIME,
    isPublic BOOLEAN,
    ownerID INT NOT NULL,
    moderatorID INT,
    PRIMARY KEY(communityID),
    FOREIGN KEY(ownerID) REFERENCES users(userID) ON DELETE CASCADE, 
    FOREIGN KEY(moderatorID) REFERENCES moderators(moderatorID) ON DELETE SET NULL
);

CREATE TABLE posts(
	postID INT,
	userID INT NOT NULL,
    communityID INT,
    postText VARCHAR(3000), # This could be of type TEXT
    postImage VARCHAR(100), # The thought was a image url
    postedAt DATETIME,
    PRIMARY KEY (postID),
    FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE, ##### If the user gets deletes, then remove its posts
	FOREIGN KEY(communityID) REFERENCES communities(communityID) ON DELETE CASCADE # If the group gets deleted, then remove all postings
);

CREATE TABLE happenings(
	happenID INT,
    happenName VARCHAR(40),
    startTime DATETIME,
    endTime DATETIME,
    summary VARCHAR(200),
    happenType VARCHAR(30), # Maybe make some type of 
    location VARCHAR(30), # Break up the location somehow to street and number
    hostID INT,
    PRIMARY KEY(happenID),
    FOREIGN KEY(hostID) REFERENCES users(userID) ON DELETE CASCADE # Event can still go on, if the User gets deleted
);

CREATE TABLE stories(
	storyID INT,
    storyImage VARCHAR(100), # The thought was a image url
    userID INT NOT NULL,
    publishedAt DATETIME,
    PRIMARY KEY(storyID),
    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE comments(
	postID INT,
    userID INT,
    commentedAt DATETIME,
    commentText VARCHAR(256),
    PRIMARY KEY(postID,userID,commentedAt),
    FOREIGN KEY(postID) REFERENCES posts(postID) ON DELETE CASCADE,
    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE # Comments will still be there, even if the user is deleted
);

CREATE TABLE followers(
	followeeID INT,
    followerID INT,
    followedAt DATETIME,
    PRIMARY KEY(followeeID,followerID),
    FOREIGN KEY(followeeID) REFERENCES users(userID) ON DELETE CASCADE,
    FOREIGN KEY(followerID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE participants(
	userID INT,
    happenID INT,
    PRIMARY KEY(userID,happenID),
    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE,
    FOREIGN KEY(happenID) REFERENCES happenings(happenID) ON DELETE CASCADE
);

CREATE TABLE members(
	userID INT,
    communityID INT,
    joinedAt DATETIME,
    PRIMARY KEY(userID,communityID),
    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE,
    FOREIGN KEY(communityID) REFERENCES communities(communityID) ON DELETE CASCADE
);

CREATE TABLE reactions(
	postID INT,
    userID INT,
    likedAt DATETIME,
    PRIMARY KEY(postID,userID),
    FOREIGN KEY(postID) REFERENCES posts(postID) ON DELETE CASCADE,
    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE tags(
	tag VARCHAR(40),
    PGRating INT,
    PRIMARY KEY (tag)
);

CREATE TABLE tagged(
	postID INT,
    tag VARCHAR(40),
    PRIMARY KEY(postID,tag),
    FOREIGN KEY(postID) REFERENCES posts(postID) ON DELETE CASCADE,
    FOREIGN KEY(tag) REFERENCES tags(tag) ON DELETE CASCADE
);

