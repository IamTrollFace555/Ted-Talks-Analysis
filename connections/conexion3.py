import psycopg2

table = input("Tabla a consultar: ")
col = input("Columna a visualizar: ")
rows = int(input("Número máximo de tuplas a visualizar: "))

try:
    connection = psycopg2.connect(user="postgres",
                                password="",
                                database="ted",
                                host="localhost",
                                port="5432")

    cursor = connection.cursor()
    
    sql = f"""select {col}
        from {table};"""
        
    cursor.execute(sql)
    data = cursor.fetchone()
    
    print(f"\n{table}:")
    row = 0
    while data:
        if row == rows:
            print(".\n.\n.")
            break
        print(data[0],"\n")
        data = cursor.fetchone()
        row += 1
    
except psycopg2.Error as e:
    print("Ocurrió un error al consultar: ", e)
    
finally:
    cursor.close()
    connection.close()