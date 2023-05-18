En el controlador recide la ley de control, que puede ser proporcional, derivativa o integral, o una combinación de los mismos. Recibe la señal de error y produce una salida.

- Proporcional: $G_P = K_P . e(t)$, Funciona dentro de una *banda proporcional*
- Integral: actúa sumando los instantes anteriores, es proporcional a la integral de la señal de error
- Derivativo: detecta cambios bruscos en la señal de error

Cuando combinamos controladores se suman sus salidas y actúan sobre el proceso. En un diagrama de bloques se juntarían en un punto suma.

## Ejemplo práctico

![[Pasted image 20230518194714.png]]
Este es un ejemplo de control proporcional, el error en estado estable nos da 0 ante una entrada escalón, si hacemos la fórmula.

![[Pasted image 20230518194842.png]]
Este ejemplo de control integral, mejoro la situacion frente al error ya que aumento el tipo de sistema, pero agrego un polo más por lo que la estabilidad puede empeorar.

![[Pasted image 20230518195848.png]]
Este ejemplo es un sistema de control proporcional integral, mejora el tipo de sistema, ahora es tipo 2, y ademas de agregar un polo agregamos un cero (ver lugar de raíces), lo cual hace que la estabilidad no se vea modificada. Podemos ver que la estabilidad solo depende de Kp y que es probable que sea estable.

