# Circuito RC

Ley de kirchoff: La suma de las tensiones parciales es igual a la tensión total.
![[Pasted image 20230420194046.png]]

En este circuito podemos plantear $V - V_R - V_C = 0$, por ley de kirchoff.
A su vez por estar en serie $i_R = i_C = i$

En el capacitor:
$q = CV_C$
derivando -> $i_C = C\frac{dV_C}{dt}$

Llegamos a este desarrollo:
![[Pasted image 20230420194433.png]]

$$V - V_C = RC\frac{dV_C}{dt}$$
Siguiendo un proceso de integración y despejando nos queda:
$$V_C(t)=V(1 - e^{\frac{-t}{RC}})$$

Nos permite analizar la respuesta del capacitor mientras se va cargando:
![[Pasted image 20230420195251.png]]

$\tau$ (*tau*, constante de tiempo) es el valor de $t$ para que el exponente de $e^{\frac{-t}{RC}}$ valga -1. Osea en este caso es igual a $RC$

$V_C(\tau) = V(1-e^{-1}) = 0,63V$
$V_C(4\tau) = V(1-e^{-1}) = 0,98V$

El $\tau$ sirve para establecer el *tiempo de establecimiento* $t_s$, el cual es el tiempo que tarda el sistema en llegar a la parte permanente. 

$$t_s=4\tau$$
$\tau$ no depende de la entrada sino de las características del sistema, en este caso de $R$ y de $C$

>El capacitor tiene como principal función comerse los picos de tensión en los circuitos. Se comporta como la masa en un sistema mecánico.

## Trabajando con Laplace

$$V(s) - RCsV_c(s) - V_C(s) = 0$$
Quedando la funcion transferencia de la siguiente manera
$$\frac{V_C(s)}{V(s)} = \frac{1}{RCs+1}$$

Podemos analizar donde está el polo de la función:
![[Pasted image 20230420200906.png]]

> Los sistemas de primer orden solo tienen un polo real y se encuentra en $-1/\tau$

Sabiendo que tengo un solo polo real, la salida del sistema frente a una entrada escalón es una exponencial convergente a un valor.

## Entradas de un sistema

![[Pasted image 20230420201824.png]]

Las que mas se aplican en la realidad son impulso y escalón.

## Aplicando TVI y TVF al ejemplo

### Teorema del valor inicial
![[Pasted image 20230420201332.png]]

### Teorema del valor final
![[Pasted image 20230420201403.png]]


Nuestra entrada es un escalón $V(s)=V/s$ 

Podemos calcular el valor inicial y final:
![[Pasted image 20230420202242.png]]

# Impedancia

Trabajando con Laplace podemos conseguir las impedancias de cada uno de los elementos del circuito RCL.

Resistencia ->
$V(t) = R i(t)$
$V(s) =R i(s)$
$$Z_R=R$$

Capacitor ->
$q(t) = CV_C(t)$
$i_C(t) = C\frac{dV_C(t)}{dt}$
$i_C(s) = CsV_C(s)$
$V_C(s) = \frac{1}{sC} i_C(s)$
$$Z_C=\frac{1}{sC}$$

Inductor ->
$V_L(t) = L\frac{di_L(t)}{dt}$
$V_L(s) = sLi_L(s)$
$$Z_L=sL$$

## Asociación de impedancias

Serie -> misma corriente 
Paralelo -> misma tensión

![[Pasted image 20230420210347.png]]

## Volviendo al ejemplo

La idea es encontrar una única impedancia para encontrar la tensión e ir desenrollando par encontrar la corriente y tensión en cada elemento usando ley de Omh
![[Pasted image 20230420210554.png]]

Esto me dice que la corriente total está relacionada con la tensión de la siguiente manera:

$V = Z_{eq} * i$
$$\frac{i}{V} = \frac{1}{Z_e} = \frac{sC}{RCs +1}$$
al estar en serie las corrientes entre los elementos es la misma $i_R = i_C = i$

Si buscamos la tensión en el capacitor:

$V_C = Z_C * i_C$     ->  (ley de omh)
$V_C = \frac{1}{sC} * \frac{sC}{RCs+1} * V$

Llegando así a la función transferencia del sistema
$$\frac{V_C}{V}=\frac{1}{RCs+1}$$
## Otro ejemplo

Vamos a tratar siempre de ir simplificando el circuito desde la parte más lejana a la fuente.

![[Pasted image 20230420211711.png]]
![[Pasted image 20230420211832.png]]

Luego de simplificar el circuito, llegamos a una impedancia total equivalente con la cual podemos plantear la ley de omh y averiguar la corriente que pasa por la fuente. Y así tambien ir "desenrollando" para conseguir la tensión sobre cada elemento.

![[Pasted image 20230420212053.png]]

con esto, al estar en serie los elementos de la segunda simplificación puedo averiguar la tension en $Z_{eq1}$
$$i_{Z_{eq1}} = i_{R_1} = i$$
![[Pasted image 20230420212301.png]]

Como los elementos que formaron $Z_{eq1}$ están en paralelo, su tensión es la misma.
$$V_{Z_{eq1}} = V_L = V_{R_2}$$
![[Pasted image 20230420212634.png]]

Con este desarrollo llegamos a esta expresión que nos permite saber (aplicando tvi, tvf) el valor inicial, final, etc.