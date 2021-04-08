# SEED

INSERT Users VALUES
(1,'Verna Johnson','1992-04-18','2001-05-10','Verna@gmail.com'),
(2,'Flora Kilback','1987-04-18','2010-01-09','Flora@gmail.com'),
(3,'Milton Brakus','1999-01-12','2015-03-19','Milton@gmail.com'),
(4,'Bonnie Walter','2001-10-01','2016-02-10','Bonnie@gmail.com'),
(5,'Liam Armstrong','1992-03-07','2008-01-01','Liam@gmail.com'),
(6,'Oliva Ankunding','2002-12-12','2016-02-17','Oliva@gmail.com'),
(7,'Emma Schinner','1985-06-03','1999-05-10','Emma@gmail.com'),
(8,'Benjamin Greenholt','1992-04-17','2009-01-18','Benjamin@gmail.com'),
(9,'Charlotte Wolf','1993-05-08','2007-03-03','Charlotte@gmail.com'),
(10,'Mia Hahn','1979-11-13','1997-10-19','Mia@gmail.com'),
(11,'Evelyn Aufderhar','1980-01-01','2000-01-01','Evelyn@gmail.com'),
(12,'Mason Herman','1993-07-09','2009-12-08','Mason@gmail.com'),
(13,'Elijah Mosciski','1986-04-23','2001-09-17','Elijah@gmail.com');

INSERT INTO tags VALUES
("food", 13),
("travel", 15),
("movies", 13),
("music", 13),
("memes", 15),
("sport", 13),
("database", 13),
("cars", 18);

INSERT INTO moderators VALUES
(1, 100000, "John Doe"),
(2, 105000, "Jane Doe"),
(3, 65000, " Johnnie Jannine"),
(4, 78000, "Wyatt Marsh"),
(5, 35000, "Hareem Ritter"),
(6, 82000, "Jon Duggan");

INSERT Followers VALUES
(1,2,'2011-05-03'),
(2,3,'2016-10-13'),
(3,4,'2017-01-26'),
(4,5,'2017-08-21'),
(5,6,'2016-03-18'),
(6,7,'2016-05-14'),
(7,8,'2010-01-23'),
(8,9,'2009-02-02'),
(9,10,'2007-05-23'),
(10,11,'2000-10-26'),
(11,12,'2009-12-28'),
(12,13,'2011-06-13'),
(7,10,'1999-05-11'),
(10,7,'2000-07-24'),
(4,6,'2016-02-18'),
(6,4,'2016-02-18'),
(1,13,'2001-10-17'),
(2,10,'2010-12-09'),
(7,13,'2011-05-03'),
(7,12,'2010-05-10'),
(7,2,'2006-11-28');

# Filling the communities table
INSERT INTO communities VALUES(1, "Software2019", current_timestamp(), true, 1, 1),
(2, "Buy & Sell - Lyngby", current_timestamp(), true, 2, 2),
(3, "Mat 1 memes", current_timestamp(), true, 3, 3),
(4, "The Sørensen Family", current_timestamp(), false, 4, 4),
(5, "Internal group for POP dormitory", current_timestamp(), false, 5, 5),
(6, "Fishing enthusiasts", current_timestamp(), true, 6, 6),
(7, "Vegetarian Receipes", current_timestamp(), true, 7, 1),
(8, "Fan group for ThatOneSportsDude", current_timestamp(), true, 8, 2),
(9, "Copenhagen wine club", current_timestamp(), true, 9, 3),
(10, "TheOneEvent", current_timestamp(), false, 10, 4);
                                
# Happenings
-- Inspiration found from meetup.com
INSERT INTO happenings VALUES (1,"Solving Real World Problems via ML",
								"2021-04-08	06:00:00",
								"2021-04-08 07:30:00",
                                "We will have 3 experts from across the community to speak about their particular application of machine learning methods and the challenges they currently face...",
                                "Education",
                                "Online",
                                13),(2,"Mountain biking/cycling/walking brewery",
								"2021-04-18 12:00:00",
								"2021-04-18 15:00:00",
                                "There will generally be no organiser on this event - but you only need to meet up and go for a walk/ride and have a chat. You can do that on your own - can't you...",
                                "Active",
                                "Stationsvej 5, 3500 Værløse",
                                7),(3,"Switzerland Alpine Hut Tour",
								"2021-07-18 15:00:00",
								"2021-07-22 17:00:00",
                                "ITS TIME TO MAKE SOME PLANS TO TRAVEL POST COIVD AND BOOK SOMETHING BEFORE IT GETS EXPENSIVE!...",
                                "Active",
                                "Bex",
                                8),(4,"VS Code v1.55 Release Party",
								"2021-04-08 08:00:00",
								"2021-04-08 08:30:00",
                                "Woohoo! The latest VS Code release is almost out and we want to celebrate with y'all! Join our...",
                                "Conversation",
                                "Online",
                                2),(5,"Hvordan man kan forudse et radiohit",
								"2021-04-12 16:00:00",
								"2021-04-12 17:00:00",
                                "Kan man forudse hvilken sang der bliver det næste store radiohit? Oliver Fuglsang Grooss, Ph.d...",
                                "Presentation",
                                "Online",
                                4);

# Fill stories table
INSERT INTO stories VALUES(1, "INSERT INTO stories VALUES(1, "", 1, current_timestamp());", 1, current_timestamp()),
(2, "https://static.remove.bg/remove-bg-web/71dbdf11b48cb655eefe2f609ad67295258ae141/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg", 2, current_timestamp()),
(3, "https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg", 1, current_timestamp()),
(4, "https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg", 3, current_timestamp()),
(5, "https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg", 4, current_timestamp()),
(6, "https://media-exp1.licdn.com/dms/image/C561BAQGEbvT3SFyR9Q/company-background_10000/0/1582050035728?e=2159024400&v=beta&t=xwPLRsVBBNXQQS3HN3q7hsYXmt6JxJsH6lpnbh9Y1ko", 5, current_timestamp()),
(7, "https://sociallysorted.com.au/wp-content/uploads/2020/01/Remove-Background-Image-3-Toolsto-Nail-It-One-Click.jpg", 5, current_timestamp()),
(8, "https://theinpaint.com/images/example-1-2.jpg", 2, current_timestamp()),
(9, "https://justifiedgrid.com/wp-content/uploads/life/biking/137646854.jpg", 1, current_timestamp()),
(10, "https://res.cloudinary.com/demo/image/upload/w_500,f_auto/sample.jpg", 8, current_timestamp());               

# postID, userID, communityID, text, image, timestamp
INSERT INTO posts VALUES(1, 2, 2, "Welcome to the group Buy & Sell - Lyngby! This is a group for people to sell and buy second hand items :)", NULL, current_timestamp()),
(2, 9, 2, "I'm selling my old bicycle. It is red and has wheels of size 5\'5\", I have attached an image bellow. Price is 1200.", "https://via.placeholder.com/150", current_timestamp()),
(3, 11, NULL, "Went for a run today, 5 km, it was sooo refreshing! :)", NULL, current_timestamp()),
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
(10, 5, 4, "Picture from family dinner last night at grandma\'s!", "https://via.placeholder/200", current_timestamp());

INSERT INTO tagged VALUES
(7, "travel"),
(3, "database"),
(2, "food"),
(2, "movies"),
(1, "database"),
(5, "food"),
(9, "sport"),
(8, "memes"),
(8, "movies"),
(2, "memes"),
(8, "food"),
(10, "cars"),
(5, "sport"),
(9, "memes"),
(1, "movies"),
(8, "travel"),
(6, "sport"),
(2, "cars"),
(8, "database"),
(10, "movies"),
(5, "music"),
(7, "food"),
(7, "memes"),
(2, "travel"),
(5, "movies");

INSERT Reactions VALUES
(1,1,'2011-05-03'),
(2,3,'2016-10-13'),
(3,4,'2017-01-26'),
(4,1,'2017-08-21'),
(5,2,'2016-03-18'),
(6,4,'2016-05-14'),
(7,3,'2010-01-23'),
(8,3,'2009-02-02'),
(9,1,'2007-05-23'),
(10,1,'2000-10-26'),
(10,2,'2000-07-24'),
(4,3,'2016-02-18'),
(1,3,'2001-10-17'),
(2,1,'2010-12-09'),
(7,4,'2010-05-10');

# Participants
INSERT INTO participants VALUES (1,5),
								(2,2),
								(3,4),(3,5),
								(5,2),(5,1),(5,3),
								(6,5),(6,2),
                                (7,4),(7,3),
                                (9,2),(9,5),
                                (13,1),(13,2),(13,3),(13,4);
                                
INSERT INTO members VALUES
(3, 5, "2020-07-21 09:10:06"),
(9, 10, "2021-03-20 02:26:47"),
(10, 1, "2020-10-30 20:24:52"),
(7, 5, "2020-06-17 10:12:11"),
(2, 6, "2018-05-02 20:51:35"),
(9, 3, "2019-12-03 09:06:19"),
(11, 9, "2020-03-29 14:17:57"),
(2, 2, "2017-03-31 18:49:50"),
(7, 7, "2019-01-09 16:00:32"),
(5, 5, "2019-07-24 22:33:55"),
(9, 5, "2017-08-19 04:38:14"),
(10, 3, "2019-03-05 05:35:47"),
(7, 4, "2018-04-13 17:34:35"),
(7, 8, "2019-01-13 13:59:16"),
(9, 8, "2020-09-13 21:43:34"),
(1, 6, "2020-01-03 04:39:21"),
(2, 3, "2019-04-29 12:25:26"),
(5, 4, "2017-11-21 19:18:48"),
(3, 7, "2020-06-27 09:38:01"),
(9, 2, "2019-11-04 09:11:41"),
(9, 6, "2018-07-09 15:54:58"),
(3, 6, "2017-04-21 12:59:49"),
(5, 1, "2019-04-19 09:30:59");

# Filling the comments table
INSERT INTO comments VALUES(1, 1, current_timestamp(), "OMG SAME!"),
(2, 2, current_timestamp(), "You look so pretty!"),
(3, 3, current_timestamp(), "Potatoes mashed by a hand masher, with lots of butter, and pepper and salt. With chopped spring onions, crispy bacon, and cream corn."),
(1, 4, current_timestamp(), "A reflection of my health consciousness over the years:
When I was a kid : French Fries 
When I was in my 20s : Mashed Potatoes with butter. 
Now : Baked Potatoes without butter"),
(2, 5, current_timestamp(), "Your stomach probably thinks all potatoes are mashed potatoes"),
(3, 6, current_timestamp(), "Fries, wedges, baked, mojos, mashed... I love 'em");