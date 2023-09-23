CREATE TABLE IF NOT EXISTS objects (
    OBJ_ID integer PRIMARY KEY,
    OBJ_NAME varchar(100) NOT NULL,
    OBJ_DESCRIPTION text NOT NULL,
    OBJ_COLOR varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS videograms (
    VID_ID integer PRIMARY KEY,
    VID_NAME varchar(100) NOT NULL,
    VID_DATE_OF_CREATION timestamp NOT NULL,
    VID_CONTENT bytea NOT NULL
);

CREATE TABLE IF NOT EXISTS objects_in_videograms (
    OBJ_IN_VID_ID integer PRIMARY KEY,
    OBJ_ID integer REFERENCES OBJECTS(OBJ_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS users (
    USR_ID integer PRIMARY KEY,
    USR_NAME varchar(100) NOT NULL,
    USR_SURNAME varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS messages (
    MSG_ID integer PRIMARY KEY,
    MSG_SENDER integer REFERENCES USERS(USR_ID) ON DELETE CASCADE,
    MSG_RECIPIENT integer REFERENCES USERS(USR_ID) ON DELETE CASCADE,
    MSG_DATE_SEND timestamp NOT NULL,
    MSG_TEXT_CONTENT text NOT NULL
);

CREATE TABLE IF NOT EXISTS videograms_in_messages (
    VID_IN_MSG_ID integer PRIMARY KEY,
    VID_ID integer REFERENCES VIDEOGRAMS(VID_ID) ON DELETE CASCADE,
    MSG_ID integer REFERENCES MESSAGES(MSG_ID) ON DELETE CASCADE
);
