-- Active: 1674046792030@@127.0.0.1@3306


-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM phones;

INSERT INTO users (id, name, email, password)
VALUES("f7ds98", "Tio j", "jufasplug@gmail.com", "dotenis");

INSERT INTO phones (id, phone_number, user_id)
VALUES("p003", "32985226464", "d46as5");

SELECT users.id AS UserID,
        users.name,
        users.email,
        phones.phone_number FROM users
    INNER JOIN phones
    ON phones.user_id = users.id;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO licenses (id, register_number, category)
VALUES("l001", "111", "B"),
("l002", "2222", "B");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES ("d001", "Toretto", "toretto@mustang.com", "bandolero", "l001"),
("d002", "Bryan", "oconnel@nissan.com", "drift", "l002");

SELECT * FROM licenses
INNER JOIN drivers
ON licenses.id = drivers.license_id;

CREATE TABLE spotifyUSer (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    username TEXT UNIQUE NOT NULL,
    playlist TEXT NOT NULL
);

CREATE TABLE playlist (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    songs INTEGER NOT NULL,
    name TEXT NOT NULL,
    owner TEXT UNIQUE NOT NULL,
    FOREIGN KEY (owner) REFERENCES spotifyUSer (username)
);

INSERT INTO spotifyUser (id, username, playlist)
VALUES ("user01", "Lucas", "ChillSongs"),
("user02", "João", "Paredão");

INSERT INTO playlist (id, songs, name, owner)
VALUES ("play01", 8, "Paredão", "Lucas"),
("play02", 10, "ChillSongs", "João") ;

DROP TABLE playlist;

