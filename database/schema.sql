CREATE TABLE books (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  label_id INTEGER REFERENCES labels(id),
  items ARRAY
);

CREATE TABLE labels (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100),
  items ARRAY
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  items ARRAY
);

CREATE TABLE Game(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    multiplayer VARCHAR(100),
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    author_id INT REFERENCES Author(id),
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genre(id),
    items ARRAY
);

CREATE TABLE album (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  items ARRAY
);

CREATE TABLE genre (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150),
  items ARRAY
);