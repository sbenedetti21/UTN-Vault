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
El éxito está en la selección de la partición. Está en construir las particiones correctas. "No hay mejor manera de generar requerimientos que pensando como los voy a probar"

## Depuración
- Depurar es eliminar un defecto que posee el SW
- La depuración NO es una tarea de prueba aunque es consecuencia de ella
- La prueba detecta la falla (efecto) de un defecto (causa)
La depuración puede ser la fuente de nuevos defectos

Debemos
- Detectar
	- Dada la falla debemos hallar el defecto
- Depurar
	- Encontrado el defecto debemos eliminarlo
	- Debemos encontrar la razón del defecto
	- Debemos encontrar una solución
	- Debemos aplicarla
- Volver a probar
	- Asegurar que sacamos el defecto
	- Asegurar que no hemos introducido otros (regresión: cuando arreglo algo, se rompe otra cosa)
- Aprender para el futuro
	- lecciones aprendidas

## Hasta cuando tengo que probar
En un avión el esfuerzo de probar no tiene límite ya que un error puede ser muy grave. Existe un punto en todas las áreas en donde seguir probando se hace muy caro y ya no vale la pena.

Paro la prueba cuando:
-	Pasa exitosamente el conjunto de pruebas que fue diseñado
-	"Good enough": si pasa un porcentaje
-	Cantidad de fallas detectadas es igual a estimadas

Para abaratar las pruebas es diseñarlas para ser testeadas.

## Conclusiones
- Las pruebas no mejoran el SW, solo muestran cuantas fallas se han producido debido a defectos.
- El buen diseño y construcción no solo benefician las pruebas sino tambien a la corrección de los componentes y su mantenimiento
- El no probar no elimina los errores
- Lo mas barato para encontrar y eliminar defectos es no introducirlos
- Ninguna técnica es completa, lo mejor es combinar
- Sin especificaciones de requisitos todo es muchisimo mas dificil
- Debemos tener en cuenta la conjetura de errores (lo de estomacal)
## Tipos de Prueba 
### Prueba de caja negra (funcional)
Prueba que se utiliza para la prueba funcional. Me desentiendo de como estan implementadas las reglas de negocio y ante una entrada me fijo si recibo el resultado esperado. Se basa en la definicion de requerimientos y lo resultados esperados. Basada en entrada/salida. pijas y conchas
La prueba de caja negra exahustiva es imposible de realizar, tendría que probar todos los valores posibles. Por esto se seleccionan subconjuntos (como las clases de equivalencia), son llamadas *pruebas basadas en subdominios* o *pruebas por partición de equivalencias*.

Criterios de caja negra:
- Variaciones de eventos
- Clase de equivalencia
	- De entrada
	- De salida
- Casos de borde
- Ingreso de valores de otro tipo
- Integridad del modelo de datos
	- De dominio
	- De entidad
	- De relación

Clase de equivalencia:
 Indentificamos las clases de equivalencia y luego definimos los casos de prueba. La identificación de clases de equivalencia se hace dividiendo cada condición de entrada en dos grupos: clases válidas y clases inválidas. Ej: si hay una fecha entre 15 de junio y 18 de junio, tenemos dos clases invalidas y una valida (la del 15 al 18).
 
 Por c/condición de entrada:
 -	Rango de valores: Ej: de 100 a 200
 -	Conjunto de valores: Ej: DNI, CI, PAS
 -	"Debe ser": Ej: primera letra "A"

Por casos de borde:
Exploran las puntas de una clase, los bordes. Si tenemos de 15 a 18 de junio probamos esos dos días como bordes.

Clases inválidas (valores de otro tipo):
Probar datos que no son del tipo esperado (numericos en vez de alfabéticos, etc). En alfgunos casos estas validaciones las realiza el entorno de desarrollo por lo cual no son necesarias.

Conjetura de errores:
Sospecha de que algo anda mal, tambien llamada *prueba de sospechas*. Enumeramos una lista de errores posibles o de situaciones propensas a tener errores, creamos casos de prueba basados en esas situaciones. El programador es quien puede darnos información mas relevante. Dos origenes: partes complejas de un componente, o, circunstancias del desarrollo. Basado en experiencia, proceso creativo. Hacerlo cuando un componente esta hecho a las apuradas, o fue modificado por varias personas, o con copy paste, etc.

#### Definiendo condiciones y casos
Partamos de componentes generados por la etapa de requerimientos. Un SDLC puede producir por ejemplo:
- Wish list (podrían ser user stories): a cada requerimiento, pensar variaciones de las declaraciones, revisar los sustantivos y los verbos y pensar variaciones.
- Casos de uso (interaccion entre actor y sistema): La secuencia de eventos dentro de un caso de uso tienen variaciones indicadas por su texto. Cada variación de un evento constituye una "condición de prueba". Esto no puede hacerse si no se ha realizado el análisis de requerimientos.
- Modelo de datos: La integridad referencial y la cardinalidad de las relaciones definen reglas de negocio que deben ser probadas. Ej: una mesa de examen sin alumnos, una mesa con un alumno, una mesa con n alumnos.
- Diagrama de transición de estados: El ciclo de vida de un objeto define reglas de negocio que deben ser probadas.

### Prueba de caja blanca (estructural)
