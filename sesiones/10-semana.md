# Décima semana, comienza 29 de noviembre de 2021

Bienvenida a la nueva profesora de la asignatura, Dra. Claudia Villalonga.

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

## Siguiente semana

[Undécima semana, 6 de diciembre](11-semana.md)
