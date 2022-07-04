DROP SCHEMA IF EXISTS pharmapickup;
CREATE SCHEMA pharmapickup;
USE pharmapickup;

CREATE TABLE patients (
  patient_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  username VARCHAR(32) UNIQUE NOT NULL,
  email VARCHAR (256) NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (patient_id),
) ENGINE INNODB;

CREATE TABLE staff (
  staff_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(32) UNIQUE NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (staff_id),
) ENGINE INNODB;