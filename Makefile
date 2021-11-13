all: fatpack

installdeps:
	cd src; cpanm --installdeps .
proyecto:
	../CC/scripts/crea-fichero-proyectos.raku ../CC\ 21-22\ Equivalencia\ nombre-nicks\ -\ Hoja\ 1.csv

fatpack: src/check-hitos.t
	fatpack pack src/check-hitos.t > t/check-hitos.t
fatpack2: src/get-info.pl
	fatpack pack src/get-info.pl > .github/workflows/get-info
