/*+----------------------------------------------------------------+*/
/*|---------------------------- GIFTER ----------------------------|*/
/*|------------------------ Data Structure ------------------------|*/
/*+----------------------------------------------------------------+*/

/*//--- Database for structuring the GIFTER app information.*/
/*//--- Requests about profile and all app content will be made with this DB.*/

/*//--- Create and use database*/
CREATE DATABASE IF NOT EXISTS gifter_data_structure;
USE gifter_data_structure;

/*//--- User Personal Info */
/*
- User
- Name
- Birth
- email
- Password
- Phone
- Gender
*/

CREATE TABLE IF NOT EXISTS iPersonal(
	username varchar(30) not null,
   fname varchar(20) not null,
   lname varchar(20) not null,
   birth date not null,
   email varchar(320) not null,
   pass varchar(66) not null,
   phone varchar(13),
   gender enum('Male','Female','Helicopter','Horse','Other') not null,
	PRIMARY KEY (username)
)engine = InnoDB default charset = utf8;

/*//--- Profile Info */
/*
- Profile Photo
- Bio
- Unboxes
- Gift List
- Posts
*/

/*//--- Profile Genaral Info*/
CREATE TABLE IF NOT EXISTS iProfile(
	id int not null auto_increment,
	profile_id varchar(30) not null,
   bio varchar(256),
   PRIMARY KEY (id),
   FOREIGN KEY (profile_id) REFERENCES iPersonal(username)
)engine = InnoDB default charset = utf8;


/*//--- Profile Unboxes*/
CREATE TABLE IF NOT EXISTS unboxes(
	id int not null auto_increment,
	profile_id varchar(30) not null,
   title varchar(20),
   content blob not null,
   PRIMARY KEY (id),
   FOREIGN KEY (profile_id) REFERENCES iPersonal(username)
);


/*//--- Profile Gift List*/
CREATE TABLE IF NOT EXISTS gift_list(
	id int not null auto_increment,
	profile_id varchar(30) not null,
   title varchar(20) not null,
   description varchar(256),
   content blob not null,
   PRIMARY KEY (id),
   FOREIGN KEY (profile_id) REFERENCES iPersonal(username)
);


/*//--- Profile Posts*/
CREATE TABLE IF NOT EXISTS posts(
	id int not null auto_increment,
	profile_id varchar(30) not null,
   content blob not null,
   caption varchar(256),
   PRIMARY KEY (id),
   FOREIGN KEY (profile_id) REFERENCES iPersonal(username)
);


