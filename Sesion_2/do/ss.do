* =======================================================================

// PROYECTO: Introducción a la exploración de datos
// PROGRAMA: 1_exploracionENPOL.do
// TAREA: Explorar datos reales y encontrar patrones
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-15
// FECHA DE ACTUALIZACIÓN: 2022-07-15

* =========================================================================


// Settings

global PATH "C:\Users\User\Documents\MUCD_stata_intro\Sesion_2"

cd $PATH

version 16
clear all
set linesize 80
set more off

use "$PATH/data/ENPOL2021_SOC.dta"

use "C:\Users\User\Downloads\bd_enpol_2021_dta\ENPOL2021_SOC.dta", clear

// Usar factores de expansión



gen fac_expansion = real(FAC_PER)

svyset [pw = fac_expansion]