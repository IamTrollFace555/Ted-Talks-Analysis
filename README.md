# Ing_de_Datos


## Explicación de los archivos de python:

### Información general:

Es importante tener en cuenta que hay que editar la parte donde se hace la conexión en todos los archivos
para cambiar la información de la base de datos a la cual se va a conectar, así como las credenciales de inicio de sesión en postgres. 

        

### conexion1.py:

Con este archivo se puede consultar la información de una tupla específica de una tabla. Al correr el archivo se pide el nombre de la tabla
a consultar y el id de la tupla que se quiere ver. En caso de ingresar información errónea se devolverá un mensaje de error.


### conexion2.py:

Con este archivo se pueden imprimir los primeros n registros de cada tabla de la base de datos (ordenada de forma ascendente por el id). Al correr el archivo se pedirá ingrsar el número de registros
que se quieren visualizar de cada tabla. En caso de que alguna tabla tenga menos registros que el número ingresado, se imprimirán todos los registros de la tabla.
En caso de ingresar información errónea se devolverá un mensaje de error.

### conexion3.py:

Con este archivo se pueden imprimir los n primeros valores de **una** columna de una tabla.
Al correr el archivo se pide el nombre de la tabla, el nombre de la columna y la cantidad de registros que se quieran imprimir.
En caso de ingresar información errónea se devolverá un mensaje de error.

## Explicación de los archivos de SQL:

### ted_dml.sql:

Para que este archivo funcione correctamente debe usarse la ruta absoluta de los archivos desde los que se importan los datos. Por eso, es necesario
modificar las direcciones de cada archivo en el código o, alternativamente, ubicar la carpeta datasets en la raíz del disco C.
