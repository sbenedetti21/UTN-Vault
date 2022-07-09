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


