# meta-dbe-capstone-project
The capstone project to the Meta Database Engineer Certificate to design and create a restaurant database, booking, and reporting system.

## directory structure
- diagram_charts contains images of the ERD for the MySQL database and different data visualisations created in Tableau
- sql_statements contains the SQL used to create the database, load sample data into the database, and create stored procedures
- db_client_connect.py is the python file used for the client connector to the database
- MetaDatabaseEngineerCapstoneSampleData.csv is a sample dataset of customer orders used to create charts in Tableau

## getting started
This project requires the below be installed:
- `mysql 8.0` to run the database server
- `mysql-python-connector` to connect to the database through the python client

## about the project
The purpose of this project was to create a database and client for the fictional Little Lemon restaurant, in an effort to demonstrate the
ability to apply the skills and technologies learned in the certificate course. This involved the designing and composing of a database solution
to apply a real-world scenario.

The project demonstrates the ability to use the tools and software:
- Git
- MySQL and MySQL Workbench
- Tableau,
- Python

To accomplish the tasks of:
- Design and setup a relational database system to satisfy specified business requirements
- Create sql views, stored procedures, and prepared statements to add sales reporting and table booking functionality
- Create a dataabse client to connect to the database through a front-end application
- Work with Tableau to provide data analytics and visualisations

To complete the project, demonstrate knowledge of the tools and software, and accomplish the required tasks the below steps were taken.

### create the project environment and database
To start the project, the requirements were outlined, an environment created, and a database designed and implemented. This involved:
- Setting up a repositiory
- Setting up a MySQL instance server in MySQL Workbench
- Creating and implementing an ERD data model
- Forward engineering the ERD to create the database schema

### create sales reports and booking system
Next was to continue by adding sales reports and creating a table booking system to help the theoretical Little Lemon restaurant manage the database:
- Create a virtual table to summarize sales
- Create optimized queries using stored procedures and prepared statements
- Testing SQL queries

### creating a database client
This involved creating a database client using Python to implement functions to query the database
- Used the my-sql-connector library to create connection
- Cursor object

### create data visualisations in Tableau
The final step was setting up a Tableau Workspace to create interactive charts and a dashboard to present Little Lemon’s sales and profits for analysis.
