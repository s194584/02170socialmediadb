# TABLE comments(
#	postID INT,
#    userID INT,
#    commentedAt DATETIME,
#    commentText VARCHAR(256),
#    PRIMARY KEY(postID,userID,commentedAt),
#    FOREIGN KEY(postID) REFERENCES posts(postID) ON DELETE CASCADE,
#    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE # Comments will still be there, even if the user is deleted
# );

# Filling the comments table
INSERT INTO comments VALUES(1, 1, current_timestamp(), "OMG SAME!");
INSERT INTO comments VALUES(2, 2, current_timestamp(), "You look so pretty!");
INSERT INTO comments VALUES(3, 3, current_timestamp(), "Potatoes mashed by a hand masher, with lots of butter, and pepper and salt. With chopped spring onions, crispy bacon, and cream corn.");
INSERT INTO comments VALUES(1, 4, current_timestamp(), "A reflection of my health consciousness over the years:
When I was a kid : French Fries 🍟😋
When I was in my 20s : Mashed Potatoes with butter. 🧈
Now : Baked Potatoes without butter 🥔");
INSERT INTO comments VALUES(2, 5, current_timestamp(), "Your stomach probably thinks all potatoes are mashed potatoes");
INSERT INTO comments VALUES(3, 6, current_timestamp(), "Fries, wedges, baked, mojos, mashed... I love 'em 🥔😋");