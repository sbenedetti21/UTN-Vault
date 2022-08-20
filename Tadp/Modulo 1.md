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

### Mixin

### Trait

Leer paper de mixin trait y stateful trait