CREATE TABLE IF NOT EXISTS objects (
    obj_id SERIAL PRIMARY KEY,
    obj_name VARCHAR(100) NOT NULL,
    obj_description TEXT NOT NULL,
    obj_color VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS videograms (
    vid_id SERIAL PRIMARY KEY,
    vid_name VARCHAR(100) NOT NULL,
    vid_date_of_creation TIMESTAMP NOT NULL,
    vid_content BYTEA NOT NULL
);

CREATE TABLE IF NOT EXISTS objects_in_videograms (
    obj_in_vid_id SERIAL PRIMARY KEY,
    obj_id INT NOT NULL REFERENCES objects(OBJ_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS users (
    usr_id SERIAL PRIMARY KEY,
    usr_name VARCHAR(100) NOT NULL,
    usr_surname VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS messages (
    msg_id SERIAL PRIMARY KEY,
    msg_sender INT NOT NULL REFERENCES users(USR_ID) ON DELETE CASCADE,
    msg_recipient INT NOT NULL REFERENCES users(USR_ID) ON DELETE CASCADE,
    msg_date_send TIMESTAMP NOT NULL,
    msg_text_content TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS videograms_in_messages (
    vid_in_msg_id SERIAL PRIMARY KEY,
    vid_id INT NOT NULL REFERENCES videograms(VID_ID) ON DELETE CASCADE,
    msg_id INT NOT NULL REFERENCES messages(MSG_ID) ON DELETE CASCADE
);
