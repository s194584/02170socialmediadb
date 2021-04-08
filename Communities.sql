# CREATE TABLE communities(
# 	 communityID INT,
#    communityName VARCHAR(40),
#    createdAt DATETIME,
#    isPublic BOOLEAN,
#    ownerID INT NOT NULL,
#    moderatorID INT,
#    PRIMARY KEY(communityID),
#    FOREIGN KEY(ownerID) REFERENCES users(userID) ON DELETE CASCADE, 
#    FOREIGN KEY(moderatorID) REFERENCES moderators(moderatorID) ON DELETE SET NULL
# );

# Filling the communities table
INSERT INTO communities VALUES(1, "Software2019", current_timestamp(), true, 1, 1);
INSERT INTO communities VALUES(2, "Buy & Sell - Lyngby", current_timestamp(), true, 2, 2);
INSERT INTO communities VALUES(3, "Mat 1 memes", current_timestamp(), true, 3, 3);
INSERT INTO communities VALUES(4, "The Sørensen Family", current_timestamp(), false, 4, 4);
INSERT INTO communities VALUES(5, "Internal group for POP dormitory", current_timestamp(), false, 5, 5);
INSERT INTO communities VALUES(6, "Fishing enthusiasts", current_timestamp(), true, 6, 6);
INSERT INTO communities VALUES(7, "Vegetarian Receipes", current_timestamp(), true, 7, 1);
INSERT INTO communities VALUES(8, "Fan group for ThatOneSportsDude", current_timestamp(), true, 8, 2);
INSERT INTO communities VALUES(9, "Copenhagen wine club", current_timestamp(), true, 9, 3);
INSERT INTO communities VALUES(10, "TheOneEvent", current_timestamp(), false, 10, 4);



