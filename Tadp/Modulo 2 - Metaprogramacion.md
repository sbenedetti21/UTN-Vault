# Metaprogramación

Muy anexada al *metamodelo* del lenguaje de programación que estemos utilizando. Un programa que construye otro programa.

- Introspection: Capacidad de un programa de analizarse a si mismo, o la capacidad de un lenguaje a entender lo que el usuario escribió. Que los objetos puedan verse como la meta-construcción como fueron modelados.
- Self-modification: Capacidad de un programa de cambiarse a si mismo, es complejo en general. Un programa que se puede modificar a si mismo, puede generar una clase nueva en ejecución.
- Interscesion: Variante de self-modification, es la capacidad de un lenguaje de modificarse a si mismo. Ej: añadir traits a un lenguaje que no los tiene.

Ruby es super destructivo, todas las declaraciones que se escriban pisan a las anteriores. Scala es mas declarativo, es mas dificil modificarlo.

## Metamodelo

El modelo sobre el cual se monta el modelo que uno programa. Para tener clases necesito la idea primero de clase. Cualquier funcionalidad que querramos tener en el lenguaje, tenemos que tener algo en el metamodelo que lo permita (como mixins o traits, que necesitan esa idea para poder funcionar)

```
atila = Guerrero.new
atila.class

atila.is_a? Guerrero
````

Para que *atila* nos responda de que clase es, necesitamo una manera de representar las clases. Una de las maneras de hacer esto es tener un objeto para representar una clase, esto es lo que hace Ruby. Esto podemos verlo porque a lo que nos devuelve `atila.class` podemos hacerle un `.new`

---
Otros lenguajes hacen algo como

```
atila = new Guerrero(...)
```
En donde ya las clases no son objetos y por esto necesito esta palabra reservada para instanciar objetos. Introduce la idea de `constructor`

---
## Ejemplos en clase

```
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
```
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

```
pri > atila.singleton_class.superclass
=> Guerrero

pri > atila.define_singleton_method(:saludar)
=> :saludar
```

SI los mixines deben entender un mensaje lo ponemos en Module, sino lo podemos meter en Object.
