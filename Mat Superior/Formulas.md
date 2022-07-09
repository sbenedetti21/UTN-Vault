# Cálculo de raices de ecuaciones
Criterios de paro:
-	si $f'(x) >= 1$   ==>   $|f(x_n)| < \varepsilon$
-	si $f'(x) < 1$   ==>   $|x_{n+1} - x_n| < \varepsilon$

**Bisección** -> Son *suficientes* n iteraciones siendo n -> $\frac{b-a}{2^n} < \varepsilon$

**Regula Falsi** -> $sg[f'(x)] = sg[f''(x)]$ fijo extremo b, sino a.
- $x_{n+1} = b - \frac{b-x_n}{f(b)-f(x_n)} f(b)$ y $x_0 = a$ -> extremo fijo en b
- $x_{n+1} = a - \frac{x_n-a}{f(x_n)-f(a)} f(a)$ y $x_0 = b$ -> extremo fijo en a

**Punto fijo** -> $x_{n+1} = g(x_n)$
- Converge si $|g'(x)| < 1$ -> Con esta es suficiente
- $g(x)$ continua en el intervalo \[a, b]
- Toda imagen de g se encuentra en el intervalo (asi ninguno se nos escapa)

**Newton-Raphson** -> $x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$
- Von misses es una variante que deja fija la derivada primera en un punto $x_0$
- Para raíces múltiples
	-  $x_{n+1} = x_n - m\frac{f(x_n)}{f'(x_n)}$ siendo m el grado de la raíz
	-   $x_{n+1} = x_n - \frac{f(x_n)f'(x_n)}{(f'(x_n))²-f(x_n)f''(x_n)}$

**Secantes** -> $x_{n+1} = x_n - \frac{x_n-x_{n-1}}{f(x_n)-f(x_{n-1})}f(x_n)$ 

# Sistemas de ecuaciones lineales
- Norma infinito -> Suma en fila de modulos
- Norma 1 -> Suma en columna de modulos
- Norma 2 -> $\sqrt{\rho(A^t . A)}$ siendo $\rho$ radio espectral
- Diagonalmente dominante si el numero en la diagonal es siempre mayor o igual que la suma de la fila
- Sistema bien condicionado -> $K(A) = ||A||.||A^{-1}||$ Si K es grande, el sistema es inestable, no esta bien condicionado.
- Radio espectral es el mayor valor real positivo de los autovalores de A.
- GaussSeidel -> $T = (D-L)^{-1} U$ y $C = (D-L)^{-1} B$

# Interpolación
> **Teorema: Existencia y unicidad del polinomio interpolante**
> Dados $x_0,x_1,...,x_n$ un conjunto de n+1 puntos y sus imágenes => existe un único polinomio de grado menor o igual que n que los interpola

**Lagrange**
$Li(x) = (x − x_0 )(x − x_1 ) … (x − x_{i-1} )… (x − x_𝑛 )$
$P(x) = a_0L_0(x) + a_1L_1(x) + ... + a_nL_n(x)$
$a_i=\frac{y_i}{L_i(x_i)}$

![[Pasted image 20220708185018.png]]

**Newton-Gregory** -> Triángulo con las diferencias divididas.

# Aproximación | Mínimos cuadrados
## Discretos
- Lineal -> $y = ax + b$

$$\begin{cases}
  a \sum{x_i²}+b \sum{x_i} = \sum{x_iy_i} \\
  a \sum{x_i}+b.n = \sum{y_i}    
\end{cases}$$

- Polinómica (grado 2) -> $P(x) = a_o +a_1x + a_2x²$

$$\begin{cases}
  a_0n+a_1 \sum{x_i}+a_2 \sum{x_i²} = \sum{y_i} \\
  a_0 \sum{x_i}+a_1\sum{x_i²}+a_2\sum{x_i³} = \sum{x_iy_i} \\
  a_0\sum{x_i²}+a_1\sum{x_i³}+a_2\sum{x_i⁴} = \sum{x_i²y_i}
\end{cases}$$

- Exponencial -> $y = be^{ax}$

$$\begin{cases}
  a \sum{x_i²}+B \sum{x_i} = \sum{x_iln(y_i)} \\
  a \sum{x_i}+B.n = \sum{ln(y_i)}    
\end{cases}$$
Ojo: $B = ln(b)$ => $b = e^B$

- Potencial -> $y = bx^a$

$$\begin{cases}
  a \sum{ln(x_i)²}+B \sum{ln(x_i)} = \sum{ln(x_i)ln(y_i)} \\
  a \sum{ln(x_i)}+B.n = \sum{ln(y_i)}    
\end{cases}$$
Ojo: $B = ln(b)$ => $b = e^B$

- Hiperbólica -> $y=\frac{a}{b+x}$

$$\begin{cases}
  a \sum{x_i²}+b \sum{x_i} = \sum{\frac{x_i}{y_i}} \\
  a \sum{x_i}+b.n = \sum{\frac{1}{y_i}}    
\end{cases}$$

- Crecimiento de saturación -> $y=\frac{ax}{b+x}$

$$\begin{cases}
  a \sum{\frac{1}{x_i²}}+b \sum{\frac{1}{x_i}} = \sum{\frac{1}{x_iy_i}} \\
  a \sum{\frac{1}{x_i}}+b.n = \sum{\frac{1}{y_i}}    
\end{cases}$$

## Continuos
- Lineal, Recta en intervalo \[a; b] -> $a_o + a_1x$

$$\begin{cases}
  a_0 \int_a^b dx + a_1 \int_a^b x dx = \int_a^b f(x) dx \\
  a_0 \int_a^b xdx + a_1 \int_a^b x² dx = \int_a^b xf(x) dx    
\end{cases}$$

- Polinómica, grado 2 ->  $P(x) = a_o +a_1x + a_2x²$

$$\begin{cases}
  a_0 \int_a^b dx + a_1 \int_a^b x dx + a_2 \int_a^b x² dx= \int_a^b f(x) dx \\
  a_0 \int_a^b xdx + a_1 \int_a^b x² dx + a_2 \int_a^b x³ dx = \int_a^b xf(x) dx \\
  a_0 \int_a^b x²dx + a_1 \int_a^b x³ dx + a_2 \int_a^b x⁴ dx = \int_a^b x²f(x) dx     
\end{cases}$$

### Legendre 
Siempre en intervalo \[-1; 1], si realizamos un cambio hacia t, despues de conseguir el polinomio hay que volver a x.
Cambio: $x = \frac{a+b}{2} + \frac{b-a}{2}  t$

Recta -> $P_1(t) = a_0\varphi_0(t) + a_1\varphi_1(t)$
Parábola -> $P_2(t) = a_0\varphi_0(t) + a_1\varphi_1(t) + a_2\varphi_2(t)$

Siendo:

$$a_n = \frac{1}{||\varphi_n(t)||}.\int_{-1}^1 f(t)\varphi_n(t)  dt$$
$\varphi_0(x) = 1$, $||\varphi_0(x)|| = 2$
$\varphi_1(x) = x$, $||\varphi_1(x)|| = \frac{2}{3}$
$\varphi_2(x) = \frac{1}{2}(3x²-1)$, $||\varphi_2(x)|| = \frac{2}{5}$

# Diferenciación e integración numérica
1er diferencia progresiva -> $f'(x_i) = \frac{f(x_{i+1})-f(x_{i})}{h}$
1er diferencia regresiva -> $f'(x_i) = \frac{f(x_{i})-f(x_{i-1})}{h}$
1er diferencia central -> $f'(x_i) = \frac{f(x_{i+1})-f(x_{i-1})}{2h}$

2da diferencia progresiva -> $f''(x_i) = \frac{f(x_{i+2})-2f(x_{i+1})+f(x_{i})}{h^2}$
2da diferencia regresiva -> $f''(x_i) = \frac{f(x_{i})-2f(x_{i-1})+f(x_{i-2})}{h^2}$
2da diferencia central -> $f''(x_i) = \frac{f(x_{i+1})-2f(x_{i})+f(x_{i-1})}{h^2}$

## Métodos de Newton-Cotes
- Cuando se puede resolver por trapecio, o por simpson?
	- $N = \frac{b-a}{h}$
		- Con N entero y par, se pueden ambos
		- Con N entero impar, solo trapecio
		- Con N no entero, no puede ninguno

Siempre trabajamos en $[-1; 1]$

Método simple del trapecio -> $A_t = \frac{h}{2}(y_0+y_1)$
Método compuesto del trapecio -> $A_t = \frac{h}{2}(E + 2M)$
-	$E = y_0 + y_n$
-	$M = y_1 + y_2 + ... + y_{n-1}$

Método de simpson simple -> $A_t = \frac{h}{3}(y_0+4y_1+y_2)$
Método de simpson compuesto -> $A_t = \frac{h}{3}(E+4M+2P)$
-	$P = y_2 + y_3 +...+y_{n-2}$

Funciones impares o impares corridas con SImpson, se van cancelando los errores si n es par, por lo que el resultado es exacto.
Si la derivada segunda es igual a 0 en el intervalo, Simpson y trapecio exacta.
Si la derivada cuarta es igual a 0, Simpson exacto.
- Derivada segunda mayor a 0 -> concava hacia arriba
- Derivada segunda menor a 0 -> concava hacia abajo

# Ecuaciones diferenciales
Liptchitz: $|f(t,y_1) - f(t,y_2)| ≤ L.|y_1 - y_2|$
o tambien -> $L = max |\frac{\partial f(t,y)}{\partial y}|$

**Euler** 
$$\begin{cases}
  w_{i+1} = w_i + h.f(t_i,w_i) \\
  w_0 = a
\end{cases}$$

**Euler modificado | Heun**
$$\begin{cases}
  w_{i+1}^* = w_i + h.f(t_i,w_i) & predictora \\
  w_{i+1} = w_i + \frac{h}{2}(f(t_i,w_i)+f(t_{i+1},w_{i+1}^*)) & correctora
\end{cases}$$

**Runge kutta orden 4**
$$\begin{cases}
  w_{i+1}=w_i+\frac{1}{6}(k_1+2k_2+2k_3+k_4) \\
  k_1 = h.f(t_i,w_i) \\
  k_2 = h.f(t_i + \frac{h}{2},w_i + \frac{k_1}{2}) \\
  k_3 = h.f(t_i + \frac{h}{2},w_i + \frac{k_2}{2}) \\
  k_4 = h.f(t_i + h,w_i + k_3) \\
  w_0 = a
\end{cases}$$