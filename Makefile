all: fatpack

proyecto:
	../CC/scripts/crea-fichero-proyectos.raku ../CC\ 21-22\ Equivalencia\ nombre-nicks\ -\ Hoja\ 1.csv

fatpack: src/check-hitos.t
	fatpack pack src/check-hitos.t > t/check-hitos.t
