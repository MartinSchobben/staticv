#!/bin/bash
sqlite3 << 'END_SQL'
.open 'CV_db.sqlite'
.nullvalue NULL
.headers on
.mode column

CREATE TABLE education(
   begin          TEXT,
   end            TEXT,
   place          TEXT,
   title          TEXT,
   type           TEXT,
   degree         TEXT,
   lang           TEXT
);

CREATE TABLE experience(
   begin          TEXT,
   end            TEXT,
   position       TEXT,
   place          TEXT,
   description    TEXT,
   lang           TEXT
);

CREATE TABLE skills(
   skill          TEXT,
   item           TEXT,
   lang           TEXT
);
END_SQL
