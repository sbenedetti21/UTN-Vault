Para convertir una señal de entrada analógica a una señal digital se realiza un proceso de muestreo, cada x tiempo se saca una muestra para crear una función muestreada.


Bloque RTU 
![[Pasted image 20230608191838.png]]

Sistemas causales -> dependen del instante actual y del inmediato anterior
$$X(t) = u(t) + u(t-1)$$
Sistemas estrictamente causal -> dependen del instante anterior
$$X(t) = u(t-1)$$



Reten de orden cero (ZOH): Es lo que usa el conversor digital analógico.
$$\frac{1-e^{ts}}{s}$$ 
## Transformada Z

![[Pasted image 20230608194826.png]]

Teorema del valor inicial y Teorema del valor final

![[Pasted image 20230608200234.png]]

