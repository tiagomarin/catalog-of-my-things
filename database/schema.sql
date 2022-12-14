CREATE TABLE sources(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE movies(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    silent BOOLEAN,
    sources_ids INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_sources FOREIGN KEY(sources_ids) REFERENCES sources(id)
);

CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(30),
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    cover_state VARCHAR(50),
    publisher VARCHAR(80),
    labels_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_labels FOREIGN KEY(labels_id) REFERENCES labels(id)
);
CREATE INDEX book_label_idx ON books(labels_id);

CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE genres(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50)
    PRIMARY KEY(id)
)

CREATE TABLE music_albums(
    id INT GENERATED ALWAYS AS IDENTITY
    title VARCHAR(100)
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id)
)

CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name   VARCHAR(100),
    PRIMARY KEY(id)
)

CREATE TABLE game(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    author_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES authors(id)
)
