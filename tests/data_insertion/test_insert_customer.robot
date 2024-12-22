*** Settings ***
Library    DatabaseLibrary
Library    libraries.application_code_library.ApplicationCodeLibrary
Resource   ../common/variables.robot   # (Optional) If you have a shared variables file

*** Variables ***
${DB_HOST}       localhost
${DB_PORT}       3306
${DB_NAME}       test_db
${DB_USER}       amir_user
${DB_PASS}       amir_adam_pwd

*** Test Cases ***
Insert A New Customer And Verify
    # Connect using DatabaseLibrary
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    port=${DB_PORT}

    # Insert data using the application code library method
    ${new_id}=    Insert Customer    John    Wick    john.wick@example.com    555-123-4567

    # Verify insertion with direct SQL
    ${rows}=      Query    SELECT first_name, last_name, email, phone_number
    ...           FROM customers
    ...           WHERE customer_id = ${new_id}

    Should Be Equal    ${rows[0][0]}    John
    Should Be Equal    ${rows[0][1]}    Wick
    Should Be Equal    ${rows[0][2]}    john.wick@example.com
    Should Be Equal    ${rows[0][3]}    555-123-4567

    Disconnect From Database
