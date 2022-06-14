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
- Equivocación: Acción humana que produce un resultado incorrecto. (gracias a SCM se puede ver quien produjo la equivocación) Equivocación de tipo humana o relacionada con algún problema en el proceso o producto.
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

## Depuración o DEBUG
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
## Enfoques de Prueba 
### Prueba de caja negra (funcional)
Prueba que se utiliza para la prueba funcional. Me desentiendo de como estan implementadas las reglas de negocio y ante una entrada me fijo si recibo el resultado esperado. Se basa en la definicion de requerimientos y lo resultados esperados. Basada en entrada/salida.
La prueba de caja negra exahustiva es imposible de realizar, tendría que probar todos los valores posibles. Por esto se seleccionan subconjuntos (como las clases de equivalencia), son llamadas *pruebas basadas en subdominios* o *pruebas por partición de equivalencias*.

Los criterios de aceptación: Evaluo los escenarios que quiero probar. Ej: Usuario que se registre debe ser mayoer de edad. A partir de los criterios de aceptación se derivan los casos de prueba (conjunto de datos que integran la prueba, con los cuales voy a evaluar el escenario, ej: Diego, 01/03/2000).

Para derivar los casos de prueba tenemos varias técnicas como:

Criterios de caja negra (técnicas):
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
Prueba en donde se mira el código, el tester no tiene entrada y salida nomás, sino que conoce como está construido el SW.

Mirando el código puedo encontrar clases de equivalencia más facil. Y puedo encontrar defectos.

Si solo miro defectos en el codigo no estoy haciendo testing, para hacer testing tiene que haber una ejecucion (para poder encontrar una fallas), si solo busco defectos estoy haciendo una tarea de QA (analisis estatico de código)

#### Tipos de prueba (tecnicas para casos de prueba)
Son conceptos que sirven para saber como realizar los casos de prueba.
- Cobertura de sentencia: Buscar la mayor cantidad de casos de prueba que me cubra la mayor cantidad (porcentaje) de lineas de código.
- Cobertura de decisión: el if es la decisión, lo que esta dentro son las condiciones. Busca probar los caminos de salida.
```
if (a = b && b = c) {
}
```
a=b es una condicion y b=c es otra condicion. El if entero es una decision.
- Cobertura de condición:  Busca que todos los caminos sean probados.
- Prueba del camino basico: Asociado a una métrica de mantenibilidad conocida como complejidad ciclomática (cantidad de caminos independientes que tiene el código. V(g) = A - N + 2 (A = aristas, N = nodos)). Calcula desde el inicio hasta el fin de la ejecución, cuantos caminos existen. Cuantos mas caminos independientes, mas complejo es, indica mas mantenimiento, mas lógica, etc.

### Prueba de caja gris
Es un híbrido entre caja blanca y caja negra.

## Tipos de prueba
- Pruebas funcionales: no necesariamente son las de caja negra.
	- De sistema funcional: valida que el sw cumpla con los requerimientos. 
	- De aceptación de usuario: conceptualmente similar a la de sistema, la diferencia se ejecuta en el ambiente de usuario. El usuario acepta o no.
	- Prueba de homologación: valida que el sw cumpla con las caracteristicas esperadas para un producto de tal fin. Ej: validar que funcione en windows xp.
	- Integración
- Pruebas no funcionales: prueban requisitos de calidad.
	- De volumen (mas comun): se prueba si el sistema soporta grandes volumenes, pero dentro de lo diseñado. De performance.
	- De stress: Ver como responde excediendome al limite para el cual fue diseñado. De performance.
	- De resiliencia o robustez: Si lo re contra excedo es una prueba de robustez. Extremo tan alto que seguro lo hago fallar para cver como interactúa. Esta última es mas de fiabilidad.
	- Seguridad: Orientada a probar los atributos/requerimientos de seguridad del sistema
	- Usabilidad: Orientada a probar los atributos de usabilidad definidos en los requerimientos del sistema

### Otros tipos de prueba
- De regresión: Se chequea que al agregar un cambio, las funcionalidades existentes sigan funcionando correctamente.
- Alfa y Beta: Selecciono un grupo de usuarios y ellos prueban el sw en su propio ambiente. Ellos son los que reportan las fallas. Importante tener en cuenta que el grupo de usuarios conoce el producto, tiene conocimiento tecnico y dependiendo o no, fue entrenado para reportar, es opcional esto último. Alfa y Beta son como las cotas de las pruebas. Simil a los juegos.
- Unitaria: Se basa en el código que estoy construyendo. El programador es el que ejecuta el código de la prueba. Es una zona medio gris, te garantiza que las condiciones que pensaste se cumplen pero no cumple como averiguar un caso de prueba y demas.
	- Modelo en V: una vez que tengo los requeriemientos ya puedo empexar a trabjar en el armado de casos de prueba, y cuando tenga el sistema puedo hacer la prueba de sistema. A medida que avanzo con el diseño puedo realizar pruebas de integración, y cuando tenga el codigo hago unitarias.
- Integración: Prueba la comunicación entre otros sitemas o con otros módulos.
- Smoke test: probas alguna funcionalidad que te pinta en el momento, y validas que ande. Es una prueba rapida. No necesito probar todo.
- Sanity test: se ejecuta cuando desplegaste en un ambiente operativo y queres validar que el sistema siga sano. Necesito probar todos los casos críticos.

## Exploratory testing
Paper "testing without a map" y "exploratory testing"
Testear sin requerimientos. 

Capaz tengo que testear sin los requerimientos y me baso en criterios o conceptos:

**HICCUPP**
- History
- Image
- Claim
- Consistency (con otros programas)
- User expectations
- Product
- Purpose

En base a estos conceptos, poder hablar con el dev y explicarle porque es una falla lo que encontramos (aunque la funcionalidad ande bien) El valor esta en hacerlo **Unscripted**, sin un guión. Los scripted y unscripted son complementarios.

Cuatro etapas:
- Analisis y reconocimiento: entender el sw
- Diseño: como me imagino que voy a trabajar
- Ejecución: Ejecuto lo diseñado
- Interpreto: Detecto o analizo o interpreto si lo que encontre puede ser una falla o no (depende de la persona si lo que encontro es una falla o no, bnasandose en los criterios hiccupp, los cuales sirven como justificación) 

## Métricas de testing
No confundir los elementos que se pueden contar con las verdaderas métricas. Ej: la cant de fallas encontradas es 6, es una medición, no una métrica. 
Un indicador es puede ser la division entre cant fallas en test vs cant fallas en produ.
Todo indicador tiene que compararse con una *referencia*, para saber que tan bueno o malo es realmente y convertirse en una *métrica*.
Todo el trabajo de testing tiene que poder medirse, para poder saber donde estoy parado.

## Testing Automation
No todo es automatizable, se tiene que complementar con el testing manual. Tiene un trabajo de desarrollo. Leer ppt. 

Lo mas probable es que la interfaz de usuario cambie constantemente por lo que automatizarla no suele ser conveniente. Hay que entender que es lo que conviene automatizar y que es lo que no.

---





## Extra
Requerimientos - Ejecución test - Incidentes - Falla - Defecto - Equivocacion

Un defecto es una falla?

![[Captura de Pantalla 2022-06-13 a la(s) 21.08.27.png]]

![[Captura de Pantalla 2022-06-13 a la(s) 21.08.55.png]]