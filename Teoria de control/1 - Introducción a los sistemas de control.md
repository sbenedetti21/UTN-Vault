Software que vamos a utilizar:
- Mathlab
- Simulink

# Sistemas de control

Un sistema de control no es algo que es autómatico como se suele creer. Para que un sistema sea controlado se debe poder medir alguna variable de salida y modificar el comportamiento interno para corregir esa salida segun lo determina la entrada.

Se conoce como *error* a la diferencia entre mi valor deseado de salida y el valor real de esa salida.

Algunos sistemas de control pueden controlarse automaticamente por la realimentacion de su salida.

![[Pasted image 20230330200152.png]]
Modelo de bloques de un sistema de control. $T$ es la funcion de transferencia, tambien llamada $G$. Este es un modelo de lazo abierto, no hay retroalimentación.

## Clasificación de los sistemas de control

- Lineales: La salida es lineal con respecto a la entrada. Típico con una ganancia.
- No lineales: No vamos a trabajar con estos.
- Continuos: Infinitos valores en el tiempo, simil analógicos. El control es continuo en el tiempo.
- Discretos: El control es en intervalos, en forma discreta.
- Lazo abierto: funcionan por la experiencia o por tiempo. No se mide la salida por lo que no se corrigen desvios de la misma. No son automáticos, pueden participar como susbsitemas de un sistema de lazo cerrado. Tienen la ventaja de ser sencillos y de bajo costo.
- Lazo cerrado: se mide la salida y se corrigen desvios de la misma.

![[Pasted image 20230330203006.png]]
Ej. de circuito a lazo cerrado.

Un *trasductor* es un elemento que transforma una señal en otra para poder utilizarla. Combina magnitudes de dos mundos distintos. Un microfono es un trasductor, transforma las ondas de voz en señales eléctricas.

Una *perturbación* es una señal, generalmente externa, que puede alterar la salida de un sistema.

![[Pasted image 20230330210704.png]]

## Estrategias de control

- On-Off
- Proporcional: A medida que nos acercamos a la salida esperada vamos regulando la entrada. Ej: flotante.
- Proporcional integral: De acuerdo a la función integral, va sumando lo que paso ahora y lo que pasó en instantes anteriores.
- Proporcional derivativo: Reacciona al cambio en una curva, cambios bruscos. Ej: disyuntor.
- Proporcional integral-derivativo: Combinacion de los anteriores.

## Modelo matemático de sistemas

Podemos modelar un sistema relacionando las entradas y salidas del sistema a lo largo del tiempo. Función Transferencia. Para poder trabajarla se pasa del dominio del tiempo al dominio de Laplace (s).

$$F(t) = \frac{Salida En Estado Estable}{Entrada EnEstadoEstable}$$

![[Pasted image 20230330205555.png]]

![[Pasted image 20230330210149.png]]
La funcion de transferencia global es el producto de los elementos en serie.

$$T_G (R -) = \frac{T_d}{1+T_dT_r}$$
$$T_G(R+) = \frac{T_d}{1-T_dT_r}$$

![[Pasted image 20230330212345.png]]
Ejemplo de calculo de transferencia global con valores en el estado estable.

## Perturbaciones

![[Pasted image 20230330213346.png]]
Perturbacion en un sistema de lazo abierto.

La perturbación se modela en un punto suma, debería ser un (+) , se suma a la salida anterior, lo cual la convierte en parte de la entrada al próximo elemento.

Los sistemas de lazo cerrado son mas resistentes a las perturbaciones ya que miden la salida y pueden realizar correcciones sobre la misma. Cuentan con un *factor de rechazo* a la perturbación.

$$FactorRechazo = \frac{1}{1+TR}$$

## Error en estado estable

![[Pasted image 20230330215146.png]]

Ver ejemplos en bolton pag 39

Condicion de estabilidad
![[Pasted image 20230330215948.png]]

## Sensibilidad a cambios en los componentes

Bolton pagina 43

Cuando son a lazo abierto la sensibilidad afecta directamente a la salida del sistema. En el caso de los sistemas de lazo cerrado si la sensibilidad es en la trayectoria directa casi no afecta, porque se va a medir esa fluctuacion, el problema esta cuando la sensibilidad afecta en la realimentacion ya quie vamo s a estar corrigiendo mal.

No confundir sensibilidad con perturbacion. La sensibilidad son cambios en los valores de las transferenfcias.