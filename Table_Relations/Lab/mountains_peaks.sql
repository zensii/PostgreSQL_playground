CREATE TABLE mountains (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(50)
);

create TABLE peaks (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name varchar(50),
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains
                   FOREIGN KEY (mountain_id)
                   REFERENCES mountains(id)
);
