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

INSERT posts VALUES # postID, userID, communityID, text, image, timestamp
(1, 2, 2, "Welcome to the group Buy & Sell - Lyngby! This is a group for people to sell and buy second hand items :)", NULL, current_timestamp()),
(2, 9, 2, "I'm selling my old bicycle. It is red and has wheels of size 5\'5\", I have attached an image bellow. Price is 1200.", "https://via.placeholder.com/150", current_timestamp()),
(3, 11, NULL, "Went for a run today, 5 km, it was sooo refreshing! :))", NULL, current_timestamp()),
(4, 5, NULL, "Our cat has run away, has anyone seen her? She\'s a tiny and red and we miss her very much :((", NULL, current_timestamp()),
(5, 11, 9, "We are creating an event for a wine tasting later this month. Date will come soon, how many would be interested in participating? Leave a comment bellow.", NULL, current_timestamp()),
(6, 3, 7, "On request, here\'s my recipe for vegetarian chocolate chip cookies: 200g/7oz dairy-free margarine
																					125g/4½oz soft light brown sugar
																					100g/3½oz caster sugar
                                                                                    1 tsp vanilla extract
                                                                                    250g/9oz plain flour
                                                                                    ½ tsp baking powder
                                                                                    ½ tsp bicarbonate of soda
                                                                                    pinch of salt
                                                                                    200g/7oz vegan dark chocolate chips
                                                                                    1 tbsp soya milk", NULL, current_timestamp()),
(7, 1, 6, "Does anyone want to go fishing next Saturday?", NULL, current_timestamp()),
(8, 7, 7, "Hi! I recently became a vegetarian, and I am looking for inspiration for cooking books! Would love to hear all your recommendations! Cheers <3", NULL, current_timestamp()),
(9, 9, 8, "This is a fan page for ThatOneSportDude", NULL, current_timestamp()),
(10, 5, 4, "Picture from family dinner last night at grandma\'s!", "https://via.placeholder/200", current-timestamp())


