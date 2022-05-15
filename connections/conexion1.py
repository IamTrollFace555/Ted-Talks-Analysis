import psycopg2

table = input("Tabla a consultar: ")
row = int(input("Índice de la tupla a visualizar: "))

try:
    connection = psycopg2.connect(user="postgres",
                                password="",
                                database="ted",
                                host="localhost",
                                port="5432")

    cursor = connection.cursor()
    
    sql = f"""select *
        from {table}
        where identificador = {row};"""
        
    cursor.execute(sql)
    data = cursor.fetchone()
    
    print(f"\n{table}:")
    while data:
        print(data)
        data = cursor.fetchone()
    
except psycopg2.Error as e:
    print("Ocurrió un error al consultar: ", e)
    
finally:
    cursor.close()
    connection.close()