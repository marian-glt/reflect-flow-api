CREATE DATABASE IF NOT EXISTS dbo;
USE dbo;

CREATE TABLE IF NOT EXISTS users (
	user_id CHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    cognito_id CHAR(36),
    name VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_profiles (
	profile_id CHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    user_id CHAR(36) UNIQUE,
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,


    CONSTRAINT fk_user_profiles_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_user_profiles_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS notes (
	note_id CHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    title VARCHAR(50),
    content VARCHAR(1000),
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_notes_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_notes_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS clocks (
	clock_id CHAR(36) PRIMARY KEY,
    started_on DATETIME,
    ended_on DATETIME,
    completed BOOLEAN GENERATED ALWAYS AS (
        TIMESTAMPDIFF(MINUTE, started_on, ended_on) >= 30
    ) STORED,
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_clocks_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_clocks_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS quotes (
	quote_id CHAR(36) PRIMARY KEY,
    author VARCHAR(50),
    quote VARCHAR(1000),
	created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_quotes_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_quotes_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS emotions (
	emotion_id CHAR(36) PRIMARY KEY,
    name VARCHAR(25),
    color CHAR(7),
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_emotions_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_emotions_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS mood_recordings(
	mood_recording_id CHAR(36) PRIMARY KEY,
    emotion_id CHAR(36),
    recorded_at DATETIME,
    created_by CHAR(36),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_by CHAR(36),
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_mood_recordings_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
    CONSTRAINT fk_mood_recordings_modified_by FOREIGN KEY (modified_by) REFERENCES users(user_id)
);