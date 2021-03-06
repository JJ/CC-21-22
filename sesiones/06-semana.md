# Sexta semana, 2 de noviembre de 2021

## Objetivos a cubrir en esta semana

* Entender cómo los contenedores encajan dentro del sistema de desarrollo ágil.
* Entender diferentes casos de uso de los contenedores.

## Otros objetivos


* Entender errores frecuentes en entrega de hitos
  * Volver a leer [los ya
    indicados](https://github.com/JJ/CC-21-22/blob/master/sesiones/04-semana.md#otros-objetivos)
    y
    [aquí](https://github.com/JJ/CC-21-22/blob/master/sesiones/05-semana.md#otros-objetivos).
  * Los issues (incluyendo HUs) son problemas, el código es la solución y el
    mensaje de commit expresa cómo se ha solucionado.
  * Como los hitos son PMVs, no puede haber un hito de "organización" ni de
    "organizar hitos". Los hitos que se entregan en clase corresponderán en
    general a hitos del proyecto del estudiante... Salvo este, claro.
* Errores frecuentes hito 2
  * Lista de gestores de tareas arbitraria.
  * No tener lógica de negocio en el código, que por tanto no puede ser
    testeada.
  * No justificar la biblioteca de aseciones.
  * No justificar el marco de pruebas.
  * No poner un verdadero gestor de tareas, sino un gestor de dependencias sin
    mencionarlo explícitamente.
  * No elegir previamente un estilo de aserciones (normal o BDD) y justificar la
    elección con respecto a eso.
  * No comentar la elección de nada en relación a las posibilidades que hay.
  * No se debe NUNCA cerrar varios issues en un solo commit.
  * Se deben usar buenas prácticas en los commits.

## Contenidos

* [Como examinar la estructura de un
  contenedor](http://jj.github.io/CC/documentos/temas/Contenedores.html#usando-dockerfiles)
* Como trabajar interactivamente dentro de un contenedor para depurarlo.

## Laboratorio, 2 de noviembre de 2021

* Ejemplos de contenedores:
  [Raku](https://hub.docker.com/r/jjmerelo/alpine-raku),
  [iv-test](https://hub.docker.com/r/jjmerelo/iv-test).

## Laboratorio, 4 de noviembre de 2021

Resolución de dudas hito 2 e hito 3, comprobación de errores frecuentes hito 2,
iniciación del hito 3. Recordatorio

* El hito 3 debe incluir un producto mínimamente viable/hito en el repo del
  estudiante que incluya la infraestructura virtual creada.
* Todo el desarrollo de código, inclusive infraestructura como código, debe
  hacerse con issues asignados al hito correspondiente. En este caso no tiene
  necesariamente que haber una historia de usuario de la que salga ese issue
  (aunque si en este punto hace falta alguna funcionalidad, o sobre todo
  dependencia, que sea esencial, habrá que incluir ese enlace).

## Material para la clase y fechas de entrega

Termina el plazo de entrega del [hito
2](http://jj.github.io/CC/documentos/proyecto/2.Tests). Fecha de entrega: **2 de
noviembre de 2021**. Si se entrega más tarde, pasará al plazo de entrega
extraordinario y no habrá posibilidad de volver a entregarlo en caso de que no
se haya superado el hito.

Comienza el plazo de entrega del [hito
3](http://jj.github.io/CC/documentos/proyecto/3.Docker.html). Fecha de entrega:
**15 de noviembre de 2021**.

## Siguiente semana

[Séptima semana, 9 de noviembre](07-semana.md)
