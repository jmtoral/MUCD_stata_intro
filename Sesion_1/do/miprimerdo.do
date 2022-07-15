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

pwd

capture log close
log using "$PATH\logs\log_sesion1.smcl", text replace name(Mi_primer_log)

version 16
clear all
set linesize 80
set more off


* 1. Importar datos en formato .dta

use http://www.principlesofeconometrics.com/stata/olympics.dta, clear

summarize

use "$PATH\data\olympics.dta", clear

summarize
list in 1/10
codebook
lookfor pl

* 2. Importar datos en formato .csv

import delimited "$PATH\data\song_billboard_spotify.csv", encoding(UTF-8) clear

summarize
tab artist
tab artist, sort


* 3. Importar datos en Excel

import excel "$PATH\data\baseDatosCandidatos.xls", sheet("CANDIDATOS") clear

import excel "C:\Users\User\Documents\MUCD_stata_intro\Sesion_1\data\baseDatosCandidatos.xls", sheet("CANDIDATOS") firstrow clear


summarize


*save "$PATH\productos\datos_limpios.dta", replace
log close