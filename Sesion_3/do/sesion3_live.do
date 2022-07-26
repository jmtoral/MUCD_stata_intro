* =======================================================================

// PROYECTO: Tercera introductoria a STATA
// PROGRAMA: sesion_4.do
// TAREA: Fundamentos de los comandos de filtrado y reglas airtméticas Vol. 2
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-22
// FECHA DE ACTUALIZACIÓN: 2022-07-22

* =========================================================================

// 0. Setup

cd "C:\Users\User\Documents\MUCD_stata_intro\Sesion_4"

// 1. Leer los datos

// 1.1 Leer los datos de población en CSV

import delimited "data\pob2020.csv", clear

// 1.2 Convertir los datos a formato dta

save "data\pob2020.dta", replace

// 1.3 Unir los datos de criminalidad con los de población

import delimited "data\IDEFC_NM_jun22.csv", clear

merge m:1 entidad using "data\pob2020.dta"

// 2. Limpiar los datos

rename año yr

// 2.1 Transformación de los datos

generate total = enero + febrero + marzo + abril + mayo + junio + julio + agosto+ septiembre + octubre +  noviembre + diciembre

generate tasa = total/pob2020

// 3. Análisis

// ¿Qué entidades federativas tuvieron las tasas por cada 100 mil hab. de homicidios
// con arma de fuego más altas de 2021? 


keep if subtipodedelito == "Homicidio doloso" & modalidad == "Con arma de fuego" & yr == 2021

 save "productos\tasa_homdol_afuego.dta"

