Registros de uso general
- Acumulador (AX)
- Base (BX)
- Contador (CX)
Registros de uso específico
- Stack pointer
- Instruction pointer/program counter: número de siguiente instrucción a ejecutar
- PSW: cadena de bits que guarda informacion sobre lo que se está ejecutando

![[Pasted image 20230104211531.png]]

Cuando ocurre una interrupción, lo que la cpu está ejecutando frena, se guarda el contexto (PSW y program counter) y se maneja la interrupción.

### Interrupciones

La interrupción es la manera que tiene el sistema operativo de frenar con un proceso y poner a ejecutar otro. Un ejemplo son las interrupciones de entrada/salida.
Las interrupciones síncronas tambien son llamadas *Excepciones*. Las interrupciones son asíncronas.
Las interrupciones no enmascarables se manejan aunque las interrupciones están deshabilitadas (si la cpu esta a 120° la pc se tiene que apagar)

![[Pasted image 20230104212114.png]]


### Modos de manejar entrada/salida

- I/O Programada: se queda esperando la cpu hasta que la lectura finalice.
- I/O Basado en interrupciones: se lanza una interrupción cuando la lectura esta lista.
- I/O con DMA (direct memory access): la CPU no se encarga, sino que la DMA maneja la entrada salida. La DMA es un HW dedicado a esto.