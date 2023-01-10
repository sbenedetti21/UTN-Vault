Un proceso es un programa en ejecución, programa se le dice al código. El proceso cuenta con una imagen que incluye:
- Stack: guarda acceso a funciones y variables locales. El stack crece y se achica dinamicamente.
- Heap: Es memoria dinámica que los procesos piden.
- Data: Memoria estática. Variables globales.
- Text: Es el código.

![[Pasted image 20230110175409.png]]

# Estados

![[Pasted image 20230110175801.png]]

- Nuevo: El proceso se está creando
- Listo: Está esperando que le asignen la CPU
- En ejecución: Se están ejecutando sus instrucciones
- En espera / Bloqueado: Está esperando que ocurra algún evento
- Terminado: Ha terminado su ejecución y liberaron sus recursos

# Planificaciones

![[Pasted image 20230110180027.png]]

- Ready a running es el de corto plazo.
- Estado suspendidos el de mediano plazo. Por ejemplo cuando falta memoria, algunos procesos en vez de matarlos son suspendidos.
- El de largo plazo controla la transicion de new a ready.
- Para bajar el *grado de multiprogramación* lo mas común es pasar algun proceso de bloqueado a bloqueado suspendido.
- El de extra largo plazao no es del sistema operativo en sí.

#  Cambios de contexto


> Un cambio de proceso implica al menos 2 cambio de contexto, pero un cambio de contexto no necesariamente implica un cambio de proceso (se podría atender una interrupción y volver al mismo proceso).
> Un cambio de modo implica un cambio de contexto. 
> Un cambio de contexto no implica un cambio de modo.

![[Pasted image 20230110180822.png]]

## PCB (Process control block)
Contiene información sobre cada proceso. 
- ID
- Estado
- Program Counter
- Registros
- etc...
Es una tablita administrativa, siempre queda en memoria.


# Hilos

## Concurrencia VS Paralelismo
![[Pasted image 20230110181312.png]]

Un hilo es la unidad básica de utilización de la CPU, son conocidos como procesos ligeros.

## Procesos Vs Hilos!

Los hilos de un proceso comparten *codigo*, *data* y *heap*. Por esta razón pueden comunicarse sin usar ningún mecanismo del sistema operativo (entre procesos se usan pipes). Pero no hay protección entre ellos, ya que la memoria es compartida, un hilo puede escribir en la memoria de otro.
Una ventaja es que el proceso con cuatro hilos puede correr en cuatro núcleos en paralelo. Otra es que si un hilo muere, el proceso no muere. Cuando un proceso muere, todos sus hilos mueren. 
Es mas eficiente crear un hilo que un subproceso. Los cambios de contexto entre dos hilos son mas rápidos que entre dos procesos.

![[Pasted image 20230110181601.png]]

Los hilos en vez de tener PCB tienen una *TCB* (Thread control block)

## KLT - ULT

Los **KLT** son hilos a nivel de kernel, el SO conoce de su existencia y controla su ejecución.

Los **ULT** son a nivel usuario y el SO no los reconoce. Lo bueno de estos es que la conmutación de contexto es aún mas rápida, pero no permiten paralelismo, justamente porque el sistema operativo no los conoce. Otra desventaja es que cuando uno de ellos realiza una operación bloqueante, bloquea a los demas ULTs.