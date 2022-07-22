* =======================================================================

// PROYECTO: Tercera introductoria a STATA
// PROGRAMA: sesion_4.do
// TAREA: Fndamentos de los comandos de filtrado y reglas airtméticas Vol. 2
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-22
// FECHA DE ACTUALIZACIÓN: 2022-07-22

* =========================================================================
display 4+5+5+5

global PATH "C:\Users\User\Documents\MUCD_stata_intro\Sesion_4"

cd $PATH

capture log close sesion4
log using "$PATH\logs\log_sesion4.smcl", text replace name(sesion4)

// 1. Importar los datos de población

import delimited "C:\Users\User\Documents\MUCD_stata_intro\Sesion_4\data\pob2020.csv", varnames(1) clear

// 2. Guardarlos como dta

save "data\pob2020.dta", replace

// 3. Combinar

import delimited "C:\Users\User\Documents\MUCD_stata_intro\Sesion_4\data\IDEFC_NM_jun22.csv", clear

merge m:1 entidad using "data\pob2020.dta"

// 4. Crear una nueva variable con el total

gen total = enero + febrero + marzo + abril + mayo + junio + julio + agosto + septiembre + octubre + noviembre + diciembre

//egen total = rowtotal(enero-diciembre) 

// 5. Crear una variable con la razón de delitos totales y población

//destring pob2020, replace

gen tasa = total/pob20

replace tasa = tasa * 100000

tabulate entidad, missing

drop if tasa == .


// 6. Los estados más violentos (por homicidios con arma de fuego) en 2021

keep if año == 2021 & subtipodedelito == "Homicidio doloso" & modalidad == "Con arma de fuego"


xtile cuantil5 = tasa, nq(5)

list cuantil5 in 1/5


// 7. Guardar resultados

save "productos\homicidios_cuantiles.dta", replace

log close sesion4