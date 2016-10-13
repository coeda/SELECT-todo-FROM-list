\c caseyoeda;

DROP user IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id serial NOT NULL,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone  NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT false,
  PRIMARY KEY (id)
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks(title, description) VALUES('Study SQL', 'Complete this exercise');
INSERT INTO tasks(title, description) VALUES('Study PostgreSQL', 'Read all the documentation');

SELECT * FROM tasks WHERE completed_at is NULL;

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study PostgreSQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;
SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks(title, description) VALUES('mistake 1', 'a test entry');
INSERT INTO tasks(title, description) VALUES('mistake 2', 'a test entry');
INSERT INTO tasks(title, description) VALUES('third mistake', 'a test entry');

SELECT * FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks where title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks where title like '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;