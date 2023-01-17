Hace referencia a un conjunto de políticas y mecanismos del Sistema Operativo que gobiernan el orden en que se ejecutan los procesos.

Los procesos en general tienen ráfagas de cpu y ráfagas de I/O. Algunos proceso son mas *I/O bound* (con mas ráfagas de I/O) o *CPU bound* . Lo ideal para el planificador es tener un conjunto de procesos equitativo entre I/O y CPU bound.

## Procesadores Expropiativos

La planificación ocurre cuando:
- Un proceso decide liberar la CPU voluntariamente (ej: llama una syscall de I/O)
- Un proceso entra en la cola de **Ready**

Si el procesador es *con desalojo* o *expropiativo* entonces tendrá en cuenta ambos casos, sino solamente se tendrá en cuenta el segundo caso.

## Dispatcher

El dispatcher es un módulo que cede a la CPU el proceso elegido por el planificador de la CPU. El tiempo que tarda el dispatcher en detener un proceso y poner a otro en ejecución se llama *latencia del dispatcher*

## Criterios de planificación

- Utilización de la CPU
- Rendimiento
- Tiempo de retorno
- Tiempo de espera
- Tiempo de respuesta

# Algoritmos de planificación

## FIFO

First in first out. El tiempo de espera medio es alto en general, depende del orden de llegada de los procesos

![[Pasted image 20230117163656.png]]

## SJF y SRTF

Shortest job first. 

- Sin desalojo: Los procesos no son interrumpidos. 
- Con desalojo: Se lo conoce como Shortest Remaining Time First (SRTF). Tiene el problema de que un proceso con una gran ráfaga de CPU puede no llegar a ejecutar nunca, ya que si entran todo el tiempo procesos cortos lo desalojarían constantemente.

Produce **STARVATION** o **INANICIÓN**

Es mentira que el SO sabe cuanto va a durar la ráfaga de CPU de un proceso, ni el proceso sabe. Por esta razón hay que estimar.

### Estimación

> Para saber tu futuro tenes que conocer tu pasado

![[Pasted image 20230117164444.png]]


## Prioridades

A cada proceso se le asigna una prioridad arbitraria y funciona como SJF. Podría ser con desalojo o sin desalojo. Le pasa lo mismo que a SJF, Starvation.

Una solución es **Aging**. Subirle la prioridad a medida que pasa el tiempo que está esperando.

## HRRN

Highest response ratio next. Es la adaptación de SJF para romper con la inanición.
$$RR = (S + W)/S$$
$S = Próxima Ráfaga$
$W = Espera$

Cuanto mayor sea la espera respecto del tamaño de su ráfaga, mayor será su prioridad para ejecutar.
Puede ser con o sin desalojo, los ejercicios siempre sin desalojo.

## RoundRobin

Es como FIFO pero usa un timer. Al tiempo se le llama *quantum*. Los procesos se van turnando, ejecutan un quantum y liberan la CPU.

Si ponemos un quantum muy grande, el algoritmo se parece a FIFO.
Si ponemos un quantum muy chico, genera mucho overhead cambiando procesos o hilos.

