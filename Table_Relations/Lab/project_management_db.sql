CREATE TABLE clients(
    id serial PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE projects(
     id serial PRIMARY KEY,
     client_id int, --REFERENCES clients(id), to be added later to avoid circular reference
     project_lead int --REFERENCES employees(id), to be added later to avoid circular reference
);

CREATE TABLE employees(
      id serial PRIMARY KEY,
      first_name varchar(30),
      last_name varchar(30),
      project_id int REFERENCES projects(id)  -- syntax for directly assigning a foreign key
                                              -- during table creation
);


ALTER TABLE projects
    ADD FOREIGN KEY (client_id) references clients(id), -- short syntax without giving name to the constraint
    ADD CONSTRAINT fk_project_lead  -- syntax for providing specific name for the constraint
        FOREIGN KEY (project_lead) REFERENCES employees(id);
