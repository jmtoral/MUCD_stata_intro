* =======================================================================

// PROYECTO: Tercera introductoria a STATA
// PROGRAMA: sesion_3.do
// TAREA: Fndamentos de los comandos de filtrado y reglas airtméticas
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-21
// FECHA DE ACTUALIZACIÓN: 2022-07-21

* =========================================================================

global PATH "C:\Users\User\Documents\MUCD_stata_intro\Sesion_3"

cd $PATH

capture log close sesion3
log using "$PATH\logs\log_sesion3.smcl", text replace name(sesion3)

// 1. Importar los datos

import delimited "C:\Users\User\Documents\MUCD_stata_intro\Sesion_3\data\IDEFC_NM_jun22.csv", clear

// 2. Explorar

describe
codebook
list in 1/10


//3. Cambiar nombres problemáticos
rename año yr
rename bienjurídicoafectado bienjur

// 4. Definir etiquetas de los datos

label data "Cifras de Incidencia Delictiva Estatal, 2015 - junio 2022"

// 5. Definir etiquetas de las variables

label variable clave_ent "Clave de Entidad"

// 6. Conservar o tirar
preserve // Marco un "checkpoint"

drop if yr < 2021

restore // Regreso al checkpoint que marqué anteriormente


preserve

drop if yr < 2021 | yr > 2021
tab yr

restore

preserve

keep if yr == 2021
tab yr

restore

// 7. Explorar con operaciones aritméticas

tab año if año >= 2021

list if entidad == "Aguascalientes"

list if entidad == "Aguascalientes" & tipodedelito == "Electorales" & yr = "2022"


list if entidad == "Aguascalientes" & modalidad == "Electorales" & yr == 2021 | entidad == "Durango" & modalidad == "Electorales" & yr == 2021


tab subtipodedelito if modalidad == "Con arma de fuego"

// hervir agua if infusion == "Jamaica", g30

// 8. Generar una variable por año

gen total = enero + febrero + marzo + abril + mayo + junio + julio + agosto + septiembre + octubre + noviembre + diciembre


list entidad total if subtipodedelito == "Homicidio doloso" & total >= 1500 & yr == 2020




summarize


save "$PATH\productos\yr_2021.dta", replace
log close sesion3