--Creating the database and the tables--

CREATE DATABASE music_streaming;
USE 'music_streaming';

CREATE TABLE bands (
artistid INT NOT NULL AUTO_INCREMENT,
Band VARCHAR(128) UNIQUE,
Lead Singer VARCHAR(128) UNIQUE,
SPRIMARY KEY (artistid)
)

CREATE TABLE Singer (
singerid INT NOT NULL AUTO_INCREMENT,
Singer VARCHAR(128),
PRIMARY KEY (singerid)
)

CREATE TABLE Musics (
musicid INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(128),
Duration_in_seconds INT,
PRIMARY KEY (musicid)
)

--Putting the information in the tables, all the information was in Spotify and Google--
INSERT INTO bands (Band)
VALUES 
('Eagles'),
('A-ha'), 
('Toto'),
('The Police'), 
('Iron Maiden'),
('Europe'), 
('Dire Straits'), 
('Queen')

INSERT INTO Singer (Singer)
VALUES 
('Vince Gill'),
('Morten Harket'),
('Joseph Williams'),
('Sting'),
('Bruce Dickson'),
('Joey Tempest'),
('Mark Knopfler'),
('Freddy Mercury')

INSERT INTO musics (Name, Duration_in_seconds) 
VALUES
('Hotel California',  '390'),
('Take on Me', '225' ),
('Africa', '295'),
('Every Breath You Take', '253'),
('The Trooper', '252'),
('The Final Countdown',  '310'),
('Sultans of Swing', '348'),
('Bohemian Rhapsody', '354')

--Creating a many-to-many relation--

--Relation between the bands and their musics-- 
CREATE TABLE band_music ( 
band_id INT, 
music_id INT, 
PRIMARY KEY (band_id, music_id), FOREIGN KEY (band_id) REFERENCES bands(BandId),
FOREIGN KEY (music_id) REFERENCES musics(musicid)
);

INSERT INTO band_music (band_id, music_id) VALUES 
(1, 1), -- Eagles - Hotel California 
(2, 2), -- A-ha - Take on Me
(3, 3), -- Toto - Africa 
(4, 4), -- The Police - Every Breath You Take
(5, 5), -- Iron Maiden - The Trooper 
(6, 6), -- Europe - The Final Countdown 
(7, 7), -- Dire Straits - Sultans of Swing 
(8, 8); -- Queen - Bohemian Rhapsody


--Relation between the singers and the bands--
CREATE TABLE band_singer ( 
band_id INT, 
singer_id INT,
PRIMARY KEY (band_id, singer_id), FOREIGN KEY (band_id) REFERENCES bands(BandId),
FOREIGN KEY (singer_id) REFERENCES singer(singerid)
);

INSERT INTO band_singer (band_id, singer_id) 
VALUES
(1, 1), -- Eagles - Vince Gill
(2, 2), -- A-ha - Morten Harket]
(3, 3), -- Toto - Joseph Williams
(4, 4), -- The Police - Sting 
(5, 5), -- Iron Maiden - Bruce Dickson
(6, 6), -- Europe - Joey Tempest 
(7, 7), -- Dire Straits - Mark Knopfler 
(8, 8); -- Queen - Freddy Mercury

--Checking if everything is working--
SELECT b.Band, m.Name 
FROM bands b 
JOIN band_music bm ON b.BandId = bm.band_id 
JOIN musics m ON bm.music_id = m.musicid
WHERE b.Band = 'Eagles';

SELECT b.Band, s.Singer 
FROM bands b JOIN band_singer bs ON b.BandId = bs.band_id 
JOIN singer s ON bs.singer_id = s.singerid WHERE b.Band = 'Eagles';