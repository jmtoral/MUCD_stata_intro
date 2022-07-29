*=====================================================================

// PROYECTO: Quinta introductoria a STATA
// PROGRAMA: sesion_5.do
// TAREA: De long a wide
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-28
// FECHA DE ACTUALIZACIÓN: 2022-07-28

*========================================================================
cd "C:\Users\User\Documents\MUCD_stata_intro\Sesion_5"
log using "logs_notebooks\log_sesion5.smcl", text replace name(sesion5)

// 1. Datos
import delimited "data\IDEFC_NM_jun22.csv", clear

list in 1

// 2. Transformaciones y limpieza


// 2.1 Conserva sólo el subtipo de delito y modalidad que definen "Homicidio doloso con arema de fuego"

keep if subtipodedelito == "Homicidio doloso" & modalidad == "Con arma de fuego"

d
tab modalidad
tab subtipodedelito


collapse (sum) enero-diciembre, by(año)
d
list

// 3. Convertir de wide a long

rename (enero-diciembre) (homicidios(#)) ,addnumber

gen id = _n

reshape long homicidios, i(id) j(mes)

d

//reshape wide homicidios, i(id) j(mes)

//d



// 4. Generar una variable de fecha

gen dia = 1


gen edate = mdy(mes, dia, año)

format edate %dM-Y

twoway line homicidios edate


// 5. Filtrar los datos necesarios

drop if homicidios == 0

// 6. Graficar de nueva cuenta


twoway line homicidios edate



 gen quarterly_date = qofd(edate)
 gen m_date = mofd(edate)
format m_date %dM-Y



log close sesion5
