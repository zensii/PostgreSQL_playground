CREATE TABLE countries(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(40) NOT NULL UNIQUE ,
    continent varchar(40) NOT NULL ,
    currency varchar(5)
);

CREATE TABLE categories(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(50) NOT NULL UNIQUE
);

CREATE TABLE actors(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    first_name varchar(50) NOT NULL ,
    last_name varchar(50) NOT NULL ,
    birthdate date NOT NULL ,
    height int ,
    awards int NOT NULL DEFAULT 0 CHECK ( awards >= 0 ),
    country_id int REFERENCES countries on DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE productions_info(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    rating decimal(4, 2) NOT NULL ,
    duration int NOT NULL CHECK ( duration > 0 ),
    budget decimal(10, 2) ,
    release_date date NOT NULL ,
    has_subtitles boolean DEFAULT FALSE NOT NULL ,
    synopsis text
);

CREATE TABLE productions(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    title varchar(70) NOT NULL UNIQUE ,
    country_id int REFERENCES countries ON DELETE CASCADE on UPDATE CASCADE NOT NULL ,
    production_info_id int REFERENCES productions_info on DELETE CASCADE on UPDATE CASCADE NOT NULL  UNIQUE
);

CREATE TABLE productions_actors(
    production_id int REFERENCES productions on DELETE CASCADE ON UPDATE CASCADE NOT NULL ,
    actor_id int REFERENCES actors on DELETE CASCADE on UPDATE CASCADE NOT NULL ,
    PRIMARY KEY (production_id, actor_id)
);

CREATE TABLE categories_productions(
    category_id int REFERENCES categories on DELETE CASCADE on UPDATE CASCADE NOT NULL ,
    production_id int REFERENCES productions on DELETE CASCADE on UPDATE CASCADE NOT NULL ,
    PRIMARY KEY (category_id, production_id)
);

------------------------------------------

INSERT INTO countries (name, continent, currency) VALUES
                                                      ('Albania', 'Europe', NULL),
                                                      ('Argentina', 'South America', 'ARS'),
                                                      ('Armenia', 'Asia', 'AMD'),
                                                      ('Barbados', 'North America', 'BBD'),
                                                      ('Belarus', 'Europe', 'BYN'),
                                                      ('Belgium', 'Europe', 'EUR'),
                                                      ('Belize', 'North America', 'BZD'),
                                                      ('Bolivia', 'South America', 'BOB'),
                                                      ('Bulgaria', 'Europe', 'BGN'),
                                                      ('Cuba', 'North America', 'CUP'),
                                                      ('Cyprus', 'Asia', 'EUR'),
                                                      ('Czech Republic', 'Europe', 'CZK'),
                                                      ('Denmark', 'Europe', 'DKK'),
                                                      ('Dominican Republic', 'North America', 'DOP'),
                                                      ('Ecuador', 'South America', 'USD'),
                                                      ('Estonia', 'Europe', 'EUR'),
                                                      ('Germany', 'Europe', 'EUR'),
                                                      ('Greece', 'Europe', 'EUR'),
                                                      ('Greenland', 'North America', 'DKK'),
                                                      ('Haiti', 'North America', 'HTG'),
                                                      ('Hong Kong', 'Asia', 'HKD'),
                                                      ('Hungary', 'Europe', 'HUF'),
                                                      ('Iceland', 'Europe', 'ISK'),
                                                      ('India', 'Asia', 'INR'),
                                                      ('Israel', 'Asia', 'ILS'),
                                                      ('Japan', 'Asia', 'JPY'),
                                                      ('Kazakhstan', 'Asia', 'KZT'),
                                                      ('Kenya', 'Africa', 'KES'),
                                                      ('Latvia', 'Europe', 'EUR'),
                                                      ('Malta', 'Europe', 'EUR'),
                                                      ('Mexico', 'North America', 'MXN'),
                                                      ('Netherlands', 'Europe', 'EUR'),
                                                      ('New Zealand', 'Oceania', 'NZD'),
                                                      ('Pakistan', 'Asia', 'PKR'),
                                                      ('Paraguay', 'South America', 'PYG'),
                                                      ('Peru', 'South America', 'PEN'),
                                                      ('Philippines', 'Asia', 'PHP'),
                                                      ('Poland', 'Europe', 'PLN'),
                                                      ('Portugal', 'Europe', 'EUR'),
                                                      ('Romania', 'Europe', 'RON'),
                                                      ('Serbia', 'Europe', 'RSD'),
                                                      ('South Africa', 'Africa', 'ZAR'),
                                                      ('Italy', 'Europe', 'EUR'),
                                                      ('Sweden', 'Europe', 'SEK'),
                                                      ('Switzerland', 'Europe', 'CHF'),
                                                      ('Thailand', 'Asia', 'THB'),
                                                      ('Tunisia', 'Africa', 'TND'),
                                                      ('United Kingdom', 'Europe', 'GBP'),
                                                      ('United States', 'North America', 'USD'),
                                                      ('Uruguay', 'South America', 'UYU'),
                                                      ('Suriname', 'South America', 'SRD'),
                                                      ('Iran', 'Asia', NULL),
                                                      ('Uzbekistan', 'Asia', 'UZS');

INSERT INTO categories (name) VALUES
                                  ('Action'),
                                  ('Adventure'),
                                  ('Animation'),
                                  ('Biography'),
                                  ('Comedy'),
                                  ('Crime'),
                                  ('Documentary'),
                                  ('Drama'),
                                  ('Family'),
                                  ('Fantasy'),
                                  ('Film Noir'),
                                  ('History'),
                                  ('Horror'),
                                  ('Music'),
                                  ('Musical'),
                                  ('Mystery'),
                                  ('Romance'),
                                  ('Sci-Fi'),
                                  ('Short Film'),
                                  ('Sport'),
                                  ('Superhero'),
                                  ('Thriller'),
                                  ('War'),
                                  ('Western');

INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id) VALUES
                                                                                      ('Jill', 'Roistone', '1990-04-08', 173, 2, 36),
                                                                                      ('Claus', 'Jewis', '1999-10-08', 174, 0, 8),
                                                                                      ('Gilligan', 'Elrick', '1984-08-05', NULL, 25, 16),
                                                                                      ('Hallie', 'Swaffield', '1964-03-05', 157, 29, 23),
                                                                                      ('Nathalia', 'Sothern', '1995-07-13', 192, 7, 20),
                                                                                      ('Aridatha', 'Daily', '1968-09-08', 177, 0, 5),
                                                                                      ('Mabel', 'Wermerling', '1981-12-18', 163, 22, 4),
                                                                                      ('Erna', 'Gilbank', '2002-12-12', 167, 0, 27),
                                                                                      ('Jens', 'Shurey', '1991-09-28', 179, 0, 9),
                                                                                      ('Gerrard', 'Esser', '1960-12-12', 182, 7, 36),
                                                                                      ('Rosette', 'Petruszka', '1968-12-19', 198, 8, 6),
                                                                                      ('Tedmund', 'Lucius', '1963-11-18', 188, 20, 28),
                                                                                      ('Fayth', 'Mather', '2001-05-01', 174, 10, 19),
                                                                                      ('Stephan', 'Lundberg', '1993-01-25', 176, 0, 10),
                                                                                      ('King', 'Beadel', '1985-08-24', NULL, 0, 9),
                                                                                      ('Tammara', 'Swadlen', '1993-12-19', 173, 29, 10),
                                                                                      ('Dorelle', 'Gawen', '1983-06-05', 159, 25, 37),
                                                                                      ('Eb', 'Dimitriou', '1994-03-10', 167, 19, 21),
                                                                                      ('Moselle', 'Tran', '1971-08-21', 173, 20, 21),
                                                                                      ('Zane', 'Rubbert', '1976-02-10', 160, 1, 50),
                                                                                      ('Foss', 'Kornousek', '1963-12-10', 178, 0, 46),
                                                                                      ('Fredric', 'McGunley', '2000-11-07', 161, 25, 28),
                                                                                      ('Chlo', 'Arnson', '1976-05-07', 196, 18, 37),
                                                                                      ('Jessika', 'Cluney', '1968-10-07', 173, 0, 50),
                                                                                      ('Wallie', 'Cappineer', '1974-04-18', 169, 26, 29),
                                                                                      ('Giorgio', 'Pelfer', '1972-05-01', 188, 0, 43),
                                                                                      ('Dorolisa', 'Sabate', '1974-01-05', 199, 30, 29),
                                                                                      ('Dorothy', 'Pickersgill', '1961-10-12', 195, 19, 15),
                                                                                      ('Maurits', 'Gladtbach', '1965-04-10', 190, 25, 50),
                                                                                      ('Holmes', 'Kimbly', '1987-06-22', 192, 6, 32),
                                                                                      ('Sissie', 'Ludlamme', '1972-11-24', 194, 0, 2),
                                                                                      ('Glynis', 'Beddoe', '1991-05-31', 169, 0, 16),
                                                                                      ('Delora', 'Dufoure', '1996-06-05', 185, 13, 27),
                                                                                      ('Karlene', 'Lynock', '1980-07-02', 159, 24, 46),
                                                                                      ('Lise', 'Trodden', '1984-11-10', 184, 17, 33),
                                                                                      ('Yorgo', 'Vigers', '2002-10-02', 160, 8, 9),
                                                                                      ('Alwin', 'Fouracres', '1971-01-18', 195, 5, 48),
                                                                                      ('Hubert', 'Haestier', '1987-05-17', 187, 9, 27),
                                                                                      ('Justino', 'Fasse', '1988-08-08', 163, 0, 35),
                                                                                      ('Lynnett', 'Tebbs', '1975-11-17', 199, 27, 20),
                                                                                      ('Charlotte', 'Eyres', '1967-03-09', 156, 18, 37),
                                                                                      ('Rosella', 'Duffit', '1999-04-06', 180, 19, 3),
                                                                                      ('Sid', 'Kardos-Stowe', '1998-06-03', 165, 9, 27),
                                                                                      ('Lissy', 'Shoppee', '1965-12-28', 180, 0, 10),
                                                                                      ('Kippy', 'Curtiss', '1994-06-21', 189, 17, 36),
                                                                                      ('Hube', 'Romaine', '1972-04-07', 177, 5, 35),
                                                                                      ('Lewie', 'Tutt', '2003-03-15', 177, 8, 15),
                                                                                      ('Brianna', 'Spours', '1962-05-05', 180, 0, 22),
                                                                                      ('Bartel', 'Petrichat', '1975-12-10', 197, 28, 25),
                                                                                      ('Edgard', 'Bartlomiejczyk', '2001-09-23', 157, 6, 46),
                                                                                      ('Victor', 'Kirkman', '1976-10-02', 187, 11, 38),
                                                                                      ('Ara', 'Ifill', '1986-08-10', 166, 0, 41),
                                                                                      ('Michelina', 'Ockendon', '1988-09-26', 160, 14, 33),
                                                                                      ('Domenic', 'Uphill', '1992-08-27', 191, 21, 17),
                                                                                      ('Jaquenette', 'Antoons', '2000-10-19', 198, 0, 30),
                                                                                      ('Beckie', 'Gergely', '1964-07-11', 179, 8, 49),
                                                                                      ('Carree', 'Bradborne', '1988-06-18', 156, 0, 3),
                                                                                      ('Antoinette', 'Syers', '1982-05-20', 164, 0, 38),
                                                                                      ('Brittany', 'Skitt', '1961-01-27', 176, 9, 21),
                                                                                      ('Horace', 'Caslane', '1980-11-05', 169, 24, 33),
                                                                                      ('Mikkel', 'Aronovitz', '1961-09-17', 156, 7, 33),
                                                                                      ('Frasquito', 'Yearnsley', '1961-12-19', 164, 24, 14),
                                                                                      ('Luise', 'Neylon', '1967-10-27', 173, 0, 28),
                                                                                      ('Clay', 'Dilliway', '1965-02-19', 159, 0, 35),
                                                                                      ('Lianna', 'Duckers', '1985-03-07', 161, 0, 37),
                                                                                      ('Lucienne', 'Kadwallider', '1998-11-10', 161, 0, 44),
                                                                                      ('Livvie', 'Gorling', '1981-09-28', 165, 10, 19),
                                                                                      ('Winna', 'Tryme', '1977-03-29', 167, 12, 38),
                                                                                      ('Mandie', 'Jaulme', '1985-10-05', 190, 0, 30),
                                                                                      ('Johna', 'Jerram', '1981-11-20', 168, 0, 12),
                                                                                      ('Hyacinth', 'Cannop', '1966-08-26', 183, 0, 9),
                                                                                      ('Sumner', 'Oganesian', '1992-06-22', 169, 12, 5),
                                                                                      ('Virgilio', 'Fewkes', '1999-01-07', 158, 0, 27),
                                                                                      ('Charin', 'Gajownik', '1999-03-20', 172, 0, 13),
                                                                                      ('Rabbi', 'Pointin', '1976-10-03', 199, 0, 35),
                                                                                      ('Wenona', 'Hallybone', '2003-02-25', 190, 14, 24),
                                                                                      ('Bondon', 'Starford', '1972-01-07', 156, 11, 38),
                                                                                      ('Mireille', 'Snazle', '1992-10-23', 200, 0, 25),
                                                                                      ('Nadeen', 'Royston', '1981-02-27', 189, 18, 48),
                                                                                      ('Mayer', 'Kefford', '1978-04-10', 157, 26, 50),
                                                                                      ('Roberto', 'Dever', '1968-01-04', 191, 0, 23),
                                                                                      ('Gregoor', 'Simone', '1963-12-27', 170, 10, 26),
                                                                                      ('Andrea', 'Vallentine', '1982-03-07', 181, 16, 27),
                                                                                      ('Kerrin', 'Sperwell', '1991-07-23', 189, 5, 19),
                                                                                      ('Shirlene', 'Cockell', '1973-08-22', 171, 15, 47),
                                                                                      ('Blinnie', 'Haistwell', '1972-12-10', 157, 13, 36),
                                                                                      ('Fidelity', 'Forestall', '1962-08-04', 177, 0, 44),
                                                                                      ('Vanna', 'Bilborough', '1999-01-25', 189, 20, 13),
                                                                                      ('Shayne', 'Byham', '1995-04-26', 189, 20, 4),
                                                                                      ('Adelaide', 'Colvie', '1973-12-25', 187, 0, 4),
                                                                                      ('Carmel', 'Spriggs', '1998-07-22', 160, 17, 50),
                                                                                      ('Seka', 'Van Brug', '1964-10-04', 161, 1, 17),
                                                                                      ('Nerita', 'Janning', '1975-10-23', 182, 0, 48),
                                                                                      ('Em', 'Hyde-Chambers', '1974-07-05', 166, 0, 41),
                                                                                      ('Maxie', 'Seccombe', '1975-08-17', 171, 21, 12),
                                                                                      ('Thaine', 'Billinge', '1986-02-20', 162, 0, 48),
                                                                                      ('Adriana', 'Klimkovich', '1992-01-03', 200, 5, 19),
                                                                                      ('Carita', 'Feaveer', '1960-10-23', 160, 11, 19),
                                                                                      ('Kynthia', 'Clemas', '1981-12-20', 191, 0, 37),
                                                                                      ('Lyn', 'Vesco', '1992-12-26', 163, 0, 4),
                                                                                      ('Cindee', 'MacEvilly', '1985-09-30', 174, 0, 29),
                                                                                      ('Silas', 'Bole', '1962-10-24', 168, 25, 34),
                                                                                      ('Aarika', 'Sawkin', '1988-09-22', 159, 0, 37),
                                                                                      ('Lucias', 'Momford', '1991-07-12', 188, 28, 18),
                                                                                      ('Nanon', 'Squirrell', '1983-09-13', 163, 11, 34),
                                                                                      ('Marigold', 'Ugoletti', '2000-01-28', 188, 0, 42),
                                                                                      ('Car', 'Adiscot', '2001-09-12', 200, 0, 30),
                                                                                      ('Gertrudis', 'Berrisford', '1996-02-25', 157, 5, 33),
                                                                                      ('Elset', 'Velde', '1970-07-11', 155, 13, 11),
                                                                                      ('Libbi', 'Kedie', '1994-05-07', 196, 2, 34),
                                                                                      ('Felike', 'Peebles', '1970-11-03', 155, 26, 24),
                                                                                      ('Nickola', 'Dicty', '1982-10-29', 184, 29, 3),
                                                                                      ('Leigha', 'Bathow', '1991-10-04', 161, 0, 44),
                                                                                      ('Emerson', 'Kytley', '1986-04-04', 199, 3, 43),
                                                                                      ('Bern', 'Amner', '1963-12-16', 186, 23, 32),
                                                                                      ('Garland', 'Khoter', '1960-09-02', 158, 21, 2),
                                                                                      ('Wallie', 'Maylor', '1997-10-24', 187, 16, 42),
                                                                                      ('Wolfgang', 'Vowdon', '1965-01-27', 170, 7, 35),
                                                                                      ('Sancho', 'Setchfield', '1966-01-19', 200, 18, 19),
                                                                                      ('Modestine', 'Loraine', '1984-04-02', 197, 0, 50),
                                                                                      ('Sybil', 'Knatt', '1970-01-02', 197, 19, 7),
                                                                                      ('Linda', 'Croad', '2000-04-06', 163, 28, 1),
                                                                                      ('Julia', 'De Giovanni', '1965-07-26', 188, 0, 50),
                                                                                      ('Cathleen', 'Simmgen', '1998-10-07', 164, 0, 33),
                                                                                      ('Lanny', 'Mance', '1961-02-12', 187, 3, 50),
                                                                                      ('Karee', 'Carroll', '1972-06-07', 176, 23, 25),
                                                                                      ('Missie', 'Pettecrew', '1991-10-18', 172, 0, 20),
                                                                                      ('Averell', 'Attersoll', '1995-10-21', 179, 22, 2),
                                                                                      ('Josselyn', 'Moston', '1992-12-23', 160, 23, 25),
                                                                                      ('Lark', 'Dyka', '1981-03-27', 155, 30, 11),
                                                                                      ('Henriette', 'Golden', '1998-09-01', 162, 0, 11),
                                                                                      ('Rayshell', 'Ozintsev', '1966-03-19', 179, 0, 29),
                                                                                      ('Lindsay', 'Makepeace', '1966-07-24', 161, 0, 15),
                                                                                      ('Simmonds', 'Reeman', '1990-01-08', 198, 0, 17),
                                                                                      ('Sherman', 'McCalum', '1973-10-23', 171, 12, 42),
                                                                                      ('Adrian', 'Cantua', '1975-09-12', 198, 27, 38),
                                                                                      ('Sophie', 'Jest', '1993-08-06', 193, 2, 30),
                                                                                      ('Gunther', 'Pude', '1989-07-12', 155, 7, 24),
                                                                                      ('Helena', 'Brettoner', '1969-05-10', 188, 19, 23),
                                                                                      ('Victoir', 'Buckingham', '1992-03-13', 159, 21, 27),
                                                                                      ('Sorcha', 'Dell Casa', '1961-05-08', 162, 7, 11),
                                                                                      ('Hardy', 'D''Antuoni', '1969-11-13', 187, 0, 45),
                                                                                      ('Thorstein', 'Ciobotaro', '1993-09-15', 156, 25, 27),
                                                                                      ('Sharron', 'Dodge', '2002-06-17', 161, 29, 26),
                                                                                      ('Giavani', 'Jedryka', '1984-09-22', 159, 0, 15),
                                                                                      ('Eveleen', 'Marquet', '1963-07-07', 176, 16, 22),
                                                                                      ('Tally', 'Holyland', '1981-01-19', 164, 2, 14),
                                                                                      ('Jaime', 'Lawday', '1995-03-18', 195, 0, 37),
                                                                                      ('Nicky', 'Fahy', '1997-01-29', 177, 15, 21),
                                                                                      ('Barbey', 'Moralee', '1975-06-25', 194, 18, 47),
                                                                                      ('Brandon', 'Eykelhof', '1994-11-19', 156, 0, 1),
                                                                                      ('Mala', 'Berzen', '2003-02-27', 200, 0, 21),
                                                                                      ('Carmencita', 'Humphery', '1984-02-05', 196, 0, 23),
                                                                                      ('Hermann', 'McComiskey', '1995-02-10', 171, 6, 7),
                                                                                      ('Roma', 'Selvester', '1969-02-26', 165, 0, 14),
                                                                                      ('Vinita', 'Giannoni', '1990-11-23', 181, 0, 16),
                                                                                      ('Cora', 'Feedham', '1998-12-24', 189, 29, 16),
                                                                                      ('Orv', 'Beswick', '1984-08-23', 175, 20, 1),
                                                                                      ('Jared', 'Di Batista', '1999-01-23', 186, 0, 23),
                                                                                      ('Abeu', 'Arrow', '1982-03-02', 164, 4, 32),
                                                                                      ('Gothart', 'Hubert', '2002-03-30', 173, 19, 7),
                                                                                      ('Andres', 'Phythean', '1989-10-03', 183, 22, 11),
                                                                                      ('Gery', 'Cutmore', '1967-10-29', 200, 17, 21),
                                                                                      ('Janice', 'Squeers', '1998-06-16', 192, 7, 13),
                                                                                      ('Malva', 'Mardle', '1962-05-19', 159, 13, 29),
                                                                                      ('Lauralee', 'Ar0', '1968-07-29', 174, 5, 37),
                                                                                      ('Rodolph', 'Rowantree', '1993-03-30', 156, 0, 10),
                                                                                      ('Talbot', 'Bartczak', '1968-06-22', 172, 0, 39),
                                                                                      ('Gamaliel', 'De Fraine', '1969-08-02', 193, 17, 12),
                                                                                      ('Aldric', 'Balazs', '1993-09-28', 199, 12, 21),
                                                                                      ('Noe', 'Diemer', '1960-11-17', 173, 30, 25),
                                                                                      ('Lottie', 'Bredes', '1994-08-25', 191, 21, 45),
                                                                                      ('Barron', 'Woan', '1990-01-18', 169, 5, 1),
                                                                                      ('Connie', 'Mackneis', '1995-11-19', 184, 3, 15),
                                                                                      ('Lucretia', 'Binks', '1961-08-16', 157, 0, 20),
                                                                                      ('Rriocard', 'Dodimead', '1998-10-31', 187, 0, 3),
                                                                                      ('Lisabeth', 'Minnette', '1983-06-23', 158, 0, 22),
                                                                                      ('Aristotle', 'Godon', '1983-12-17', 170, 24, 17),
                                                                                      ('Robers', 'Le Count', '1985-07-23', 169, 0, 29),
                                                                                      ('Jo-ann', 'O'' Dornan', '1960-08-20', 171, 0, 10),
                                                                                      ('Devi', 'Minot', '1991-12-12', 185, 2, 23),
                                                                                      ('Russ', 'Dot', '1967-05-10', 168, 0, 33),
                                                                                      ('Darsie', 'Buist', '1985-10-29', 195, 11, 16),
                                                                                      ('Andriette', 'Brownsmith', '2001-08-04', 194, 22, 48),
                                                                                      ('Karmen', 'McGucken', '1991-10-21', 167, 0, 26),
                                                                                      ('Ileane', 'Moyles', '1974-02-01', 157, 18, 39),
                                                                                      ('Lacee', 'Peacock', '1976-05-09', 158, 23, 44),
                                                                                      ('Jobie', 'Quaif', '1997-05-17', 198, 0, 20),
                                                                                      ('Paxton', 'Panketh', '1961-09-28', 161, 0, 31),
                                                                                      ('Ichabod', 'Elman', '1968-12-19', 160, 30, 1),
                                                                                      ('Ciro', 'Dog', '1961-02-27', 158, 0, 48),
                                                                                      ('Jervis', 'Wynch', '1986-01-07', 178, 0, 48),
                                                                                      ('Hube', 'Miranda', '1987-04-27', 155, 3, 36),
                                                                                      ('Kai', 'Evins', '1990-01-16', 194, 27, 19),
                                                                                      ('Richie', 'Crean', '1989-09-08', 166, 28, 37),
                                                                                      ('Dwain', 'Lamerton', '1995-01-22', 161, 0, 47),
                                                                                      ('Rube', 'Gaddesby', '1983-04-25', 166, 11, 4),
                                                                                      ('Cosmo', 'Blankhorn', '1971-09-18', 188, 0, 28),
                                                                                      ('Damien', 'McCarver', '1993-01-08', 164, 0, 20),
                                                                                      ('Davine', 'Sloam', '1990-10-01', 186, 0, 44),
                                                                                      ('Felicia', 'Truelove', '1983-05-02', 163, 0, 35),
                                                                                      ('Concettina', 'Trenholm', '1970-08-19', 183, 0, 45),
                                                                                      ('Bride', 'Steagall', '2002-08-12', 160, 30, 21),
                                                                                      ('Loralie', 'MacColgan', '1962-02-11', 174, 0, 7),
                                                                                      ('Helene', 'Ashcroft', '1962-03-21', 186, 0, 42),
                                                                                      ('Dana', 'Di Carlo', '1975-11-18', 179, 13, 8),
                                                                                      ('Johnath', 'Dalglish', '1963-10-12', 165, 14, 8),
                                                                                      ('Lonna', 'Ruddin', '1980-04-12', 182, 29, 19),
                                                                                      ('Onfroi', 'Stronach', '1990-08-01', 168, 0, 44),
                                                                                      ('Alisha', 'Juzek', '1961-04-08', 160, 5, 50),
                                                                                      ('Cleveland', 'Steedman', '1960-09-17', 195, 14, 5),
                                                                                      ('Julia', 'Bloggett', '1980-02-08', 189, 0, 11),
                                                                                      ('Shalne', 'Illingworth', '2002-08-17', 157, 2, 40),
                                                                                      ('Lazaro', 'Mulliss', '1986-10-23', 166, 21, 10),
                                                                                      ('Giulio', 'Garham', '1970-12-09', 157, 14, 48),
                                                                                      ('Bartolomeo', 'Renshell', '1988-01-13', 157, 0, 22),
                                                                                      ('Marylin', 'Benion', '1975-07-16', 165, 13, 46),
                                                                                      ('Bethany', 'Van de Vlies', '1985-11-11', 187, 18, 20),
                                                                                      ('Dene', 'Brodest', '1963-06-08', 181, 0, 38),
                                                                                      ('Jasun', 'Surgenor', '1996-10-14', 177, 1, 1),
                                                                                      ('Donavon', 'Vardy', '2002-03-28', 181, 26, 28),
                                                                                      ('Penni', 'MacLennan', '1970-08-11', 176, 8, 4),
                                                                                      ('Marcelline', 'Elvey', '1963-11-02', 159, 5, 39),
                                                                                      ('Raynard', 'Pund', '1984-04-25', 169, 13, 11),
                                                                                      ('Nisse', 'Hinsch', '1986-01-06', 199, 0, 4),
                                                                                      ('Katherine', 'Lelande', '1964-05-31', 185, 13, 38),
                                                                                      ('Valina', 'Klaesson', '1990-05-21', 167, 0, 19),
                                                                                      ('Em', 'Reah', '1985-01-17', 173, 9, 7),
                                                                                      ('Haley', 'Buche', '1969-10-21', 156, 0, 17),
                                                                                      ('Calv', 'Pilgram', '1970-12-26', 164, 0, 11),
                                                                                      ('Baryram', 'Awcoate', '1967-06-22', 191, 7, 13),
                                                                                      ('Lynn', 'Blanchflower', '1968-01-26', 156, 16, 35),
                                                                                      ('Neill', 'Chesser', '1964-09-08', 156, 8, 10),
                                                                                      ('Cherida', 'Skeene', '1962-12-11', 164, 9, 47),
                                                                                      ('Morey', 'Southeran', '1979-08-30', 161, 2, 1),
                                                                                      ('Annetta', 'Halkyard', '2002-06-10', 171, 26, 14),
                                                                                      ('Chancey', 'Duggen', '1989-08-14', 178, 28, 10),
                                                                                      ('Joe', 'Routh', '1961-12-23', 189, 9, 6),
                                                                                      ('Armando', 'Cabrera', '1964-11-11', 155, 18, 28),
                                                                                      ('Greer', 'Spearing', '1987-05-31', 155, 25, 41),
                                                                                      ('Barbara-anne', 'Cadden', '2000-04-03', 175, 0, 47),
                                                                                      ('Stafani', 'Yusupov', '1973-04-01', 193, 2, 9),
                                                                                      ('Shannan', 'Dandie', '1981-10-31', 156, 0, 19),
                                                                                      ('Celinda', 'Merwede', '1994-06-15', 173, 0, 23),
                                                                                      ('Harwilll', 'Sorrell', '1975-05-06', 176, 7, 47),
                                                                                      ('Giffy', 'Rowlinson', '1966-01-09', 165, 1, 16),
                                                                                      ('Gerek', 'Summerley', '1972-02-27', 156, 0, 16),
                                                                                      ('Arlen', 'Theuff', '1994-01-06', 169, 27, 8),
                                                                                      ('Shaine', 'Blevin', '1974-07-23', 179, 5, 36),
                                                                                      ('Franzen', 'Cavanagh', '1960-08-05', 160, 26, 20),
                                                                                      ('Caye', 'Goly', '1984-03-13', 194, 0, 27),
                                                                                      ('Suzi', 'Gobeau', '1979-07-27', 169, 3, 33),
                                                                                      ('Ellyn', 'Willcot', '1969-02-19', 161, 5, 45),
                                                                                      ('Obediah', 'MacGilpatrick', '1994-02-15', 174, 0, 16),
                                                                                      ('Ruprecht', 'Owthwaite', '1970-01-26', 187, 0, 3),
                                                                                      ('Mechelle', 'Costelow', '1975-11-24', 169, 7, 47),
                                                                                      ('Red', 'Tarrier', '1983-10-22', 179, 0, 49),
                                                                                      ('Marshal', 'Beevor', '1989-01-20', 182, 13, 36),
                                                                                      ('Doralin', 'Warbeys', '1987-08-12', 190, 14, 16),
                                                                                      ('Kylen', 'Borgars', '1970-08-25', 156, 20, 11),
                                                                                      ('Gertrude', 'Depper', '1970-06-19', 156, 7, 23),
                                                                                      ('Sapphire', 'Victoria', '1960-04-24', 156, 30, 3),
                                                                                      ('Gail', 'Wallice', '1996-02-29', 160, 21, 37),
                                                                                      ('Beryle', 'Yatman', '1969-09-14', 181, 0, 44),
                                                                                      ('Frankie', 'McVity', '1961-11-19', 182, 4, 35),
                                                                                      ('Romonda', 'Saer', '1984-05-31', 187, 0, 34),
                                                                                      ('Jamie', 'Butlin', '1972-09-04', 172, 15, 42),
                                                                                      ('Robby', 'Gellier', '1971-11-13', 159, 0, 29),
                                                                                      ('Ingrid', 'Ackenhead', '1969-10-18', 185, 24, 46),
                                                                                      ('Levy', 'Edworthy', '1999-01-10', 166, 17, 12),
                                                                                      ('Zarla', 'Avrahamy', '1978-02-19', 189, 16, 36),
                                                                                      ('Kiel', 'Spatari', '1973-02-17', 191, 20, 21),
                                                                                      ('Allison', 'Bockler', '1988-01-24', 188, 8, 30),
                                                                                      ('Juliane', 'Spitell', '1978-01-06', 184, 0, 34),
                                                                                      ('Niko', 'Glauber', '1999-11-24', 175, 5, 33),
                                                                                      ('Flem', 'Loomis', '1963-03-18', 193, 19, 36),
                                                                                      ('Odie', 'Upham', '1966-01-26', 172, 0, 22),
                                                                                      ('Alvie', 'Sang', '1989-10-30', 179, 0, 2),
                                                                                      ('Roxana', 'Roddell', '2001-10-01', 181, 13, 44),
                                                                                      ('Andriette', 'Gutcher', '1978-03-04', 186, 0, 26),
                                                                                      ('Den', 'O''Fielly', '1986-01-14', 155, 14, 19),
                                                                                      ('Gregor', 'Leonida', '1976-01-22', 190, 1, 41),
                                                                                      ('Neale', 'Chesterman', '1961-10-24', 176, 22, 15),
                                                                                      ('Claus', 'Stenhouse', '1962-03-28', 174, 6, 29),
                                                                                      ('Jeffrey', 'Glavin', '1982-10-20', 157, 0, 48),
                                                                                      ('Mel', 'Hully', '1980-01-08', 158, 0, 32),
                                                                                      ('Clifford', 'Rivlin', '1978-03-14', 182, 16, 18),
                                                                                      ('Chaddy', 'Crann', '1978-10-17', 155, 0, 45),
                                                                                      ('Ivett', 'Thomsson', '1988-08-01', 181, 0, 12),
                                                                                      ('Aldric', 'Mews', '1997-04-21', 187, 0, 25),
                                                                                      ('Lindie', 'Prazer', '2001-09-02', 176, 20, 17),
                                                                                      ('Eberto', 'Emmitt', '2002-08-25', 200, 4, 30),
                                                                                      ('Henriette', 'Lob', '1985-11-16', 163, 0, 21),
                                                                                      ('Jason', 'Bogart', '1992-06-15', 199, 8, 43),
                                                                                      ('Prescott', 'Girkins', '1993-09-21', 177, 0, 23),
                                                                                      ('Alric', 'Guilloud', '1989-08-05', 164, 22, 10),
                                                                                      ('Tootsie', 'Macconachy', '2001-04-20', 193, 0, 47),
                                                                                      ('Arron', 'Ledger', '1987-03-23', 183, 15, 44),
                                                                                      ('Kelwin', 'Errichi', '1976-01-04', 183, 0, 2),
                                                                                      ('Carlie', 'Cleere', '1994-09-01', NULL, 2, 49);

INSERT INTO productions_info (rating, duration, budget, release_date, has_subtitles, synopsis) VALUES
                                                                                                   (7.50, 120, 5500000.00, '2023-01-01', true, 'A gripping action-packed adventure about a secret agent.'),
                                                                                                   (8.20, 150, 1000000.00, '2022-12-25', false, 'A heartwarming drama exploring the complexities of family relationships.'),
                                                                                                   (6.80, 95, 2000000.00, '2021-11-11', true, 'An inspiring story of an underdog sports team overcoming the odds.'),
                                                                                                   (7.00, 110, 7500000.00, '2022-05-15', false, 'A thrilling mystery that keeps you guessing until the very end.'),
                                                                                                   (9.00, 130, 1500000.00, '2023-07-04', true, 'A historical epic recounting the events of a significant battle.'),
                                                                                                   (10.00, 110, NULL, '2022-05-15', false, 'A thrilling mystery that keeps you guessing until the very end.'),
                                                                                                   (9.10, 130, 150000.00, '2023-07-04', true, NULL),
                                                                                                   (8.50, 140, 9500000.00, '2021-09-22', false, 'A musical journey that celebrates the power of music and friendship.'),
                                                                                                   (7.30, 105, 3500000.00, '2022-04-01', true, 'A fantasy tale of a young hero on a quest to save a magical kingdom.'),
                                                                                                   (8.00, 125, 6000000.00, '2023-03-30', false, 'A documentary that delves into the lives of endangered species.'),
                                                                                                   (6.50, 90, 150000.00, '2021-06-18', true, 'A comedy about a group of friends navigating the ups and downs of life.'),
                                                                                                   (7.80, 115, 45000000.00, '2022-10-31', false, 'A horror film that explores the dark secrets of a haunted house.'),
                                                                                                   (7.90, 100, 500000.00, '2021-08-12', true, 'A sci-fi adventure set in a dystopian future where humanity fights for survival.'),
                                                                                                   (8.30, 135, 120000.00, '2023-02-14', false, 'A romantic tale of two souls destined to be together against all odds.'),
                                                                                                   (6.90, 105, 30000.00, '2022-11-20', true, 'An animated story about a group of animals embarking on an epic journey.'),
                                                                                                   (7.60, 130, 80000.00, '2023-05-05', false, 'A biography chronicling the life and achievements of a renowned scientist.'),
                                                                                                   (8.10, 145, 11000.00, '2021-10-10', true, 'A war film depicting the bravery and sacrifices of soldiers.'),
                                                                                                   (7.70, 110, 400000.00, '2022-12-01', false, 'A mystery about a detective unraveling a complex case.'),
                                                                                                   (7.40, 115, 6500000.00, '2023-08-15', true, 'A family-friendly fantasy adventure filled with magic and wonder.'),
                                                                                                   (8.40, 140, 1050000.00, '2021-09-30', false, 'A thriller that takes the audience on a rollercoaster of suspense.'),
                                                                                                   (6.70, 100, 2500000.00, '2022-07-07', true, 'A musical comedy that brings laughter and joy to the audience.'),
                                                                                                   (7.20, 125, 5500000.00, '2023-01-20', false, 'A documentary exploring the cultural heritage of an ancient civilization.'),
                                                                                                   (3.50, 11, NULL, '2024-05-15', false, NULL),
                                                                                                   (7.99, 13, NULL, '2021-07-04', true, NULL);

INSERT INTO productions (title, country_id, production_info_id) VALUES
                                                                    ('Lumiere and Company', 21, 1),
                                                                    ('Ask the Dust', 3, 2),
                                                                    ('Vikings', 2, 3),
                                                                    ('Don Juan DeMarco', 29, 4),
                                                                    ('American Me', 3, 5),
                                                                    ('Notes on a Scandal', 23, 6),
                                                                    ('L.A. Without a Map', 49, 7),
                                                                    ('Route Irish', 28, 8),
                                                                    ('Road Diary', 8, 9),
                                                                    ('Sammy and Rosie', 2, 10),
                                                                    ('All American', 26, 11),
                                                                    ('Three Coins in the Fountain', 10, 12),
                                                                    ('The Sword and the Rose', 46, 13),
                                                                    ('My Forbidden Past', 14, 14),
                                                                    ('Survive Style 5+', 14, 15),
                                                                    ('Mirror, The (Zerkalo)', 11, 16),
                                                                    ('Dead & Buried', 38, 17),
                                                                    ('Twelve OClock High', 10, 18),
                                                                    ('Save the Last Dance 2', 4, 19),
                                                                    ('Tomorrow Never Dies', 43, 20),
                                                                    ('Grannies', 20, 21),
                                                                    ('Tea For Two', 22, 22),
                                                                    ('Rolling Thunder', 17, 23),
                                                                    ('Gold Diggers: The Secret of Bear Mountain', 40, 24);


INSERT INTO productions_actors (production_id, actor_id) VALUES
                                                             (1, 15),
                                                             (2, 28),
                                                             (3, 56),
                                                             (4, 132),
                                                             (5, 127),
                                                             (6, 251),
                                                             (7, 180),
                                                             (8, 96),
                                                             (9, 267),
                                                             (10, 61),
                                                             (11, 68),
                                                             (12, 34),
                                                             (13, 152),
                                                             (14, 213),
                                                             (15, 151),
                                                             (16, 218),
                                                             (17, 196),
                                                             (18, 183),
                                                             (19, 297),
                                                             (20, 81),
                                                             (21, 48),
                                                             (22, 118),
                                                             (23, 248),
                                                             (24, 156),
                                                             (1, 234),
                                                             (2, 10),
                                                             (3, 284),
                                                             (4, 206),
                                                             (5, 241),
                                                             (6, 136),
                                                             (7, 110),
                                                             (8, 240),
                                                             (9, 72),
                                                             (10, 244),
                                                             (11, 129),
                                                             (12, 153),
                                                             (13, 54),
                                                             (14, 131),
                                                             (15, 50),
                                                             (16, 184),
                                                             (17, 267),
                                                             (18, 124),
                                                             (19, 40),
                                                             (20, 20),
                                                             (21, 133),
                                                             (22, 159),
                                                             (23, 118),
                                                             (24, 96),
                                                             (1, 23),
                                                             (2, 74),
                                                             (3, 264),
                                                             (4, 21),
                                                             (5, 11),
                                                             (6, 249),
                                                             (7, 138),
                                                             (8, 282),
                                                             (9, 28),
                                                             (10, 273),
                                                             (11, 1),
                                                             (12, 185),
                                                             (13, 198),
                                                             (14, 110),
                                                             (15, 262),
                                                             (16, 272),
                                                             (17, 179),
                                                             (18, 142),
                                                             (19, 126),
                                                             (20, 69),
                                                             (21, 112),
                                                             (22, 151),
                                                             (23, 144),
                                                             (24, 88),
                                                             (1, 44),
                                                             (2, 244),
                                                             (3, 227),
                                                             (4, 164),
                                                             (5, 26),
                                                             (6, 181),
                                                             (7, 144),
                                                             (8, 237),
                                                             (9, 6),
                                                             (10, 130),
                                                             (11, 231),
                                                             (12, 250),
                                                             (13, 101),
                                                             (14, 235),
                                                             (15, 288),
                                                             (16, 45),
                                                             (17, 154),
                                                             (18, 159),
                                                             (19, 16),
                                                             (20, 14),
                                                             (21, 142),
                                                             (22, 276),
                                                             (23, 165),
                                                             (24, 205),
                                                             (1, 138),
                                                             (2, 88),
                                                             (3, 50);

INSERT INTO categories_productions (category_id, production_id) VALUES
                                                                    (6, 1),
                                                                    (21, 2),
                                                                    (20, 3),
                                                                    (8, 4),
                                                                    (12, 5),
                                                                    (17, 6),
                                                                    (3, 7),
                                                                    (15, 8),
                                                                    (7, 9),
                                                                    (2, 10),
                                                                    (19, 11),
                                                                    (9, 12),
                                                                    (15, 13),
                                                                    (17, 14),
                                                                    (8, 15),
                                                                    (5, 16),
                                                                    (24, 17),
                                                                    (22, 18),
                                                                    (23, 19),
                                                                    (1, 20),
                                                                    (13, 21),
                                                                    (10, 22),
                                                                    (18, 23),
                                                                    (11, 24),
                                                                    (4, 1),
                                                                    (7, 2),
                                                                    (6, 3),
                                                                    (2, 4),
                                                                    (9, 5),
                                                                    (3, 6),
                                                                    (20, 7),
                                                                    (11, 8),
                                                                    (1, 9),
                                                                    (13, 10),
                                                                    (15, 11),
                                                                    (12, 12),
                                                                    (4, 13),
                                                                    (5, 14),
                                                                    (14, 15),
                                                                    (21, 16),
                                                                    (10, 17),
                                                                    (9, 18),
                                                                    (18, 19),
                                                                    (8, 20),
                                                                    (19, 21),
                                                                    (17, 22),
                                                                    (16, 23),
                                                                    (6, 24),
                                                                    (7, 1),
                                                                    (11, 2),
                                                                    (22, 3),
                                                                    (23, 4),
                                                                    (16, 5),
                                                                    (1, 6),
                                                                    (24, 7),
                                                                    (19, 8),
                                                                    (13, 9),
                                                                    (17, 10),
                                                                    (22, 11),
                                                                    (10, 12),
                                                                    (20, 13),
                                                                    (14, 14),
                                                                    (12, 15),
                                                                    (8, 16),
                                                                    (9, 17),
                                                                    (18, 18),
                                                                    (21, 19),
                                                                    (6, 20),
                                                                    (15, 21),
                                                                    (5, 22),
                                                                    (2, 23),
                                                                    (3, 24),
                                                                    (16, 1),
                                                                    (4, 2),
                                                                    (14, 3),
                                                                    (11, 4),
                                                                    (19, 5),
                                                                    (21, 6),
                                                                    (18, 8),
                                                                    (8, 9),
                                                                    (15, 10),
                                                                    (6, 11),
                                                                    (24, 12),
                                                                    (10, 13),
                                                                    (22, 15),
                                                                    (1, 16),
                                                                    (5, 17),
                                                                    (13, 18),
                                                                    (3, 19),
                                                                    (9, 20),
                                                                    (7, 21),
                                                                    (2, 22),
                                                                    (23, 23),
                                                                    (14, 24);

-----------------------------------------

INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id) 
SELECT 
    reverse(first_name) as first_name,
    reverse(last_name) as last_name,
    birthdate - INTERVAL '2 days' as birthdate,
    CASE
        WHEN height IS NOT NULL THEN height + 10
        ELSE 10
    END as height,
    country_id as awards,
    (SELECT id FROM countries WHERE name = 'Armenia') as country_id
FROM actors
WHERE id BETWEEN 10 AND 20;

-----------------------------------------------

UPDATE productions_info SET
duration = duration +
           CASE
               WHEN id < 15 THEN 15
               WHEN id >= 20 THEN 20
               ELSE 0
           END
WHERE synopsis IS NULL;


--------------------------------------------------

DELETE FROM countries
WHERE id NOT IN (
    select DISTINCT actors.country_id
    FROM actors FULL JOIN productions USING (country_id)
);

------------------------------------------------------

SELECT
    id,
    name,
    continent,
    currency
FROM countries
WHERE continent = 'South America'
AND (currency LIKE ('P%') OR currency LIKE ('U%'))
ORDER BY currency DESC ;


--------------------------------------------------

SELECT
    p.id,
    title,
    duration,
    round(budget, 1) as budget,
    to_char(release_date, 'MM-YY') as release_date
FROM productions p
    JOIN productions_info pi ON p.production_info_id = pi.id
WHERE
    extract(YEAR FROM release_date) IN (2023, 2024)
AND
    budget > 1500000.00
ORDER BY budget, duration DESC , id
LIMIT 3;


---------------------------------------------

SELECT
    concat(first_name, ' ', last_name) as full_name,
    concat(lower(left(first_name, 1)), right(last_name, 2), length(last_name), '@sm-cast.com') as email,
    awards
FROM actors a LEFT JOIN productions_actors pa ON a.id = pa.actor_id
WHERE production_id IS NULL
ORDER BY awards DESC , id;


------------------------------------------------


SELECT
    name as country_name,
    count(production_info_id) as productions_count,
    coalesce(avg(budget), 0) as avg_budget
FROM countries c
    JOIN productions p ON c.id = p.country_id
        JOIN productions_info pi ON p.production_info_id = pi.id
GROUP BY name
HAVING count(production_info_id) >= 1
ORDER BY productions_count DESC , country_name;

-------------------------------------------------


SELECT
    title,
    CASE
        WHEN rating <= 3.50 THEN 'poor'
        WHEN rating <= 8.00 THEN 'good'
        ELSE 'excellent'
    END as rating,
    CASE
        WHEN has_subtitles THEN 'Bulgarian'
        ELSE 'N/A'
    END as subtitles,
    count(pa.actor_id) as actors_count
FROM productions p
    JOIN productions_info pi ON p.production_info_id = pi.id
        JOIN productions_actors pa ON p.id = pa.production_id
GROUP BY title, rating, has_subtitles
ORDER BY rating , actors_count DESC , title;

--------------------------------------------------

CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS varchar AS
$$
    DECLARE result varchar;

    BEGIN

        SELECT
            count(*)
        FROM categories_productions cp
            JOIN categories c ON c.id = cp.category_id
        WHERE c.name = category_name INTO result;


    RETURN format('Found %s productions.', result);

    END
$$

LANGUAGE plpgsql;


--------------------------------------------

CREATE OR REPLACE PROCEDURE udp_awarded_production (production_title VARCHAR(70))

AS
$$
    --DECLARE
    BEGIN
        IF exists(
            SELECT production_title
            FROM productions p)
        THEN
            UPDATE actors
            SET awards = awards + 1
            WHERE id IN (
                SELECT
                    actor_id
                FROM productions_actors pa
                    JOIN productions pr ON pa.production_id = pr.id
                WHERE pr.title = production_title);
        END IF;
    END

$$
LANGUAGE plpgsql;