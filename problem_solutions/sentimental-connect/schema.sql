CREATE DATABASE `linkedin`;
USE `linkedin`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM(`primary`, `secondary`, `higher_education`),
    `location` VARCHAR(255) NOT NULL,
    `foundation_year` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `industry` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `user_to_user` (
    `id` INT AUTO_INCREMENT,
    `followed_id` INT,
    `follower_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`followed_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`),
    CONSTRAINT `unique_connection_1` UNIQUE (`followed_id`, `follower_id`)
);

CREATE TABLE `user_to_school` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start_affiliation_date` DATE,
    `end_affiliation_date` DATE,
    `degree_type` ENUM(`BA`, `MA`, `PhD`)
    PRIMARY KEY (`id`)
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
    CONSTRAINT `unique_connection_2` UNIQUE (`user_id`, `school_id`)
);

CREATE TABLE `user_to_company` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_affiliation_date` DATE,
    `end_affiliation_date` DATE,
    PRIMARY KEY (`id`)
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
    CONSTRAINT `unique_connection_3` UNIQUE (`user_id`, `company_id`)
);
