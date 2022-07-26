* =======================================================================

// PROYECTO: TAREA 2
// PROGRAMA: tarea_2.do
// TAREA: Entender cómo leer datos en STATA y explorarlos
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-26
// FECHA DE ACTUALIZACIÓN: 2022-07-26

* =========================================================================


log using "MI\RUTA\logs\log_tarea2.smcl", text replace name(tarea_2)


/* 0. Ordena una carpeta con este proyecto en donde las siguientes carpetas:

        A. "datos", en donde guardarás los datos del siguiente paso
        B. "dos", en donde guardarás este do-file terminado
        C. "logs", en donde guardarás los logs para esta tarea.*/

/* 1. Descarga el archivo de población por estado de la carpeta de GitHub. 
El link es el siguiente: https://raw.githubusercontent.com/jmtoral/MUCD_stata_intro/master/Sesion_4/data/pob2020.csv
Lee el archivo y conviértelo a formato dta. Guarda ese archivo con save en tu carpeta de datos.*/

* RESPUESTA ============================================================



* =======================================================================

/* 2. Descarga el archivo de la incidencia delictiva a nivel estatal del SESNSP,
      el enlace es el siguiente: https://drive.google.com/file/d/1wMkk0DNh1vdCC9P_cUleNtoH6mmd2FOp/view, 
	  el formato es CSV.
      En el enlace busca el botón de descargar y guarda el archivo en tu carpeta de "datos". */


/* 3. Lee la tabla "IDEFC_NM_jun22.csv" en STATA. Usa el comando import delimited.*/

* RESPUESTA ============================================================



* =======================================================================


/* 4. Une la base de población con la base "merge"*/

* RESPUESTA ============================================================



* =======================================================================



/* 5. Crea una variable con la suma de todos los meses, llámala "total".*/

* RESPUESTA ============================================================



* =======================================================================

/* 6. Crea una variable llamada "tasa" que sea el resultado de la división entre
"total" y "pob2020", luego multiplica esa variable por 100,000.*/

* RESPUESTA ============================================================



* =======================================================================


/* 7. Usando el comando "list" y una serie de condiciones de "if", haz una tabla 
con las entidades con mayores tasas de robo a transportista con violencia en 2020.*/

* RESPUESTA ============================================================


* =======================================================================

/* 8. Usando el comando "list" y una serie de condiciones de "if", haz una tabla 
con las entidades con mayores tasas de narcomenudeo en 2017.*/

* RESPUESTA ============================================================


* =======================================================================



/* 9. Usando el comando "list" y una serie de condiciones de "if", haz una tabla 
con el total de Robo a institución bancaria con violencia en Chihuahua de 2015 a 2021.*/

* RESPUESTA ============================================================


* =======================================================================

/* BONUS: Sigue estas instrucciones */

/* 
10. Utiliza el comando "keep" y su predicado "if" para conservar solamente los
delitos del subtipo "Homicidio Doloso" en su modalidad "Con arma de fuego". Conserva
todos los años y todas las entidades.

Lee el siguiente comando y describe, antes de correrlo, que crees que haga y por qué:
graph bar (sum) total, over(año)

* RESPUESTA ============================================================


* =======================================================================

Corre el comando y describe lo que ves:

* RESPUESTA ============================================================


* =======================================================================

*/




log close tarea_2