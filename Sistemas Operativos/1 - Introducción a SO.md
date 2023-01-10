### Funciones de un SO
- Administrar la ejecución de programas
- Comunicación entre programas
- Ser interfaz de usuario (por consola o GUI)
- Ser interfaz con los dispositivos
- Administrar la memoria
- Administrar los archivos (filesystem)
- Adminsitrar los dispositivos de IO

### Kernel y System calls

El kernel contiene el funcionamiento básico del sistema operativo, es la parte central del sistema operativo. La manera que tiene una aplicación de usuario de interactuar con el kernel es con **system calls** (por ej malloc en c, en realidad malloc es un *wrapper* de una syscall, envuelve una o mas llamadas al sistema)

El kernel no ofrece directamente acceso a la memoria por seguridad. Por eso nos ofrece las syscalls.

![[Pasted image 20230109152950.png]]

Las instrucciones que provee el sistema operativo se dividen en instrucciones normales o instrucciones privilegiadas, las syscalls sirven para ejecutar instrucciones privilegiadas.

Para poder ejecutar instrucciones privilegiadas el sistema operativo debe *cambiar de modo*, en este caso, de modo usuario a modo kernel. El modo de ejecución queda almacenado en el PSW, hay un bit que indica si estamos en modo usuario o modo kernel.
Se pasa a modo kernel cuando se genera una interrupción o cuando llamamos una syscall. La forma mas comun de volver a modo usuario es restaurando el contexto que se venía ejecutando antes.

### Estructura del SO

![[Pasted image 20230109154529.png]]

Si dejo el kernel muy chiquito es menos probable de tener un fallo en el mismo. Dejando mas cosas en modo usuario el sistema es mas robusto. Pero las interacciones entre procesos de usuario pasan siempre por el kernel y esto nos produce *overhead* porque hay mucho cambio de modo y contexto.

### Preguntas del final
- Las interrupciones son asincrónicas y de HW