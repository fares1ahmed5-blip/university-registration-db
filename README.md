# University Registration Database (Oracle SQL)

A relational schema for a university course-registration system, written in Oracle SQL.

## What it contains
Seven tables with primary keys, foreign keys and CHECK constraints:
`FACULTY`, `MAJOR`, `COURSE`, `INSTRUCTOR`, `STUDENT`, `SECTION`, `TRANSCRIPT`, plus sample `INSERT` data for each.

## Tools
Oracle SQL / PL-SQL dialect (`number`, `varchar2`, `DATE`).

## How to run
1. Open Oracle SQL Developer, SQL*Plus, or Oracle Live SQL.
2. Run `university_db.sql` as a script (F5 in SQL Developer).

## Known issues in the sample data
- One `SECTION` row has the weekday typed as `Frida` instead of `Friday`.
- The `TRANSCRIPT` row for student 1008 refers to course `ART102`, which is not in `COURSE`, so that insert violates a foreign key.
