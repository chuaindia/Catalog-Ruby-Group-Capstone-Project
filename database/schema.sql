CREATE TABLE books (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  label_id INTEGER REFERENCES labels(id)
);

CREATE TABLE labels (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
  items ARRAY
);

CREATE TABLE album (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  on_spotify BOOLEAN
  publish_date DATE
);

CREATE TABLE genre (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150)
);