*=====================================================================

// PROYECTO: Respuesta a la Tarea 3
// PROGRAMA: solucion_3.do
// TAREA: De long a wide
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-08-02
// FECHA DE ACTUALIZACIÓN: 2022-08-02

*========================================================================
cd "C:\Users\User\Documents\MUCD_stata_intro\Sesion_6"


log using "logs_notebooks\log_sesion5.smcl", text replace name(sesion6)

// 1. Datos
import delimited "data\IDEFC_NM_jun22.csv", clear

// 2. Filtro
//list subtipodedelito modalidad

keep if subtipodedelito == "Robo a transeúnte en espacio abierto al público" & modalidad == "Con violencia"

// 3. Colapsar

collapse (sum) enero-diciembre, by(año)

// 4. Renombrar variables
rename (enero-diciembre) (delito(#)) ,addnumber

// 5. Generar identificador
gen id = _n

// 6. Transformar de long a wide
reshape long delito, i(id) j(mes)

// 7. Crear variable de fehca y convertir el formato

gen dia = 1

gen fecha = mdy(mes, dia, año)

format fecha %dm-y // Mes y año abreviados 

// 8. Filtrar los datos innecesarios

drop if delito == 0

// 9. Obtener fecha 23 de Marzo de 2020

di td(23mar2020)

// 10. Hacer la gráfica

twoway line delito fecha, xline(21997) title("Robo a transeúnte en espacio abierto al público") ///
subtitle("suma total por periodo mensual, con violencia") ytitle(Total de robos) ///
xtitle(Mes y Año) caption(Fuente: SESNSP)

%browse
