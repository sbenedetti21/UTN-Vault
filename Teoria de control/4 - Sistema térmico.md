# Modelado de sistema térmico

![[Pasted image 20230427192311.png]]

La capacidad es la cantidad de energía que hay que entregar para modificar la temperatura
$C_\theta = \frac{\Delta E}{\Delta \theta}$
$E_i(t) - E_o(t) = \theta(t) C_\theta$

derivando tenemos:
$Q_i(t) - Q_o(t) = C_\theta \frac{d\theta(t)}{dt}$

aplicando laplace:
$$Q_i(s) - Q_p(s) = C_\theta s\theta(s)$$



La resistencia de la pared esta dada por
$R_\theta = \frac{\Delta \theta}{Q_p}$
$\theta(t) - \theta_{amb}(t) = R_\theta Q_p(t)$

aplicando laplace:
$$\theta(s) - \theta_{amb}(s) = R_\theta s Q_p(s)$$

> Siempre hay algo que empuja, algo que se opone y algo que quiere fluir. Es un comportamiento que se repite en la naturaleza sin importar las partes involucradas.


Armando el diagrama de bloques
![[Pasted image 20230427194017.png]]

Como tenemos dos entradas, vamos a aplicar el principio de *superposición*, el cual nos indica que analicemos el sistema dando valor 0 a una entrada y viendo como reacciona el sistema y luego haciendo lo mismo con la otra entrada, para al final sumar.

Apacigando $\theta_{amb}$
![[Pasted image 20230427194231.png]]
Queda como resultado:
$$\frac{\theta_1}{Q_i} = \frac{R_\theta}{R_\theta C_\theta s + 1}$$


Apacigando $Q_i$
![[Pasted image 20230427194427.png]]
![[Pasted image 20230427194648.png]]
Queda como resultado:
$$\frac{\theta_2}{\theta_{amb}} = \frac{1}{R_\theta C_\theta s + 1}$$

El resultado final es la suma de las respuestas

$$\theta(s) = \theta_1(s) + \theta_2(s)$$
$$\theta(s) = \frac{R_\theta}{R_\theta C_\theta s + 1} Q_i + \frac{1}{R_\theta C_\theta s + 1} \theta_{amb}$$

