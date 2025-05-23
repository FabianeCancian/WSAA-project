CREATE DATABASE news;


CREATE TABLE sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_id INT,
    author VARCHAR(255),
    title TEXT,
    description TEXT,
    url TEXT,
    urlToImage TEXT,
    publishedAt DATETIME,
    content LONGTEXT,
    FOREIGN KEY (source_id) REFERENCES sources(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
