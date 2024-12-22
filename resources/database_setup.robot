*** Settings ***
Library           DatabaseLibrary
Resource          variables.robot

*** Keywords ***
Connect To Test Database
    [Documentation]    Connects to the database using variables from variables.robot
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Disconnect From Test Database
    [Documentation]    Disconnects from the current database connection
    Disconnect From Database

# Custom Keywords for Database Operations
Verify Database Connection
    [Documentation]    Verifies that the database connection is active
    ${status}=    Run Keyword And Return Status    Execute SQL String    SELECT 1;
    Should Be True    ${status}    Database connection failed!

Clean Database Connection
    [Documentation]    Safely disconnects from database even if connection failed
    ${status}=    Run Keyword And Return Status    Disconnect From Database
    Run Keyword If    not ${status}    Log    Warning: Database was already disconnected    WARN

# Transaction Keywords
Start Transaction
    [Documentation]    Starts a new database transaction
    Execute SQL String    START TRANSACTION;

Rollback Transaction
    [Documentation]    Rolls back the current transaction
    Execute SQL String    ROLLBACK;

Commit Transaction
    [Documentation]    Commits the current transaction
    Execute SQL String    COMMIT; 