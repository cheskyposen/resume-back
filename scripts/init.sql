-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE users (
    uid INTEGER PRIMARY KEY AUTOINCREMENT,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL
);

create table country (
    cid INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL UNIQUE,
    code VARCHAR NOT NULL UNIQUE
);

create table province(
    pid INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    code VARCHAR UNIQUE NOT NULL,
    country INTEGER NOT NULL,
    foreign key (country) references country(cid)
);

create table cities(
    cid INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    province INTEGER NOT NULL,
    foreign key (province) references province(pid)
);

create table addresses(
    aid INTEGER PRIMARY KEY AUTOINCREMENT,
    number VARCHAR not null,
    street VARCHAR not null,
    apt VARCHAR,
    city integer not null,
    foreign key (city) references cities(cid)
);

create table  contact (
  cid INTEGER PRIMARY KEY AUTOINCREMENT,
  uid INTEGER UNIQUE NOT NULL,
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  address INTEGER UNIQUE,
  website VARCHAR,
  links VARCHAR,
  position VARCHAR,
  foreign key (uid) REFERENCES users(uid),
  foreign key (address) REFERENCES addresses(aid)
);

create table skills(
    sid INTEGER PRIMARY KEY AUTOINCREMENT,
    skill varchar not null,
    user INTEGER not null,
    foreign key (user) references users(uid)
);

create table projects(
    pid INTEGER PRIMARY KEY AUTOINCREMENT,
    title varchar not null,
    tech varchar not null,
    description varchar,
    user INTEGER not null,
    foreign key (user) references users(uid)
);

create table employment(
    eid INTEGER PRIMARY KEY AUTOINCREMENT,
    user INTEGER not null,
    employer not null,
    start varchar not null,
    end varchar,
    position varchar not null,
    duties varchar,
    foreign key (user) references users(uid)
);

create table education(
    eid INTEGER PRIMARY KEY AUTOINCREMENT,
    user INTEGER not null,
    level varchar not null,
    school varchar not null,
    completed varchar not null,
    foreign key (user) references users(uid)
);
