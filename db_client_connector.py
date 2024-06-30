import os
import mysql.connector as connector
from mysql.connector import errorcode
from dotenv import load_dotenv, dotenv_values

# load the database connection variables from the env file
load_dotenv()
user = os.getenv("db_user")
password = os.getenv("db_password")
host = os.getenv("db_host")
database = os.getenv("db_database")

# try to create connection to the database
try:
    print("Trying to create database connection")
    
    cnx = connector.connect(
        user = user,
        password = password,
        host = host,
        database = database
    )
    
    print("Connection established")

# if an error occurs print it to the terminal
except errorcode as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
        
# try to create a cursor object
try:
    # create the cursor object
    cursor = cnx.cursor()
    print("Cursor object created")
    
    # set the database to use
    cursor.execute(f"USE {database}")
    print(f"All set to use to {database} for queries")
    
# if an error occurs print it to the terminal
except errorcode as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)

# test query the database to see tables
try:
    show_tables_query = "SHOW tables" 
    cursor.execute(show_tables_query)
    results = cursor.fetchall()
    print(f"Tables found in {database}:")
    for result in results:
        print(result)

except errorcode as err:
    print(err)
    
# query the needed customer and order data from the database
print("Querying the database for customers with orders > $60")
with cursor as cursor:
    # choose a dollar amount to filter orders by
    dollar_amt = 60
    
    # create the sql statement to use to query needed info
    sql_stmt = f"""
    SELECT 
    CONCAT(customers.first_name, ' ', customers.last_name) AS FullName,
    customers.email AS Email,
    customers.phone AS PhoneNumber,
    orders.order_total AS OrderTotal
    FROM customers
    INNER JOIN
    orders
    ON
    customers.customer_id = orders.customer_id
    WHERE
    orders.order_total > {dollar_amt};
    """
    
    # execute the sql with the cursor
    cursor.execute(sql_stmt)
    results = cursor.fetchall()
    columns = cursor.column_names
    
    # check that there are orders > $60 if not tell the user
    if len(results) == 0:
        print (f"No customers with orders over ${dollar_amt} - choose a different value")
    
    # print the results for the user to see
    else:
        print(columns)
        for result in results:
            print(result)

# make sure the connection to the database is closed just in case
try:
    cnx.close()
    print("Connection closed")
    
except:
    print("Connection already closed")
    pass