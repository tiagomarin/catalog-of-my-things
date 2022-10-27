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