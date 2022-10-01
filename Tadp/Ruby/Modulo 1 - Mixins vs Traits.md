# Objetos
```
class Guerrero {
	pot-ofensivo
	pot-defensivo

	atacar()
	sufrir_dano()
}
```

Con una clase voy a poder:
- Voy a poder instanciar muchos guerreros.
- Definir comportamiento
- Definir estado
- Denotar naturaleza

**Encapsulamiento**
**Polimorfismo**
**Delegacion**

**Autoconsistencia**

EL concepto principal en objetos no es el objeto, sino el envio de *mensajes*, no los metodos ni los objetos.
Leer sobre Alan Key y Smalltalk

Ademas del guerrero surge un espadachin, que se comporta al igual que un guerrero pero, con una espada que modifica el potencial ofensivo.

- Composicion: El espadachin es una clase que tiene espada y tiene guerrero. Para que esto funcione tengo que incorporar todos los metodos de guerrero. El problema es que no escala, tiene mucho *boilerplate* (codigo burocratico que necesito para que la funcionalidad ande), y hay perdida de identidad (los objetos no son los mismos, un guerrero si manda `self.por-ofensivo` va a seguir siendo el del guerrero, no del espadachin), y complejidad (a nivel arquitectura algo es mas complejo que en su variante, para representar a un espadachin necesito dos objetos, no uno). Una ventaja es que no gastamos la herencia simple.
- Guerrero con espada, si tiene espada es espadachin, sino la tendra en null y sera un guerrero (null object). Problema en el momento en que el espadachin necesita comportamiento específico (`cambiar_espada()`), tiene mayor complejidad, potencial problema de constistencia (no existe el espadachin perse, alguien de afuera podria por accidente ponerle una espada a un guerrero y arruinar la logica), a futuro el guerrero podría exponer una interfaz "erronea".
- Herencia simple: Espadachín hereda de Guerrero. Objetivo mecánico (si agrego cosas al guerrero automáticamente pasan al espadachín), objetivo mas "natural" (segun enunciado, un espadachín ES un guerrero) Es la adecuada en este caso, pero porque está planteado para esto mismo.

Aparece una muralla que tiene un potencial defensivo y puede sufrir daño, pero no puede atacar.

En este caso no podemos utilizar herencia de la muralla al guerrero o viceversa. Surge la idea de *generalizar*, crear una clase superior de donde hereden muralla y guerrero, tal como Defensor. La clase Muralla queda vacía! No hay nada de malo en tener clases vacías, sobre todo por la idea de naturaleza que generan, o ante algún cambio en el futuro.

Surge un *Misil* el cual puede atacar y tiene potencial ofensivo. No puede sufrir daño.

No hay linda solución a esta problemática
- Herencia "forzada": desde lugares que no corresponden, que defensor herede de atancante por ejemplo. Trae el problema de exponer interfaces incorrectas-
- Copy-paste: es una buena solución puesta en contexto, obviamente, repite lógica por lo cual es una desventaja.
- Composición: El guerrero cuenta con un *defensor* y un *atacante* nos olvidamos de la herencia. Es más compleja, y sufrimos de pérdida de identidad, tenemos que repetir el código para que se referencie bien.

En la herencia solo debe haber una única *Superclase*, ya qeu sino el *method lookup* no sabría para donde ir. La herencia simple no alcanza para resolver este problema.

## Herencia múltiple

La idea siguiendo el ejemplo anterior, es que guerrero pueda heredar de defensor y de atancante.
Genera el problema del rombo, el method-lookup no puede saber a donde ir a buscar un método.

# Mixin y Trait

Problemática:
![[Pasted image 20220827134605.png]]
La herencia simple no permite esta solución por lo cual vamos a utilizar otra cosa, que no son clases, las cuales nos permiten resolver esto
![[Pasted image 20220827134641.png]]
## Mixin
Propuestos por Gilad Bracha. Un mixin especifica un conjunto de modificaciones aplicable a una clae parametrizable, pueden ser vistos como funciones que reciben una superclase y producen subclases. Son similares a una *clase abstracta*. Son independientes de las clases que lo usan.

## Trait
Propuestos por Stéphane Ducasse. Los mixins permiten obtener mejor reutilización del código que la herencia simple. El problema es que cuando quiero combinar mixines, me encuentro con ciertos problemas. Los traits tienen mas granularidad. Se *aplanan* sobre la clase que los usa.

## Conflictos

![[Pasted image 20220827140349.png]]

Los mixines proponen una solución automática a este conflicto, la *linearización* (convierte el grafo a una línea), cuando D extiende de B y C, tiene que elegir cual prefiere.
Los traits proponen que si B y C implementan el mismo método, la combinación no es posible, sino que hay que resolverlo manualmente mediante alguna operación algebráica (*glue code*). Por eso se realiza un *flattening* o aplanamiento, donde se genera esta nueva clase D'.

## Clase
Cuando realizamos clases:
![[Pasted image 20220827140831.png]]
En los mixines no se sabe porque casi que un mixin es una clase segun lo describe Bracha.

## Resumen
![[Pasted image 20220827140932.png]]
![[Pasted image 20220827141448.png]]

# Aplicado a nuestro modelo con mixins

```
module Atacante
	attr_accessor :potOfensivo

	def atacar(otro)
		daño = self.potOfensivo() - otro.potDefensivo()
		otro.recibirDaño(daño)
	end
end
```
```
class Misil
	include Atacante

	...
end
```

```
class Guerrero
	include Atacante
	include Defensor // esta línea pisa a la del atcnte

	...
end
```

## Kamikaze

Aparece un *Kamikaze*, el cual puede atacar y puede ser atacado, inmediatamente apenas ataca, explota. Una idea razonable podría ser extender de guerrero con herencia simple, pero con los mixines surgen nuevas maneras de resolver esto. Puedo directamente incluir los dos mixins *Atacante* y *Defensor* en la definición de Kamikaze.

![[Pasted image 20220827143007.png]]

De esta manera, el kamijaze no queda anexado a un guerrero que capaz no tiene nada que ver.

## Reposar

Cuando dejamos reposar a un atacante gana +1 de potencial ofensivo, cuando dejamos reposar a un defensor recupera 10 puntos de daño.
![[Pasted image 20220827143523.png]]

#### Muralla

```
class Muralla
	include Defensor

	def reposar()
	end
end
```
El method lookup se fija primero en Muralla asique ya lo resolvemos de esa manera.

#### Kamikaze

```
class Kamikaze
	include Defensor
	include Atacante // reordeno para que el atacante sea mas atacante que defensor

	...
end
```

#### Guerrero

El guerrero quiere hacer ambos por lo cual no puedo reordenar.

1. Mixin puros
![[Pasted image 20220827144216.png]]
Problema de agregar super a un mixin.

La solución a esto es crear un mixin *Unidad* el cual es un mixin terminador, hace reposar pero no hacer super() por lo que no genera errores:
![[Pasted image 20220827144351.png]]
Esta solución es super dinámica, y un poco compleja.

2. Solución en Ruby (no pura)
![[Pasted image 20220827144925.png]]
Usando "chiches" de Ruby podemos llegar a esta solución muy sencilla 