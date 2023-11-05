-- Active: 1699168707851@@norman-db-5th.c34leeujbawn.ap-northeast-2.rds.amazonaws.com@3306@umc_5th_workbook
CREATE TABLE member (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender BOOLEAN NOT NULL,
    birth DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    status BOOLEAN NOT NULL,
    inactive_date DATETIME(6),
    mail VARCHAR(50) NOT NULL,
    nickname VARCHAR(15) NOT NULL UNIQUE,
    phone_num VARCHAR(15) NOT NULL,
    phone_confirm BOOLEAN NOT NULL,
    mission_clear_num INT NOT NULL DEFAULT 0,
    points INT NOT NULL DEFAULT 0
);

CREATE TABLE agree_terms (
    term_id BIGINT NOT NULL,
    member_id BIGINT NOT NULL,
    agree BOOLEAN NOT NULl,
    agree_date DATETIME(6) NOT NULL,
    FOREIGN KEY (term_id) REFERENCES terms(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE terms (
    id BIGINT NOT NULL PRIMARY KEY,
    terms_name VARCHAR(50) NOT NULL,
    contents TEXT,
    essential BOOLEAN NOT NULL
);

CREATE TABLE point_info (
    member_id BIGINT NOT NULL,
    point_variation BOOLEAN NOT NULL,
    point_body TEXT,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE food_type (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(30) NOT NULL
);

CREATE TABLE member_prefer (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT NOT NULL,
    food_id BIGINT NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (food_id) REFERENCES food_type(id)
);

CREATE TABLE region (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100)
);

CREATE TABLE restaurants (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    food_type_id BIGINT NOT NULL,
    region_id BIGINT NOT NULL,
    restaurant_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    open_time TIME,
    close_time TIME,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    FOREIGN KEY (food_type_id) REFERENCES food_type(id),
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE missions (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    restaurant_id BIGINT NOT NULL,
    region_id BIGINT NOT NULL,
    point INT NOT NULL,
    body TEXT,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE member_missions (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT NOT NULL,
    mission_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    mission_status BOOLEAN NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (mission_id) REFERENCES missions(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE reviews (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    body TEXT NOT NULL,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    member_id_nickname VARCHAR(15) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE image_review (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    review_id BIGINT NOT NULL,
    image_url VARCHAR(150) NOT NULL,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    FOREIGN KEY (review_id) REFERENCES reviews(id)
);
