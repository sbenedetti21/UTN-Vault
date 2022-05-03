# Estimaciones
## Variables de estimación
- Tiempo/Duración -> Puede ser que no se estime ya que sale de estimar los recursos y el costo (hs/pers) que se necesita
- Costo/Esfuerzo -> Parecido a lo que pasa con el tiempo
- Recursos
- **Tamaño** -> Primera pregunta que tenemos que hacernos
	- Cual es el tamaño de lo que tenemos que construir?
	- Es la única variable que no cambia
	- A partir de esta derivan el resto, las demas no se estiman

>> Requerimientos -> Tamaño (+ Complejidad)-> Esfuerzo -> Costo 
																							>> -> Duración

## Por qué fallan las estimaciones?
- Optimismo
- Estimaciones informales
- No hay historia
- Mala definición del alcance
- Falta de experiencia
- Complejidad del problema
- No se estima el tamaño
- Porqeu la estimacion fue buena pero cuando arranca el proyecto
	- Mala admin de los requerimientos
	- No hay seguimiento y control
	- Se confunde progreso con esfuerzo

### Nivel de incertidumbre
El dia del fin del proyecto es cuando realmente sabemos cuanto lleva el desarrollo del producto.

![[incertidumbre.png]]

## Tips 
- Diferenciar entre estimaciones, objetivos y compromisos
- Asociar las estimaciones a un % de confiabilidad
- Es recomendable presentar las estimaciones como un rango en vez de como un único valor
- Siempre presentar los supuestos en conjunto con la estimación
- *Ley de Parkinson* -> "Toda tarea se expande hasta ocupar el tiempo que tiene asignado"
- Considerar todas las actividades relacionadas al desarrollo de sw, no solamente codificación y testing (análisis, diseño, etc)
- No asumir que solo por el paso del tiempo y de las fases de un proyecto se avanza con menor incertidumbre en las estimaciones
- Recolectar datos históricos para tener como referencia

## Ciclo de la Estimación
![[cicloEstim.png]]

- Estimar: Comenzar a estimar el tamaño para derivar el esfuerzo y el costo.
- Medir: Mientras evoluciona el proyecto, ir midiendo las variables tamaño, esfuerzo y costo.
- Registrar: Dejar claras las mediciones
- Analizar: Razones de desvíos. Delta de medicion. Ver cuales fueron las causas de esos desvíos
- Calibrar: Ajustar c/u de las variables y parámetros que intervienen en el proceso de estimación. 
- Volver a estimar:
	- Mismo proyecto pero con mas información que al comienzo del mismo
	- Nuevos proyectos con el proceso ajustado por la "calibración"

# Métodos de estimación
![[metodosEst.png]]

## Métodos rudimentarios
Lo que estiman es **esfuerzo**, son técnicas que resultan en cantidad hs/hombre que lleva hacer la tarea de forma ininterrumpida.
- Juicio Experto: alguien con experiencia define una estimación (totalmente estomacal) Rápida de hacer.
- Pert/Clarck: conjunto de 4/6 personas que estiman como el juicio experto pero se ponderan esas estimaciones. Rápida.
- Wideband Delphi: El equipo define cuanto es el esfuerzo que nos va a llevar hacer la actividad. Conjunto de personas que tiene que estimar se reunen, analizan los requerimientos, y en forma individual estiman cada tarea. Al final comparan y eligen que tanto les va a llevar.
- Planning Poker: El equipo define cuanto es el esfuerzo que nos va a llevar hacer la actividad. Conjunto de personas que tiene que estimar se reunen, analizan los requerimientos, y en forma individual estiman cada tarea. Al final comparan y eligen que tanto les va a llevar.

## Métodos paramétricos
Lo que estiman es **tamaño**, que luego puede derivar en duración/esfuerzo.
- Function Points: evalúa la funcionalidad del sistema, aplica una serie de reglas (está en el paper), obtiene una unidad de tamaño que se llama **function point** (FP)
- Use Case Points: Similar a Function points, pero mide los casos de uso y obtiene la unidad **Use Case Point** (leer paper)
- Story Points: mide en función de las user stories y termina siendo **story points**. En una user storie uno captura un requerimiento basado en lo que el usuario quiere hacer sobre el sistema
- Object Points: define que el sistema es un conjunto de objetos o componentes y cuenta cuantos objetos son modificados por el requerimiento que se esta estimando (ver final del ppt)

# Extra

Si tengo un proyecto donde el tiempo es una constraint, puedo utilizar timebox development para encararlo, reduciendo el alcance de esos timebox y lo que va a aumentar es el esfuerzo. El costo deriva de ese esfuerzo que requiero.