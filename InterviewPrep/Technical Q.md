# Preguntas español
---

## ¿Cuál es el significado semántico de las etiquetas? Nuevas etiquetas HTML5
El significado semántico de las etiquetas HTML es importante, ya que ayuda a la legibilidad del documento, crea un contenido ordenado y estructurado. Además, el buen uso semántico de las etiquetas permite que las páginas web sean mejor indexadas por los buscadores. El uso de `div` en todos los elementos es una mala práctica, para eso se instauraron nuevas etiquetas en HTML5 como `header`, `footer, `nav`, `section`, `figure`, etc.

## Accesibilidad web (alt y atributo aria label)
Con el atributo `aria-label` podemos proporcionar una etiqueta a cualquier tecnología de asistencia en caso que un usuario con una discapacidad en la vista visite nuestra web. El atributo `alt` cumple este mismo rol en las imagenes.

## Responsive web design
La idea de responsive es que las páginas se vean bien en cualquier dispositivo, tanto computadoras como celulares. La principal etiqueta para empezar a construir una web responsive es la siguiente:
```
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
Luego se pueden agregar mas estilos usando `@media` querys dentro de CSS.

## Especificidad. Un ejemplo de código identificando algo por clase, tipo o id y ver cuál tiene más especificidad.
Si hay dos o mas reglas de CSS que apuntan al mismo elemento, el estilo final del elemento será el que provenga del selector con mas especificidad.

Orden de selectores:
-   **Inline styles** - Example: `<h1 style="color:pink">Hello</h1>`
-   **IDs** - Example: `#navbar`
-   **Classes, pseudo-classes, attribute selectors** - Example: `.test, :hover, [href]`
-   **Elements and pseudo-elements** - Example: `h1, :before`

Si se usa el `!important` este sobreescribirá hasta los inline styles. No es recomendable.

## ¿Por qué se llama hoja en cascada?
Justamente debido a la especificidad en los selectores es que se llama hoja en cascada, el estilo que se le va a aplicar a un elemento es predecible. Las reglas van en cascada, tienen una jerarquía.

## ¿Cómo ocultar elementos?
`display: none` : remueve el elemento por completo
`visibility: hidden` : oculta el elemento pero el espacio ocupado sigue siendo el mismo

## Pseudo selectores y elementos. Con ejemplo
- Pseudo selectores: `:hover, :visited, :active, :first-child, :first-of-type`, etc
- Pseudo elementos: `::before, ::after, ::marker, ::selection, ::first-letter, ::first-line`

## ¿Cuál es la diferencia entre grid y flex?
#### Flex
Funciona en 1 dimensión aunque podemos usar `wrap`. Es mas *flexible*. Usualmente hay que aplicar estilos a los hijos del flex-container. Para *Navbar* es mas cómodo, por *intrinsec sizing* (fit-to-size).

#### Grid
Funciona en 2 dimensiones, las columnas se mantienen iguales. Es mas estructurado. Casi todos los estilos se aplican al grid-container. Funciona mejor para cuando queremos un sistema que sea rígido y para grandes layouts.

![[flexvdgrid.png]]

## ¿Qué es svg?
Un scalable vector graphic (SVG) es una composición de vectores que forma por ejemplo una imagen o un logo, son escalables porque al agrandarlos no pierden calidad por estar compuestos por vectores. Interesantes porque se pueden modificar en tiempo de ejecución. Se puede crear cualquier tipo de forma con svgs.

## ¿Cuál es la diferencia entre Media queries y BreakpointsSS?
Los **media queries** son usabdos para modificar la aplicación web en base a el dispositivo que la renderiza, basado en resolución de pantalla o ancho del view port por ejemplo.
Los **breakpoints** se usan en conjunto con los media queries para, sobre todo, aplicar estilos dependiendo del tamaño de la pantalla.

```
@media print { ... }

@media screen and (max-width: 1200px) { ... }

@media (orientation: landscape) { ... }

```

## ¿Cuáles son las diferencias entre los estilos css, sass, less?
**SASS** y **LESS** son preprocesadores de CSS, nos permiten detallar los estilos de una manera mas cómoda y ordenada, cada uno con sus ventajas  y desventajas. Gran uso de *mixins* para no repetir código y ser consistente.
Nos dan cantidad de opciones adicionales como: variables, funciones matemáticas, funciones, bucles, mixins, etc. 
Lo malo es que deben ser compilados.


## Declaration y expression functions. sintaxis y diferencia en hoisting
Las **Functions declarations** tienen hoisting pero las **Functions expressions** no.
 
 ![[funcExpressionVSDeclarations.png]]
 
 Las expressions son mejores para cuando no queremos *contaminar* el scope global. Cuando necesitamos una función una vez y despues la descartamos, no quedan almacenadas como las declarations. 
 

## Definición hoisting

## Definición scope

## Ejemplo con código de bubbling y delegación de eventos

## Nuevas cosas de ES6. Diferencia entre map y for each

## ¿Qué es coerción? Ejemplos

## Definir callback, promesas y async-await

## Hablar de asincronismo en general

## Closures

## iife
The name — **immediately invoked function expressions** — pretty much says it all here. When a function is created at the same time it is called, you can use an IIFE.

```
(function() {...})()

or

(() => {...})()
```

...


## Prototypes y clases.

## Local y session storage

## Nombrar tres librerías de Javascript (must have)

  ---

# REACT

  ---

## ¿Cuál es la diferencia entre componente de clase y funcional?

## Describir la sintaxis de un componente de clase.

## ¿Por qué se le pone la prop key cuando se usa la función map?

## Hooks

## ¿Cuál es la diferencia entre redux y redux Thunk?

## ¿Por qué utilizar react y no angular? ¿Cuáles son sus diferencias?

## ¿Cuándo usar react native o cambiar a kotlin y swift?

## ¿Qué es Redux?

## ¿Que es doc type?

## ¿Qué evalúas antes de migrar un proyecto de js vanilla a react/vue/angular?

## Deployment: Tipos de deploy, bases de datos relacionales, no relacionales y cuáles son sus diferencias.

## ¿Cuáles son las herramientas utilizadas para metodologías ágiles?

## ¿Qué harías si el código que escribiste estalla en producción?

## ¿Qué nuevas tecnologías te gustaría incorporar a corto plazo? ¿Por qué?

## ¿Qué es singleton? ¿Utilizas los principios solid?

## ¿Qué es PWA?

## Sobre Git: status, log, add, fork, rebase

## ¿Qué es el block model en css?

## ¿Qué determina la usabilidad de una aplicación?

## ¿Qué es la integración continua? ¿TDD?

## ¿Qué tipo de funciones existen en nodeJS?

## ¿A qué es equivalente el useEffect en componentes de clase?

## ¿Por qué usar un estado en lugar de una variable?

## ¿Por qué usar useState en lugar de useRef para guardar algo?

## ¿NodeJs es multi o single threah?

## ¿De qué se trata la programación orientada a objetos?

## ¿Cómo crees que va a desarrollarse a futuro el frontend?

## SQL, indices, joins, FK, PK

  
---
# PREGUNTAS INGLÉS

  ---

## ¿What did you learn this week?

## ¿What excites or interests you about coding?

## ¿What is a recent technical challenge you experienced and how did you solve it?

## ¿When building a new web site or maintaining one, can you explain some techniques you have used to increase performance?

## ¿Can you explain any common techniques or recent issues solved in regards to front##d security?

## ¿What actions have you personally taken on recent projects to increase maintainability of your code?

## Talk about your preferred development environment.

## ¿Which version control systems are you familiar with?

## ¿Can you describe your workflow when you create a web page?

## If you have 5 different stylesheets, ¿how would you best integrate them into the site?

## ¿Can you describe the difference between progressive enhancement and graceful degradation?

## ¿How would you optimize a website's assets/resources?

## ¿How many resources will a browser download from a given domain at a time? What are the exceptions?

## Name 3 ways to decrease page load (perceived or actual load time).

## If you jumped on a project and they used tabs and you used spaces, ¿what would you do?

## Describe how you would create a simple slideshow page.

## If you could master one technology this year, ¿what would it be?

## Explain the importance of standards and standards bodies.

## ¿What is Flash of Unstyled Content? ¿How do you avoid FOUC?

## Explain what ARIA and screenreaders are, and how to make a website accessible.

## Explain some of the pros and cons for CSS animations versus JavaScript animations.

## ¿What does CORS stand for and what issue does it address?

## ¿What resources do you use to learn about the latest in front end development and design?

## Explain the difference between cookies, session storage, and local storage.