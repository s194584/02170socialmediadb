# CREATE TABLE stories(
#	storyID INT,
#    storyImage VARCHAR(100), # The thought was a image url
#    userID INT NOT NULL,
#    publishedAt DATETIME,
#    PRIMARY KEY(storyID),
#    FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE
# );

# Fill stories table
INSERT INTO stories VALUES(1, "INSERT INTO stories VALUES(1, "", 1, current_timestamp());", 1, current_timestamp());
INSERT INTO stories VALUES(2, "https://static.remove.bg/remove-bg-web/71dbdf11b48cb655eefe2f609ad67295258ae141/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg", 2, current_timestamp());
INSERT INTO stories VALUES(3, "https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg", 1, current_timestamp());
INSERT INTO stories VALUES(4, "https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg", 3, current_timestamp());
INSERT INTO stories VALUES(5, "https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg", 4, current_timestamp());
INSERT INTO stories VALUES(6, "https://media-exp1.licdn.com/dms/image/C561BAQGEbvT3SFyR9Q/company-background_10000/0/1582050035728?e=2159024400&v=beta&t=xwPLRsVBBNXQQS3HN3q7hsYXmt6JxJsH6lpnbh9Y1ko", 5, current_timestamp());
INSERT INTO stories VALUES(7, "https://sociallysorted.com.au/wp-content/uploads/2020/01/Remove-Background-Image-3-Toolsto-Nail-It-One-Click.jpg", 5, current_timestamp());
INSERT INTO stories VALUES(8, "https://theinpaint.com/images/example-1-2.jpg", 2, current_timestamp());
INSERT INTO stories VALUES(9, "https://justifiedgrid.com/wp-content/uploads/life/biking/137646854.jpg", 1, current_timestamp());
INSERT INTO stories VALUES(10, "https://res.cloudinary.com/demo/image/upload/w_500,f_auto/sample.jpg", 8, current_timestamp());