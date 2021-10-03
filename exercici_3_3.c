//programa en C para consultar los datos de la base de datos
//#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

void main ()
{
	MYSQL *conn;
	int err;
	int i=0;
	// Estructura especial para almacenar resultados de consultas
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	char consulta [80];
	//Creamos una conexion al servidor MYSQL
	conn = mysql_init(NULL);
	if (conn==NULL)
	{
		printf ("Error al crear la conexión: %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//inicializar la conexion
	conn = mysql_real_connect (conn, "localhost","root", "mysql", "BaseDatos",0, NULL, 0);
	if (conn==NULL)
	{
		printf ("Error al inicializar la conexión: %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	char nombre[20];
	printf("Escribe uno de estos nombres para ver cuantas partidas ha ganado (Juan, Eda, Nil, Pedro, Aitana, Maria o Pablo): \n");
	scanf("%s", nombre);
	sprintf(consulta,"SELECT ID FROM Partida WHERE Ganador='%s';", nombre);
	err=mysql_query (conn, consulta);
	if (err!=0)
	{
		printf ("Error al consultar datos de la base de datos  %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//recogemos el resultado de la consulta
	resultado = mysql_store_result (conn);
	// El resultado es una estructura matricial en la que cada
	// fila contiene los datos de una persona y sucesivas
	// columnas contienen cada uno de los datos de la persona
	// recorremos una a una cada fila del resultado
	// ahora obtenemos la siguiente fila
	row = mysql_fetch_row (resultado);
	if (row == NULL)
		printf ("%s ha ganado %d partidas\n", nombre, i);
	else
		while (row !=NULL)
		{
			i++;
			// obtenemos la siguiente fila
			row = mysql_fetch_row (resultado);
		}
	if (i != 0)
		printf("%s ha ganado %d partidas\n", nombre, i);	
	mysql_close (conn);
}	
