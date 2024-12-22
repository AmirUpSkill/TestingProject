import pymysql
from robot.api.deco import keyword

class ApplicationCodeLibrary:
    def __init__(self, host='localhost', port=3306, user='amir_user', password='amir_adam_pwd', db='test_db'):
        # Cast the port to int, ensuring no string issues.
        self.host = host
        self.port = int(port)
        self.user = user
        self.password = password
        self.db = db

    @keyword("Insert Customer")
    def insert_customer(self, first_name, last_name, email, phone_number=None):
        connection = pymysql.connect(
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            db=self.db
        )
        try:
            with connection.cursor() as cursor:
                sql = """
                INSERT INTO customers (first_name, last_name, email, phone_number)
                VALUES (%s, %s, %s, %s)
                """
                cursor.execute(sql, (first_name, last_name, email, phone_number))
                connection.commit()
                return cursor.lastrowid
        finally:
            connection.close()
