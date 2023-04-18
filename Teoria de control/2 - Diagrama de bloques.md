
Un *modelo* es una representación de la realidad por medio de un andamiaje matemático.

Los sistemas pueden ser
- Lineales
- No lineales
- Variantes
- Invariantes: Las constantes no cambian a lo largo del tiempo. Medio irrealista.
- Siso
- Mimo

Estudiaremos sistemas lineales, invariantes y SISO.

# Diagrama de bloque

El control puede ser a lazo abierto o a lazo cerrado.

Diagrama de lazo cerrado a *alto nivel*
![[Pasted image 20230413192957.png]]

Lo que uno busca en un sistema a lazo cerrado es que la salida sea igual que la entrada lo mas rápido posible. Si coloco un escalón espero una salida escalón.

En los sistema a lazo cerrado el control puede ser
- On/Off
- Proporcional
- Integral
- Derivativo
o combinaciones de estos últimos.

Para poder tener control PID tengo que poder ir variando mi salida, una heladera en general trabaja on/off.

## Diagrama de bloques de bajo nivel

El diagrama de lazo cerrado a *bajo nivel* representa relaciones matemáticas, es una herramienta gráfica para combinar ecuaciones

![[Pasted image 20230413195014.png]]
La idea principal es llevar todo diagrama de bloques a una función transferencia ($G$) que relacione la entrada y la salida. Es importante el estudio de los polos para saber como va a responder el sistema.


Esto se transforma hacia ---------------------------------->> esto
![[Pasted image 20230413195414.png]]
![[Pasted image 20230418100030.png]]

![[Pasted image 20230413200241.png]]
Ojo, si la retroalimentación es positiva, el denominador llevaría un $-$

![[Pasted image 20230413200641.png]]

![[Pasted image 20230413203208.png]]

# Sistemas de primer orden

Todos los sistemas de primer orden tienen un acumulador de energía y están descriptos por una ecuación que representa eso y por otra similar a la ley de Ohm
![[Pasted image 20230413205733.png]]

## Sistema de nivel

Consiste en un tanque que se va llenando de un líquido pero que ademas tiene una descarga. Tenemos un caudal de entrada, un caudal de salida, una altura de líquido, la resistencia de la valvula y la capacidad del tanque.
![[Pasted image 20230413205611.png]]

$$C_h = \frac{Vol_{liq}}{h}$$
En el tiempo entra y sale líquido, tenemos una ecuación como esta:
$$Vol_{liqi}(t) - Vol_{liqo}(t) = C_hh(t)$$
derivando:
$$q_i(t)-q_o(t) = C_h \frac{dh(t)}{dt}$$

 
 

 La otra ecuación es la de la resistencia de la válvula:
 
 ![[Pasted image 20230413210405.png]]
 $$R_h = \frac{\Delta P}{q_o}$$
 en el tiempo: $$P_1(t) - P_2(t) = q_o(t)R_h$$
 La $P_1$ depende de la columna de agua que está sobre ese punto, la cual depende de la densidad, la gravedad, la altura y la presión atmosférica. Por esto mismo, la ecuación en nuestro ejemplo termina quedando: $$dgh(t) = q_o(t)R_h$$
 Pasamos a Laplace:
$$q_i(s)-q_o(s) = C_h h(s)s$$
$$dgh(s) = q_o(s)R_h$$

Armando el diagrama de bloques:
Siempre se arranca por la ecuación que contiene a la entrada. Nuestra transferencia va a ser $h/q_i$
En los bloques van las constantes y en los hilos van las variables o señales que varían en el tiempo.

![[Pasted image 20230413212551.png]]

Lo cual resulta en la transferencia:
![[Pasted image 20230413212933.png]]

Para sacar el polo igualamos el denominador a 0 y despejamos $s$
