* =======================================================================

// PROYECTO: Introducción a la exploración de datos
// PROGRAMA: 1_exploracionENPOL.do
// TAREA: Explorar datos reales y encontrar patrones
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-15
// FECHA DE ACTUALIZACIÓN: 2022-07-15

* =========================================================================

* webuse lbw

// Settings

global PATH "C:\Users\User\Documents\MUCD_stata_intro\Sesion_2"

cd $PATH

version 16
clear all
set linesize 80
set more off

// Abrir el log

capture log close Intro_Datos

log using "$PATH\logs\log_sesion2.smcl", text replace name(Intro_Datos)

// Document starts here

putdocx begin

/* Título */

putdocx paragraph, style(Title)
putdocx text ("Mi primer análisis de datos en STATA")

/* Add a heading */
putdocx paragraph, style(Heading1)
putdocx text ("Datos")
putdocx textblock begin

Voy a usar los datos de la ENPOL 2021 del INEGI.

putdocx textblock end

use "C:\Users\User\Documents\MUCD_stata_intro\Sesion_2\data\ENPOL2021_SOC.dta"

/* Add a block of text */
putdocx textblock begin

A continuación voy a explocar de manera muy completa este dataset:

putdocx textblock end




/* Save and close the document */
putdocx save bwreport, replace


// Cerrar el log
log close Intro_Datos