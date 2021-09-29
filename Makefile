all: fatpack

fatpack: src/check-hitos.t
	fatpack pack src/check-hitos.t > t/check-hitos.t
