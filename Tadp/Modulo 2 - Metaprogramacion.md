# Metaprogramación

Muy anexada al *metamodelo* del lenguaje de programación que estemos utilizando. Un programa que construye otro programa.

- Introspection: Capacidad de un programa de analizarse a si mismo, o la capacidad de un lenguaje a entender lo que el usuario escribió. Que los objetos puedan verse como la meta-construcción como fueron modelados.
- Self-modification: Capacidad de un programa de cambiarse a si mismo, es complejo en general. Un programa que se puede modificar a si mismo, puede generar una clase nueva en ejecución.
- Interscesion: Variante de self-modification, es la capacidad de un lenguaje de modificarse a si mismo. Ej: añadir traits a un lenguaje que no los tiene.

Ruby es super destructivo, todas las declaraciones que se escriban pisan a las anteriores. Scala es mas declarativo, es mas dificil modificarlo.

## Metamodelo

El modelo sobre el cual se monta el modelo que uno programa. Para tener clases necesito la idea primero de clase. Cualquier funcionalidad que querramos tener en el lenguaje, tenemos que tener algo en el metamodelo que lo permita (como mixins o traits, que necesitan esa idea para poder funcionar)

```ruby
atila = Guerrero.new
atila.class

atila.is_a? Guerrero
````

Para que *atila* nos responda de que clase es, necesitamo una manera de representar las clases. Una de las maneras de hacer esto es tener un objeto para representar una clase, esto es lo que hace Ruby. Esto podemos verlo porque a lo que nos devuelve `atila.class` podemos hacerle un `.new`

---
Otros lenguajes hacen algo como

```ruby
atila = new Guerrero(...)
```
En donde ya las clases no son objetos y por esto necesito esta palabra reservada para instanciar objetos. Introduce la idea de `constructor`

---
## Ejemplos en clase

```bash
pry > atila.instance_variables
=> [:@energia, :@pot_defensivo, :@pot_ofensivo]

pry > atila.instance_variable_get(:@energia)
=> 50

pry > atila.instance_variable_set(:@energia, 100)
=> 100

pry > atila.instance_variable_set(:@sombrero, true)
=> true // esto agrega un atributo que antes no existia

pry > atila.methods
=> [:energia, :energia=, is_a?, ...]
// muy mal nombre ya que nos devuelve mensajes no method

pry > atila.send(:sufrir_danio, 30)
=> -10
// se ejecuta el mensaje enviado, pero a diferencia de
// atila.sufrir_danio, el .send usa parametros que no 
// estan hardcodeados

pry > atila.send('potencial' + '_' + 'ofensivo')
=> 20
// !!! No necesito saber la interfaz de un objeto para 
// hablar con el, puedo iterar una coleccion y enviarle
// mensajes


pry > metodo = atila.method(:sufri_danio)
=> #<Method: bla bla bla>
// Esto es un objeto que representa el mensaje enviado

pry > metodo.arity
=> 1
// cantidad de parametros

pry > metodo.owner
=> Defensor
// nos dice donde esta definido

pry > metodo.receiver
=> atila
// nos dice quien recibe este metodo (Bounded Method)
// esta anexado a atila

pry > metodo.call(10)
=> 80
// se ejecuto el metodo

pry > metodo_unbound = metodo.unbind
=> #<Method ...>
// devuelve un metodo sin bindear

pry > metodo_unbound.receiver
=> Error: undefinded method

pry > metodo_unbound.bind(atila).receiver
=> atila



pry > Guerrero.methods
=> [new, superclass, ...]

pry > Guerrero.instance_methods
=> [sufrir_danio, energia, energia=, ...]


pry > atila.class.define_method(:comete_un_pollo) do
	> 	"que rico"
	> end
=> :comete_un_pollo
// agrego un metodo nuevo en un objeto, por lo tanto a 
// la clase guerrero

pry > Guerrero.new.comete_un_pollo
=> 'que rico'

```

El mensaje es un nombre con el cual el objeto hace el *method-lookup* por el cual se encuentra el método, que es la operación a realizar.

## Method-lookup

Hay que encontrar la manera de buscar los metodos de un objeto en su clase o superclase.

![[Pasted image 20220903122051.png]]

Este es el caso de lenguajes donde las clases no son objetos. 
En Ruby es algo mas parecido a esto

![[Pasted image 20220903130223.png]]

Pero cuando agregamos metodos de clase
```ruby
class Guerrero
	def self.guerrero_especial
		instancia = self.new
		instancia.energia = 1000
		...
	end
end

Guerrero.guerrero_especial

// Esto es un metodo de clase
```

![[Pasted image 20220903130701.png]]
Aparecen las *autoclases*, que se generan dinamicamente, a medida que se necesitan. Ahora cualquier objeto puede tener mensajes que entiende solo el. Lo mismo pasa con las clases. En vez del paso azul damos el paso **verde**

```bash
pri > atila.singleton_class.superclass
=> Guerrero

pri > atila.define_singleton_method(:saludar)
=> :saludar
```

SI los mixines deben entender un mensaje lo ponemos en Module, sino lo podemos meter en Object.

--- 

# CLASE 2 - Metaprogramación
---

## Excepciones y method-missing

Cuando el method-lookup no encuentra un método, los lenguajes suelen lanzar una *excepción* o un error. Pero, por qué? Esto podría manejarse de muchas maneras, no necesariamente lanzar una excepción es la solución a esta problemática. La diferencia entre un error como una llamada al sistema y una excepción, es que la excepción puede ser manejada por el programador por ser una abstracción del lenguaje.

Ruby usa excepciones, pasandole el mensaje `method-missing` al objeto receptor (por ej: atila, el cual podría tener este mensaje overrideado o no, si no lo tiene el method lookup llegaría hasta BasicObject de nuevo), el cual lanza una excepción. 

Ejemplo del registrador de mensajes del carrito de compras. (ver si esta en github)
Pareciera que el registrador no entiende ningún mensaje pero a la vez entiende todos. Sin embargo, un problema es que si mandamos un mensaje como `to_s` , la clase Object lo entiende por lo cual el registrador no puede capturarlo. Para esto, se podría hacer que el registrador herede de BasicObject.
```bash
pry > registrador.respond_to? :agregar_producto
=> false

# si redefinimos el metodo respond_to_missing? 
pry > registrador.respond_to? :agregar_producto
=> true
```
method-missing es un ultimo recurso.

## Bloques | Lambdas | Closures en Ruby

### Contextos

Existen 3 situaciones para definir un contexto nuevo en ruby
- Definir una clase usando `Class`
- Definir un modulo o mixin usando `Module`
- Definir un metodo usando `def`

```ruby
saludo = 'hola mundo'

def saludar_mundo
	puts saludo
end

# esto devuelve un error por estar en otro contexto
saludar_mundo.saludo
```
Una manera de agarrar variables del contexto padre es usar un *closure*, un código o abstracción que es dependiente del contexto.
```ruby

saludo = 'hola mundo'

define_method(:saludar) do
	puts saludo
end

# esto no falla por el closure
saludar

---
x = 10

una_clase = Class.new do
	x += 5
end

# esto nos devuelve 15
puts x
```

La *lambda* y los *procs* sirven para llevarse el contexto a otro lado, como se captura el contexto, si cambiase el valor de saludo, cambiaría tambien en los lambda y procs.
```ruby
mi_lambda = lambda { puts saludo }
mi_lambda.call

mi_proc = proc { puts saludo }
mi_proc.call
```
Las lambdas y procs son objetos, los bloques no. 

```ruby
# los procs ejecutan sin importar la cantidad de parametros
mi_proc = proc { |x| puts x }
mi_proc.call
mi_proc.call(1)
mi_proc.call(1,2,3)

# los lambdas rompen cuando no se les provee la cantidad de
# argumentos que esperan
mi_lambda = lambda { |x| puts x }
mi_lambda.call
mi_lambda.call(1)
mi_lambda.call(1,2,3)

pry > mi_lambda.class
=> Proc
```

Otra diferencia que tienen los lambdas y los procs es la manera en que manejan el `return` . En los procs el return queda bindeado al contexto donde se llamo el proc, osea si lo llamo en cierto método estoy haciendo return de este método. Las lambdas salen del contexto de si mismas.
La idea que desde adentro de un bloque puedas romper la ejecución que la contiene es muy hardcore, puede traer muchos problemas.

---

En ruby los metodos no son ciudadanos de primer orden. El envío de mensaje no es algo que pueda guardar en una variable. Una lambda me sirve para hacer algo de ese estilo. La gran mayoría de las cosas necesitan ser reificadas para convertirse en ciudadanos de primer orden.

```ruby
Class.new do
	...
end
```

Todos los métodos pueden recibir un bloque, el cual no es un objeto por lo que no es un parámetro tampoco. Ruby *reifica* los métodos, los convierte en objetos. Y ademas, un envío de mensaje en ruby está conformado con un nombre, ciertos parámetros y un bloque. En ruby es lo mismo usar `do ... end` que `{ ... }`

```ruby

def yield_test
	# el yield agarra el bloque y le aplica call con un parametro
	yield(3)
	yield('hola')
end

yield_test do |x|
	puts x
end




# el '&' indica que se convertira el bloque en un proc
# es la manera de reificar el bloque y convertirlo en un objeto
# debe ser el ultimo 'parametro' del metodo
def bloque_test(&bloque)
	bloque.call(3)
end

bloque_test do |x|
	puts x
end
```


Entonces, como está definido `Proc`?
```ruby
def proc(&bloque)
	bloque
end
```

Si quiero pasar de un proc a un bloque
```ruby
mas = proc { |x| x + 1}

# en este caso el '&' transforma el proc a un bloque
[1,2,3].collect(&mas)
```

Pregunta de joaco
```ruby
def m(proc = nil, &bloque)
	# ambos parametros son procs 
	...
end
```

Self en los bloques? Es como 'rebindear' el bloque
```ruby

bloque_nombre = proc { |nombre| puts nombre}

roberto = Persona.new('roberto')
roberto.instance_eval(&bloque_nombre)
```