* =======================================================================

// PROYECTO: TAREA 1
// PROGRAMA: tarea_1.do
// TAREA: Entender cómo leer datos en STATA y explorarlos
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-19
// FECHA DE ACTUALIZACIÓN: 2022-07-19

* =========================================================================


log using "MI\RUTA\logs\log_tarea1.smcl", text replace name(tarea_1)
/* VERSIÓN AVANZADA: Utiliza el factor de expansión "FAC_SEL" para responder
    las preguntas considerando la ponderación adecuada. */


/* 0. Ordena una carpeta con este proyecto en donde las siguientes carpetas:

        A. "datos", en donde guardarás los datos del siguiente paso
        B. "dos", en donde guardarás este do-file terminado
        C. "logs", en donde guardarás los logs para esta tarea.*/

/* 1. Descarga el archivo de los microdatos de la ENSU de marzo-junio de 2022,
      el enlace es el siguiente: https://www.inegi.org.mx/programas/ensu/default.html#Microdatos,
      como siempre, tú puedes decidir qué formato utilizas.
      
      En la carpeta que se descarga (.zip), "ensu_bd_2022_dta", hay dos carpetas subsecuentes (en .zip D:):
      a) ensu_bd_marzo_2022_dta y b) ensu_bd_junio_2022_dta. Utiliza la de junio. */

/* 2. Lee la tabla "ENSU_CB_0622" (en el formato que haya escogido) en STATA. Usa el comando use.*/

* RESPUESTA ============================================================


* =======================================================================

/* 3. Vamos a utilizar la pregunta "BP1_1". Lamentablemente, una vez más,
    no hay etiquetas para esta pregunta en particular. En el archivo de descripción de archivos
    podemos encontrar que la pregunta es "1.1 En términos de la delincuencia, ¿considera que vivir actualmente en (CIUDAD), es…".
    Donde "1" es seguro, "2" es inseguro y "9" es no sabe.
    Utiliza el comando codebook sólo para esa variable. Anota tus hallangos.*/

* RESPUESTA ============================================================


* =======================================================================

/* 4. Con la variable que utilizamos en 3. Utiliza el comando summarize y explica porqué
funciona o porqué no funciona. */

* RESPUESTA ============================================================


* =======================================================================


/* 5. Con la variable que utilizamos en 3. Haz una tabla que resuma el número de
repsuestas en la muestra. */

* RESPUESTA ============================================================


* =======================================================================


/* 6. Repute 3, 4 y 5 con la variable "BP1_3" y "BP3_2". Investiga qué pregunta es y
a qué corresponden sus respuestas. */



log close tarea_1