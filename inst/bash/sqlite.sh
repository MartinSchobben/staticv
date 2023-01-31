#!/bin/bash
sqlite3 << 'END_SQL'
.open 'CV_db.sqlite'
.nullvalue NULL
.headers on
.mode column
END_SQL
