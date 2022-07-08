# Calculo de raices de ecuaciones
- Para biseccion o Bolzano
	- Son *suficientes* n iteraciones siendo n -> $\frac{b-a}{2^n} < \epsilon$
- Condiciones para poder analizar por punto fijo:
	- Converge si $|g'(x)| < 1$ -> Con esta es suficiente
	- $g(x)$ continua en el intervalo \[a, b]
	- Toda imagen de g se encuentra en el intervalo (asi ninguno se nos escapa)

La mayoria de los metodos se toman de manera teorica, en general piden resolver por newton raphson, en general.
NewtonRaphson: $$ x_{i+1} = x_i - \frac{f(x_i)}{f'(x_i)}$$

Asegurar la calculadora en radianes.

# Sistemas de ecuaciones lineales
- Norma infinito -> Suma en fila de modulos
- Norma 1 -> Suma en columna de modulos
- Sistema bien condicionado -> $K(A) = ||A|| ||A^{-1}||$ Si K es grande, el sistema es inestable, no esta bien condicionado.
- T y C de Jacobi y de Gauss-Seidel

# Interpolación
- Ver el ejercicio de a y b
- Siempre se toma lo mismo, lo de las incognitas

# Aproximación
- Ventajas de Legendre
	- Se evita el sistema de ecuaciones que se puede volver complicado para muchas variables. Cada integral y cada variable son independientes de las otras
	- Se llega a la **misma** función de ajuste
	- Fácil para ir sumando grados: Si calcule a0 y a1 para una recta los puedo usar para la parábola agregando el a2
- Desventajas de Legendre
	- Integrales pueden volverse complicadas
	- Hay que recordar los polinomios de legendre
	- Nos exije trabajar en el intervalo \[-1 ; 1]
- Cambio de variable para Legendre: $x = \frac{a+b}{2} + \frac{b-a}{2}  t$

Acordarse de volver a x xuando se cambia a t

# Integración numerica
- Cuando se puede resolver por trapecio, o por simpson?
	- $N = \frac{b-a}{h}$
		- Con N entero y par, se pueden ambos
		- Con N entero impar, solo trapecio
		- Con N no entero, no puede ninguno

Funciones impares o impares corridas con SImpson, se van cancelando los errores si n es par, por lo que el resultado es exacto.
