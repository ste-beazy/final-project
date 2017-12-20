DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS friend_requests;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS images;

CREATE TABLE users (
  id serial primary key,
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  email varchar(255) NOT NULL UNIQUE,
  hashed_pass varchar(255),
  profile_pic text,
  cover_photo text,
  bio text,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE friend_requests (
  id serial primary key,
  sender_id integer,
  recipient_id integer,
  status integer,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE chat (
  id serial primary key,
  sender_id integer,
  message text,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  recipient_id integer
);

CREATE TABLE images (
  image_id serial primary key,
  user_id integer,
  image_url text,
  title varchar(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
  commenter_id integer,
  image_id integer,
  comment text,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_info (
  id serial primary key,
  user_id integer,
  socket_id text,
  user_agent varchar(255),
  remote_address varchar(255),
  accessed_at varchar(255),
  left_at varchar(255)
);