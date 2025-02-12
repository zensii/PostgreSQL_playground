CREATE TABLE owners(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(50) NOT NULL ,
    phone_number varchar(15) NOT NULL ,
    address varchar(50)
);

CREATE TABLE animal_types(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    animal_type varchar(30) NOT NULL
);

CREATE TABLE cages(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    animal_type_id int REFERENCES animal_types on DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE animals(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(30) NOT NULL ,
    birthdate DATE NOT NULL ,
    owner_id int REFERENCES owners ON DELETE CASCADE ON UPDATE CASCADE,
    animal_type_id int REFERENCES animal_types ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE volunteers_departments(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    department_name varchar(30) NOT NULL
);

CREATE TABLE volunteers(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(50) NOT NULL ,
    phone_number varchar(15) NOT NULL ,
    address varchar(50),
    animal_id int REFERENCES animals ON DELETE CASCADE on UPDATE CASCADE,
    department_id int REFERENCES volunteers_departments on DELETE CASCADE on UPDATE CASCADE NOT NULL
);

CREATE TABLE animals_cages(
    cage_id int REFERENCES cages on DELETE CASCADE on UPDATE CASCADE NOT NULL ,
    animal_id int REFERENCES animals ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

----------------------------

INSERT INTO owners (
    "name", phone_number, address
)
VALUES
    ('Georgi Georgiev', '0883456586', 'Sofia, 2 Zdrave str.'),
    ('Petur Petrov', '0897635645', 'Varna, 5 Dragoman str.'),
    ('Gergana Mancheva', '0897412123', 'Gabrovo, 21 Vasil Levski str.'),
    ('Kaloqn Stoqnov', '0878325642', NULL),
    ('Stamat Kostov', '0857231001', 'Plovdiv'),
    ('Milena Dragomirova', '0876542123', 'Sofia, 213 Pirin str.'),
    ('Kiril Peshev', '0838654111', 'Sliven, 54 Struma str.'),
    ('Krasen Lyubenov', '0788120333', 'Stara Zagora, 2 Trakia str.'),
    ('Martin Genchev', '0899452325', 'Varna, 45 Devnya str.'),
    ('Kamelia Yancheva', '0876213799', 'Burgas, 21 Alexandrovska str.'),
    ('Metodi Dimitrov', '0894568889', NULL),
    ('Matei Kirilov', '0978235641', 'Kalofer, 2 Mladost str.'),
    ('Dobrin Krustev', '0978235641', 'Blagoevgrad, 2 Akacia str.'),
    ('Kaloyan Dobrev', '0896523145', 'Gorna Oryahovitsa, 12 Angel Georgiev str.'),
    ('Miroslav Kirilov', '0874563214', 'Sofia, 156 Mladost str.'),
    ('Krasen Stoyanov', '0896333258', 'Plovdiv, 18 Baba Tonka str.'),
    ('Bozhidara Stoicheva', '0874569123', 'Provadia, 1 Buk str.'),
    ('Petya Dobreva', '0874547896', 'Varna, 65 Vihren str.'),
    ('Kristina Kirova', '0888655632', 'Varna, 118 General Kolev str.'),
    ('Mila Sotirova', '0877456222', 'Burgas, 15 Glarus str.'),
    ('Grigor Litov', '0899366584', 'Sofia, 35 Detelina str.'),
    ('Karolina Dukova', '0894562123', 'Sliven, 8 Dobrotitsa str.'),
    ('Ivan Fotinov', '0879654125', 'Petrich, 9 Zora str.'),
    ('Anelia Mihova', '0897856147', 'Varna, 29 Dunav str.'),
    ('Stanislav Peshev', '0889699599', 'Sofia, 22 Karamfil str.'),
    ('Borislava Kamenova', '0877477112', 'Burgas, 15 Marek str.');


INSERT INTO animal_types (
    animal_type
)
VALUES
    ('Mammals'),
    ('Fish'),
    ('Birds'),
    ('Reptiles'),
    ('Amphibians'),
    ('Invertebrates');


INSERT INTO cages (
    animal_type_id
)
VALUES
    (2),
    (3),
    (6),
    (2),
    (4),
    (3),
    (1),
    (5),
    (5),
    (2),
    (4),
    (5),
    (5),
    (6),
    (1),
    (1),
    (2),
    (2),
    (3),
    (4),
    (1),
    (6),
    (4),
    (4),
    (2),
    (1),
    (1),
    (4),
    (3),
    (5),
    (4),
    (1),
    (3),
    (1),
    (5),
    (3),
    (1),
    (1),
    (3),
    (5),
    (1),
    (2),
    (5),
    (4),
    (3),
    (3),
    (2),
    (1),
    (1),
    (5),
    (4),
    (1),
    (4),
    (2),
    (3);


INSERT INTO animals (
    "name", birthdate, owner_id, animal_type_id
)
VALUES
    ('Brown bear', '2017-07-17', 3, 1),
    ('Chimpanzee', '2010-01-21', 6, 1),
    ('Chinchilla', '2019-11-01', 11, 1),
    ('Elephant', '2009-05-18', 4, 1),
    ('Lion', '2018-06-28', 10, 1),
    ('Rhinoceros', '2011-12-24', 2, 1),
    ('Wolf', '2018-03-09', 7, 1),
    ('Leopard', '2017-04-17', 4, 1),
    ('Fennec Fox', '2015-09-10', 26, 1),
    ('Giant Panda', '2021-11-11', 18, 1),
    ('Hippo', '2017-09-07', NULL, 1),
    ('Koala', '2018-06-30', 24, 1),
    ('Pumpkinseed Sunfish', '2020-11-04', 10, 2),
    ('Banded Archer Fish', '2022-01-15', NULL, 2),
    ('Cichlid', '2021-01-21', 5, 2),
    ('Koi', '2021-07-05', NULL, 2),
    ('West African Lungfish', '2019-10-17', 4, 2),
    ('Leopard Shark', '2018-02-16', 16, 2),
    ('Tufted Puffin', '2017-10-31', 8, 3),
    ('Saddlebill Stork', '2019-08-21', NULL, 3),
    ('Ostrich', '2016-05-02', 4, 3),
    ('Bald Eagle', '2014-06-29', 12, 3),
    ('Swan Goose', '2018-11-12', 9, 3),
    ('Northern Pintail Duck', '2019-02-15', 6, 3),
    ('African Penguin', '2017-07-17', NULL, 3),
    ('American Kestrel', '2019-04-27', 18, 3),
    ('California Condor', '2014-12-19', 16, 3),
    ('African Spurred Tortoise', '2009-09-26', 7, 4),
    ('Anaconda', '2016-07-13', 10, 4),
    ('Boa', '2015-08-21', NULL, 4),
    ('Chameleon', '2018-10-07', NULL, 4),
    ('Crocodilian', '2016-01-11', 11, 4),
    ('Iguana', '2019-04-29', 6, 4),
    ('Lizard', '2020-12-02', 7, 4),
    ('Tuatara', '2021-06-18', 14, 4),
    ('Woma Python', '2019-04-26', 19, 4),
    ('Rattlesnake', '2017-12-02', 19, 4),
    ('Goliath Frog', '2020-01-31', NULL, 5),
    ('Poison Frog', '2020-07-13', NULL, 5),
    ('Mantella', '2022-03-21', 9, 5),
    ('Surinam Toad', '2021-06-15', 11, 5),
    ('Axolotl', '2019-01-21', 12, 5),
    ('Panamanian Golden Frog', '2021-09-30', 23, 5),
    ('Desert Hairy Scorpion', '2020-05-13', NULL, 6),
    ('Madagascar Hissing Cockroach', '2021-09-10', 7, 6),
    ('Sunburst Diving Beetle', '2022-01-05', 9, 6);


INSERT INTO volunteers_departments (
    department_name
)
VALUES
    ('Guest engagement'),
    ('Education program assistant'),
    ('Zoo events'),
    ('Animal encounters'),
    ('Interpretive volunteer'),
    ('Keeper aide'),
    ('Animal handler'),
    ('Horticulture');


INSERT INTO volunteers (
    "name", phone_number, address, animal_id, department_id
)
VALUES
    ('Kiril Kostadinov', '0896541233', ' Sofia , 213 Tsarigradsko shose str.', 7, 2),
    ('Boyan Boyanov', '0896321546', 'Plovdiv, 15 Arda str.', 14, 1),
    ('Mariya Petkova', '0874563201', 'Kalofer, 2 Tsar Simeon str.', 4, 3),
    ('Svilen Mitev', '0877300100', NULL, 8, 4),
    ('Dimitrichka Stateva', '0888632123', 'Sofia, 26 Vasil Levski str.', 7, 8),
    ('Anton Antonov', '0877456123', 'Varna, 2 Dobrotitsa str.', 11, 3),
    ('Yanko Totev', '0896369258', 'Sofia, 54 Hristo Botev str.', 1, 2),
    ('Katerina Dimitrova', '0874589665', NULL, 5, 6),
    ('Paskal Shopov', '0888987110', 'Gorna Oryahovitsa, 5 Otez Paisii str.', NULL, 4),
    ('Darina Petrova', '0889654236', 'Sofia, 39 Bratya Buxton str.', 31, 3),
    ('Maya Stoyanova', '0886544444', 'Karlovo, 2 Breza str.', 29, 1),
    ('Svilen Moskov', '0879510023', 'Sofia, 61 Veles str.', 27, 5),
    ('Georgi Georgiev', '0879654456', 'Varna, 23 Devnya str.', 16, 6),
    ('Vasil Vasilev', '0896321023', 'Varna, 2 Elin Pelin str.', NULL, 7),
    ('Krasimira Boyanova', '0879541236', 'Montana, 2 Zora str.', 2, 2),
    ('Teodora Stanoeva', '0887986002', 'Sofia, 37 Iglika str.', 33, 1),
    ('Gabriel Radkov', '0889745102', 'Sliven, 6 Krim str.', 18, 5),
    ('Mihail Boev', '0896336554', 'Tryavna, 21 Loza str.', 11, 2),
    ('Dilyana Stoeva', '0889412025', ' Sofia , 15 Lyulyak str.', NULL, 2),
    ('Yulian Bratoev', '0897665895', 'Varna, 158 Mariya Luiza str.', 16, 1),
    ('Petya Dobreva', '0888541236', 'Ahtopol, 11 Mir str.', 13, 3),
    ('Zdravko Asenov', '0889652365', 'Sofia, 6 Neven str.', 19, 2),
    ('Stefan Lazarov', '0887456215', 'Veliko Turnovo, 54 Odrin str.', 22, 3),
    ('Radoslava Mihailova', '0887456325', 'Plovdiv, 16 Pirin str.', 34, 6);


INSERT INTO animals_cages (
    cage_id, animal_id
)
VALUES
    (1, 13),
    (2, 19),
    (3, 44),
    (5, 32),
    (6, 24),
    (7, 5),
    (8, 41),
    (9, 38),
    (10, 16),
    (11, 28),
    (12, 39),
    (14, 45),
    (15, 7),
    (16, 12),
    (18, 14),
    (19, 26),
    (20, 36),
    (21, 9),
    (22, 46),
    (23, 34),
    (24, 37),
    (26, 1),
    (27, 10),
    (28, 33),
    (29, 20),
    (31, 31),
    (32, 8),
    (33, 27),
    (34, 3),
    (35, 42),
    (36, 22),
    (37, 4),
    (38, 11),
    (39, 21),
    (41, 6),
    (42, 18),
    (43, 40),
    (44, 35),
    (46, 25),
    (47, 15),
    (49, 2),
    (50, 43),
    (51, 30),
    (53, 29),
    (54, 17),
    (55, 23);

------------------------------------------


INSERT INTO volunteers (name, phone_number, address, animal_id, department_id)
VALUES
    ('Anita Kostova', '0896365412', 'Sofia, 5 Rosa str.', 15, 1),
    ('Dimitur Stoev', '0877564223', NULL, 42, 4),
    ('Kalina Evtimova', '0896321112', 'Silistra, 21 Breza str.', 9, 7),
    ('Stoyan Tomov', '0898564100', 'Montana, 1 Bor str.', 18, 8),
    ('Boryana Mileva', '0888112233', NULL, 31, 5);

INSERT INTO animals (name, birthdate, owner_id, animal_type_id)
VALUES
    ('Giraffe', '2018-09-21', 21, 1),
    ('Harpy Eagle', '2015-04-17', 15, 3),
    ('Hamadryas Baboon', '2017-11-02', NULL, 1),
    ('Tuatara', '2021-06-30', 2, 4);
---------------------------
UPDATE
    animals
SET owner_id = (
SELECT
    id
FROM
    owners
WHERE
    name = 'Kaloqn Stoqnov')
WHERE id IN (
SELECT a.id
FROM animals AS a
WHERE owner_id IS NULL) ;
-------------------------------

DELETE FROM volunteers_departments
WHERE department_name = 'Education program assistant';


-------------------------


SELECT
    name,
    phone_number,
    address,
    animal_id,
    department_id
FROM volunteers
ORDER BY name, animal_id, department_id;

-----------------------------------

SELECT
    name,
    animal_type,
    to_char(birthdate, 'DD.MM.YYYY')
FROM animals JOIN animal_types a ON animals.animal_type_id = a.id
ORDER BY name;

--------------------------------

SELECT
    o.name,
    count(*) as count_of_animals
FROM animals JOIN owners o ON o.id = animals.owner_id
GROUP BY o.name
ORDER BY count_of_animals DESC, name
LIMIT 5;

-----------------------------------

SELECT
    concat(owners.name, ' - ', a.name) AS "owners-animals",
    phone_number,
    cage_id
FROM owners
    JOIN animals a ON owners.id = a.owner_id
    JOIN animal_types t ON t.id = a.animal_type_id
    JOIN animals_cages ac ON a.id = ac.animal_id
WHERE animal_type = 'Mammals'
ORDER BY owners.name, a.name DESC ;


-----------------------------------

SELECT
    name as volunteers,
    phone_number,
    trim(replace(replace(address, 'Sofia', ''), ',', '')) as address
FROM volunteers_departments AS vd JOIN volunteers v ON vd.id = v.department_id
WHERE department_name = 'Education program assistant' AND address LIKE '%Sofia%'
ORDER BY name;

-------------------------------------

SELECT
    name,
    date_part('year', birthdate) AS birth_year,
    animal_type
FROM animals a JOIN animal_types t ON a.animal_type_id = t.id
WHERE
    owner_id IS NULL AND animal_type NOT LIKE 'Birds'
AND
    AGE('2022-01-01'::date, birthdate) < INTERVAL '5 years'
ORDER BY name;

--------------------------------------


CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department varchar(30))
RETURNS int AS
$$
    DECLARE count int;
    BEGIN

        SELECT
            count(*) INTO count
        FROM volunteers AS v JOIN volunteers_departments vd ON v.department_id = vd.id
        WHERE department_name = searched_volunteers_department;
    
    RETURN count;
    

    END
$$

LANGUAGE plpgsql;

SELECT fn_get_volunteers_count_from_department('Education program assistant');
SELECT fn_get_volunteers_count_from_department('Guest engagement');

CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name varchar(30),
    OUT result varchar)
AS
$$

    BEGIN

        SELECT
            CASE
                WHEN a.owner_id is NOT NULL THEN o.name
                ELSE 'For adoption'
            END
        FROM animals as a LEFT JOIN owners o ON o.id = a.owner_id
        WHERE a.name = animal_name INTO result;

    END

$$
LANGUAGE plpgsql;

call sp_animals_with_owners_or_not('Pumpkinseed Sunfish', '');
CALL sp_animals_with_owners_or_not('Hippo');
CALL sp_animals_with_owners_or_not('Brown bear');
