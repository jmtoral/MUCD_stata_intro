* =======================================================================

// PROYECTO: Sesión introductoria a STATA
// PROGRAMA: miprimerdo.do
// TAREA: Entender los fundamentos de STATA
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-14
// FECHA DE ACTUALIZACIÓN: 2022-07-14

* =========================================================================

global PATH "C:\Users\User\Documents\MUCD_stata_intro\Sesion_1"

cd $PATH

capture log close
log using "$PATH\logs\log_sesion1.smcl", text replace

version 16
clear all
set linesize 80
set more off


* 1. Importar datos en formato .dta

use http://www.principlesofeconometrics.com/stata/olympics.dta, clear
use "$PATH\data\olympics.dta", clear

* 2. Importar datos en formato .csv

import delimited "$PATH\data\song_billboard_spotify.csv", encoding(UTF-8) clear

* 3. Importar datos en Excel

import excel "$PATH\data\baseDatosCandidatos.xls", sheet("CANDIDATOS") clear


save "$PATH\productos\datos_limpios.dta"
log close