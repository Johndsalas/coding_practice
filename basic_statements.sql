

-- Basic Statements

-- 1.	Use the albums_db database.
USE albums_db;

-- 2.	Explore the structure of the albums table.
select * from albums;

-- 3.	Write queries to find the following information:
-- a. The name of all albums by Pink Floyd

select name 

from albums

where artist = "Pink Floyd";

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released

select release_date 

from albums 

where name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind

select genre 

from albums 

where name = "Nevermind";

-- d. Which albums were released in the 1990s

select name

from albums 

where release_date between 1989 and 1999;

-- e. Which albums had less than 20 million certified sales

select name, sales

from albums

where sales < 20;

-- f. All the albums with a genre of "Rock". 

select name, genre

from albums 

where genre = "Rock";

-- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

select name, genre

from albums 

where genre like "%rock%";
