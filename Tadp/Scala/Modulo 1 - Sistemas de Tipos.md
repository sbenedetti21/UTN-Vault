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