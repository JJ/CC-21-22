# Décima semana, comienza 29 de noviembre de 2021

Bienvenida a la nueva profesora de la asignatura, Dra. Claudia Villalonga (clase
conjunta).
## Objetivos

* Entender las buenas prácticas en el diseño de un API
* Entender como integrar los servicios comunes en un microservicio en el mismo a
  través de *middleware*.

## Errores frecuentes hito 3 y anteriores

* No entender por qué se pide una justificación de la elección de la imagen base
  y en general no entender que si se quiere justificar algo, lo tienes que
  justificar evaluándolos *en las mismas condiciones*. En este caso, ¿para qué
  es el contenedor? ¿Cómo queremos que sea y qué queremos que haga? Se hace
  pruebas con varios contenedores base con los criterios que se establezcan, y
  escogemos el mejor.
* No editar ni entender los workflow que se usan para subir a GitHub
  * No filtrar cambios para que sólo se lancen cuando cambian los ficheros
    usados.
  * No evitar pasos que no usamos.
  * Poner pasos que realmetne luego no usamos.
* El target para tests es `test`, no `tests`.
* No usar el gestor de dependencias para instalar las dependencias a pesar de
  estar instalado.
* Uso de steps arbitrarios en los workflow que actualizan la imagen Docker, o no
  uso de filtros adecuados que hagan build sólo si ocurre algo determinado.

## Errores frecuentes en hito 4

* Falta de enlaces al fichero correspondiente.
* Poca documentación sobre cada uno de los pasos.
* No testear las diferentes versiones de los lenguajes de programación,
  especialmente las versiones en desarrollo actual.

## Material de clase conjunta

* Entender [las buenas prácticas en el diseño de
rutas](http://jj.github.io/CC/documentos/temas/REST#buenos-usos-de-las-peticiones).

* Ejemplos de programación de un microservicio [en
Python](http://jj.github.io/CC/documentos/temas/Microservicios#ejemplo-en-python)
y en
[node](http://jj.github.io/CC/documentos/temas/Microservicios#ejemplos-en-node).

## Laboratorio, 30 de noviembre de 2021

Buenas prácticas en el [diseño de las rutas de un
API](http://jj.github.io/CC/documentos/temas/REST#buenos-usos-en-el-dise%C3%B1o-de-un-api)
junto con ejemplos.

## Laboratorio, 2 de diciembre

Cómo [testear aplicaciones en la
nube](http://jj.github.io/CC/documentos/temas/Microservicios#probando-nuestra-aplicaci%C3%B3n-en-la-nube).

[Tests de integración para
microservicios](https://jj.github.io/curso-tdd/temas/integraci%C3%B3n.html);
[otro ejemplo en
Python](https://github.com/JJ/tests-python/blob/master/HitosIV/tests/starlitos_test.py).

## Fechas de entrega

Continúa el plazo extraordinario del [hito
4, integración continua](https://jj.github.io/CC/documentos/proyecto/4.CI),
hasta el **4 de diciembre de 2021**.

Plazo de entrega del [hito
5](http://jj.github.io/CC/documentos/proyecto/5.Microservicio.html), hasta el
**16 de diciembre**.

## Siguiente semana

[Undécima semana, 6 de diciembre](11-semana.md)
