# Tipos
## Caracterización de tipos
#### Denotación
- Explicito: Aclarar en la sintaxis del código el tipo de las variables. La *Inferencia* es el proceso de deducción del tipo correcto de las cosas a partir del uso.
- Implícito: Los tipos estan ahí pero no se hace nada denotarlos.

#### Conformación 
- Representacional: Como esta representado por la computadora (en C un string es un entero en memoria)
- Operacional: Pienso en las operaciones que son posibles con ese tipo de dato. Cuando trato de aplicar una operación a un tipo que no puede aplicarlo, podría ser un error de tipo. Casi cualquier cosa es un error de tipo.

#### Definición
- Nominal: Definición basada en nombres, tengo una palabra con la cual me refiero a cada tipo (Java, C#, etc). Aparecen cosas como las *interfaces* para poder darle nombre a ciertas cosas. Las cosas que sean de esta interfaz tienen que aclararlo, la tienen que implementar.
- Estructural: Se mira la forma de la cosa, en vez del nombre. Se miran las operaciones que la cosa entiende.

#### Chequeo
- Estático: No deja ejecutar el programa hasta que los errores de tipo se resuelvan.
- Dinámico: En runtime, eventualmente el sistema rompe cuando le envias un mensaje que no conoce.

## Ejemplo

```scala
// indico que el valor g1 es de tipo Guerrero
val g1: Guerrero = new Guerrero
g1.atacaA(new Guerrero)


// potencialOfensivo como le pusimos val, va a ser un atributo
// Unit es como void
// Los parametros y tipos de retorno de llamada recursiva se tienen que explicitar, otros se pueden inferir
class Guerrero extends Atacable (val: potencialOfensivo: Int = 20) {
	var energia: Int = 100

	def atacaA(otro: Atacable): Unit = ???

	def sufrirDanio(ataque: Int) {
		???
	}
}

trait Atacable {
	var energia : Int
	def potencialOfensivo : Int
}

//Arriba atacaA estaba definido nominalmente, podemos tambiien definirlo estructuralemten de la sgte manera
def atacaA(otro: {
	var energia : Int
	def potencialOfensivo : Int
}) = {???}

// o tambien..., lo cual sigue siendo estructural porque el parametro no debe declarar tipo atacable
type TipoAtacable = {
	var energia : Int
	def potencialOfensivo : Int
}
def atacaA(otro: TipoAtacable) = {???}
```

La sobrecarga de metodos es el proceso por el cual se pueden definir metodos con un mismo nombre, pero con distinta firma. La firma contiene el nombre del metodo y la cantidad de parametros y el tipo de estos.
**La sobrecarga no es polimorfismo**, son dos metodos distintos. 
Scala tampoco tiene multiple dispatch o dispatch dinamico. Cuando hay varias opciones se ejecuta el metodo con el tipo que vos tenes.

# La granja
```scala
object GranjaApp extends App {
	var animal: Animal = new Vaca
	var vaca: Vaca = new Vaca

	// al animal no podemos mandarle los mensajes de vaca
	// aunque tenga una vaca adentro ya que lo definimos
	// como animal
}
```

## Subtipado / bound

```scala
var unaColeccion = Set(new Vaca, new Caballo, new Granero)
unaColeccion.filter { unElemento => unElemento.estaGordo }
// no podemos hacer esto, porque no sabemos que hay dentro 
// de la coleccion, el filter espera algun parametro
// naturaleza

//la manera de resolverlo es pasarle un parametro de tipo
var unaColeccion: Set[Animal] = Set[Animal](new Vaca, new Caballo)
```

```scala
// Este corral tiene adentro un set que podria ser de cualquier
// tipo de animal, esto no es comodo, no podemos ordeniar un 
// set de vacas
class Corral(val animales: Set[Animales])

class Pastor{
	def pastorear(animales: Set[Animal]): Unit = animales.foreach(_.come)
}
class Lechero {
	// esto falla en el ide porque el corral tiene animales, no vacas
	def ordeniar(corral: Corral): Unit = corral.animales.foreach(_.ordeniate)
}




// Podemos usar tipos parametricos para las clases que creemos
class Corral[T](val animales: Set[T])

class Lechero {
	def ordeniar(corral: Corral[Vaca]): Unit = corral.animales.foreach(_.ordeniate)
}

val corralito = new Corral(Set(new Vaca, new Vaca))

// el problema es que ahora esta linea falla, porque un set de Vacas no es lo mismo que un set de Animales
pastor.pastorear(corralito.animales)

// y podemos crear corrales con cualquier cosa
val corralFalopa = new Corral(Set(1,2,3))





// La manera de solucionar el corralFalopa es decirle que la T va a estar restringida a ser Subtipo de Animal, con un upperbound (<:). Otra es underbound o lowerbound (>:)
class Corral[T <: Animal](val animales: Set[T])

```

## Varianza de tipos

`C[T] <: C[U]` 'C de T es subtipo de C de U?'

Por ahora solo se cumple si `T = U` , es el approach mas simple y sencillo. Se conoce como *invarianza*, basicamente no es varianza de tipos.

Esto surge de que capaz, en nuestro ejemplo, si esperabamos un set de animales, no lo podemos recibir un set de Vacas por que no podriamos realizar operaciones como agregar un Caballo sin que despues nos rompa en algun otro lado.

```scala
// funcion en Scala de un parametro, y un retorno
var f: Function[Vaca, Vaca] = null
```

### Covarianza y Contravarianza
No es a nivel lenguaje, es a nivel 'contexto'

Covarianza: Si t es subtipo de u C de T es subtipo de C de U
`C[T] <: C[U]` si `T <: U`

Contravarianza: Si t es supertipo de u C de T es subtipo de C de U
`C[T] <: C[U]` si `T >: U`

Esto pasa cuando se especifica, como por ejemplo
```scala
// El + especifica esa covarianza, el - contravarianza
Function[-P, +R]

var f: Vaca => Vaca = ??? 

// funciona
def i(vaca: Vaca): VacaLoca = ???

// no funciona
def j(vaca: VacaLoca): Vaca = ???

// funciona
def k(vaca: Animal): Vaca = ???

// Entonces puedo hacer
def l(vaca: Animal): VacaLoca = ???
```

```scala
// para solucionar que el pastor pueda pastorear
pastor.pastorear(corralito.animales)

// la manera que tenemos de usar covarianza en un conjunto es 
// usar directmante List que es covariante porque no teiene efecto
// no tiene add, contains, etc
List[+T]

class Corral[+T <: Animal](val animales: List[T])

val corralito = new Corral(List(new Vaca, new Vaca))

pastor.pastorear(corralito.animales)

lechero.ordeniar(corralito)

// El precio que pagamos es que ahora no podemos usar T como 
// parametro porque estaria en un tipo contravariante
class Corral[+T <: Animal](val animales: List[T]) {
	// esta linea falla por tipo T en posicion contravariante
	def m(param: T) = ???
}
```

La varianza afecta a la interfaz. La covarianza y la contravarianza en general vienen dadas por dominio. Al usar covarianza y contravarianza pagamos un precio, los tipos contravariantes y covariantes van en posiciones contravariantes y covariantes respectivamente. 

