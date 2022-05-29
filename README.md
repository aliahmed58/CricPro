# CricPro
A project for my Data Structures course. Main objective for this project was to use self-implemented data structures like linked list and hash tables. 

## How to run
CricPro runs using the postgresql database "cricpro"

To run the application successfully do the following initial steps:

1. Install Postgres SQL 14
2. Open psql command shell
3. Run `CREATE DATABASE cricpro;`
4. Run `psql -U postgres cricpro < cricpro.sql' To copy the given sql database.`
5. Enter postgres user password.
6. Make sure to set database configurations in "org.example.Database.DataSource.java" file according to your computer;
