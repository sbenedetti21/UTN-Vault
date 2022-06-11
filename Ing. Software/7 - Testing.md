# Testing
**Recordar que es un SW de calidad**

>Aquel que al ser usado NO tenga FALLAS

## Testing no es QA!
Diferencia entre QA y QC - Aseguramiento de la calidad y Control de la calidad.
- QA: Busca el cumplimiento de todos los requisitos del proceso. Que la manera en que construyo software cumpla con estos requisitos. El testing está dentro de estos requisitos. *"Es la actividad que me asegura el cumplimiento del proceso que yo tenga definido, donde encuentra un no cumplimiento, levantará la bandera y lo explayará"*.
- QC: Es sobre algo que ya está hecho, chequea que lo que se esperaba cumpla con lo obtenido.

El QA viene de que la calidad no puede "inyectarse" al final, es algo que se tiene que pensar desde el comienzo.

## Que persigue el testing
El objetivo del testing es encontrar **fallas**.
Hacerlo lo mas *eficiente* posible
- Lo más rapido posible
- Lo más barato posible

Hacerlo lo mas *eficazmente* posible
- Encontrar la mayor cantidad de fallas
- No detectar fallas que no son (no reportar algo que testeaste mal, un falso positivo)
- Encontrar las más importantes (priorizarlas segun severidad)

Si no encuentro fallas, fracasé? -> Siguiendo la definición, es correcto, falló el testing.

Segun IEEE:
> Testing es una actividad en la cual un sistema o componente es ejecutado baje condiciones específicas, los resultados de dicha ejecución son observados o registrados y, a partir de los mismos se realiza una evaluación de algún aspecto o componente del sistema.

Deducimos que se trata de un proceso *dinámico*

- Probar es ejecutar un componente con el objetivo de producir fallas
- Una prueba es exitosa si encuentra fallas
- Si nuestro objetivo es mostrar que el SW no contiene errores, estaremos inconscientemente orientados a ese fin

## Proceso de testing

![[procesoTest.png]]

El problema acá es "que prueba hago?", ya que en algún momento hay que dejar de testear y a veces las pruebas son muy amplias. Lo primero que tengo que tener son las reglas de negocio, ya que sino es imposible saber cual es el resultado esperado, **la documentación es necesaria**. Si testeamos leyendo el código escrito, estamos en un problema.

![[procesoTeest.png]]

### Conceptos
- Equivocación: Acción humana que produce un resultado incorrecto. (gracias a SCM se puede ver quien produjo la equivocación)
- Defecto: Es lo que me origina la falla. Ausencia de cierta característica. Yo tengo que tener la certeza de porque se introdujo un defecto, sino no tengo aprendizaje.
- Fallas: Resultado de ejecución incorrecto. Es el producido por el SW distinto al resultado esperado. (un 404 es una falla, que se quede cargando es una falla)

- Incidente: Toda ocurrencia de un evento que sucede durante la ejecución de una prueba que requiere investigación. No toda incidencia es una falla.

![[conceptos.png]]

Una equivocación lleva a uno o mas defectos que están presentes en el código.
Un defecto lleva a cero, una o mas fallas (la falla puede estar separada en el tiempo del defecto)
La falla es la manifestación del defecto.
Una falla tiene que ver con uno o más defectos.

## Condición de prueba, caso de prueba
- Condición de prueba: Son descripciones de las situaciones que quieren probarse ante las que el sistema debe responder. Proceso "creativo", mejor si no depende de la inspiración (me apoyo en técnicas). (Ej: "voy a probar con un cliente que va a hacer una extracción con un monto menor a lo que tiene en la cuenta")
- Caso de prueba: Son lotes de datos necesarios para que se dé una determinada condición de prueba. Proceso "laborioso". Ej: Leandro, saldo 100, extracción 10 (a la condición le asocio datos)

Desde https://youtu.be/sEs4IDhYpTE?t=5405

- Criterio de selección: condición para seleccionar un conjunto de casos de prueba. De todas las combinaciones posibles, solo seleccionaremos algunas.
Todos los posibles casos de prueba los dividimos en *clases*.
Todos los casos de una clase son *equivalentes* entre si -> detectan los mismos errores.
Con solo ejemplos de cada clase cubrimos todas las pruebas (clase de equivalencia)
El éxito está en la selección de la partición.