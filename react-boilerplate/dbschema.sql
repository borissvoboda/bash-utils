-- schema.sql
CREATE TABLE roles (
    role_id INTEGER PRIMARY KEY,
    role_name TEXT NOT NULL UNIQUE
);

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    role_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE articles (
    article_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    author_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);

-- Insert mock data into roles
INSERT INTO roles (role_name) VALUES 
    ('admin'),
    ('editor'),
    ('viewer');

-- Insert mock data into users
INSERT INTO users (username, email, role_id) VALUES 
    ('alice', 'alice@example.com', 1), -- admin
    ('bob', 'bob@example.com', 2),   -- editor
    ('charlie', 'charlie@example.com', 2), -- editor
    ('dave', 'dave@example.com', 3); -- viewer

-- Insert mock data into articles
INSERT INTO articles (title, content, author_id) VALUES 
    ('Welcome to the Blog', 'This is the first article on our platform!', 1), -- Alice
    ('SQLite Tips', 'Learn how to optimize your SQLite database.', 2), -- Bob
    ('Tech Trends 2025', 'A look at upcoming technology trends.', 2), -- Bob
    ('My First Post', 'Just getting started with blogging!', 3); -- Charlie