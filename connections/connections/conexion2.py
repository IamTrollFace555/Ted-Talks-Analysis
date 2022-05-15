import psycopg2

rows = int(input("Número máximo de tuplas a visualizar: "))
tables = ("idioma",
          "patrocinador",
          "charla",
          "video",
          "tema",
          "ponente",
          "charla_tema",
          "charla_ponente")

try:
    connection = psycopg2.connect(user="postgres",
                                password="",
                                database="ted",
                                host="localhost",
                                port="5432")
    print("Conexión exitosa\n")
    cursor = connection.cursor()
    
    for table in tables:
        sql = f"""select *
            from {table}
            order by 1;"""
            
        cursor.execute(sql)
        data = cursor.fetchone()
        
        print(f"\n{table}:")
        row = 0
        while data:
            if row == rows:
                print(".\n.\n.")
                break
            
            for i in data:
                if table == "ponente" and type(i) not in (str, int, bool):
                    print(i," "*7, end="|")
                    
                elif type(i) == str:
                    if len(i) > 9:
                        print(i[:9],"...", sep="", end="|")
                    else:
                        print(i," "*(11-len(str(i))), end="|")  
                        
                else:
                    print(i," "*(7-len(str(i))), end="|")
                    
            print("")
            data = cursor.fetchone()
            row += 1
    
except psycopg2.Error as e:
    print("Ocurrió un error al consultar: ", e)
    
finally:
    cursor.close()
    connection.close()