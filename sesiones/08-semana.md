# Octava semana, 15 de noviembre de 2021

## Objetivos a cubrir en esta semana

* Entender el concepto de CI
* Entender diferentes casos de uso de CI.
* Entender la importancia de la programación defensiva y el código limpio.

## Otros objetivos

* Entender errores generales frecuentes:
  * El desarrollo se tiene que seguir haciendo siguiendo buenas prácticas:
    issues, milestones y demás. Cada avance en el código debe hacerse hacia un
    PMV, el siguiente. "Creación de un Dockerfile" no es un título de issue
    correcto.
* Entender errores frecuentes hito 3:
  * Contenedores base arbitrarios, con juicios de valor cuestionables (Ubuntu
    18.04, "la más popular"). Tienes que establecer criterios base para la
    elección del contenedor base y una vez establecidos, buscar varias
    alternativas que lo cumplan en mayor o menor medida. En general, esa debe
    ser la forma de documentar las elecciones que se hagan (también en el TFM).
  * No se enlaza a las versiones del contenedor para que se vean que
    efectivamente son las más adecuadas.
  * No se pone el criterio de búsqueda para los contenedores base.
  * No se eliminan paquetes del contenedor base que puedan no necesitarse para
    tests (wget, cosas así).
  * No actualizar el contenedor base.

## Contenidos

Vamos a ver los flujos de CI que se usan en la asignatura y en el material de la
misma.

Adicionalmente, [código limpio](https://jj.github.io/curso-tdd/temas/a-programar.html).

## Laboratorio, 16 de noviembre de 2021

Comienza el plazo de entrega del [hito
4, integración continua](https://jj.github.io/CC/documentos/proyecto/4.CI),
hasta el **25 de noviembre de 2021**.

Entender [CI](https://jj.github.io/IV/preso/CI.html).

## Laboratorio, 18 de noviembre de 2021

Entender los [servicios avanzados en la web](https://jj.github.io/curso-tdd/preso/servicios.html).

## Material para la clase y fechas de entrega

Continúa el plazo de entrega del [hito
4, integración continua](https://jj.github.io/CC/documentos/proyecto/4.CI),
hasta el **25 de noviembre de 2021**.

## Siguiente semana

[Novena semana, 22 de noviembre](09-semana.md)
