*=====================================================================

// PROYECTO: Quinta introductoria a STATA
// PROGRAMA: sesion_6.do
// TAREA: De long a wide
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-29
// FECHA DE ACTUALIZACIÓN: 2022-08-01

*========================================================================
cd "C:\Users\User\Documents\MUCD_stata_intro\Sesion_6"
//log close sesion6
log using "logs_notebooks\log_sesion6.smcl", text replace name(sesion6)

// 1. Datos
import delimited "data\IDEFC_NM_jun22.csv", clear

list in 1

// 2. Transformaciones y limpieza

//tab modalidad
//tab subtipodedelito

// 2.1 Conserva sólo el subtipo de delito y modalidad que definen "Homicidio doloso con arema de fuego"

tab modalidad if subtipodedelito == "Robo a casa habitación"

keep if subtipodedelito == "Robo a casa habitación" 
//& modalidad == "Con violencia"




collapse (sum) enero-diciembre, by(año)
d

// 3. Convertir de wide a long

rename (enero-diciembre) (robocasahab(#)) ,addnumber

gen id = _n

reshape long robocasahab, i(id) j(mes)

d

//reshape wide homicidios, i(id) j(mes)

//d


gen dia = 1

%browse

gen edate = mdy(mes, dia, año)

format edate %dM-Y

format edate %dm-y // Mejor formato

// 5. Filtrar los datos necesarios

drop if robocasahab == 0

di td(20mar2020)
twoway line robocasahab edate, xline(21975) title(Robo a casa habitación de 2015 a 2020) ///
subtitle("suma total por periodo mensual, con y sin violencia") ytitle(Total de robos) ///
xtitle(Mes y Año) caption(Fuente: SESNSP)

log close sesion6
