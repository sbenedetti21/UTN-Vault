# Objetos vs Funcional

## Conceptos clave
### Objetos
- Polimorfismo: es lo que mejor representa a objetos. Hay polimorfismo cuando mas de un objeto entienden los mismos mensajes, puedo acoplarme a cualquiera de estos sin importar la manera en que están implementados. Contrario a pattern matching. El polimorfismo es mas escalable, a veces.
- Encapsulamiento: ocultar/negar el acceso a la implementación de un objeto, para resistir al cambio y disminuir el acoplamiento.
- Delegación: definición de interfaces, definir quien tiene que hacer cada tarea. Puede traer problema cuando una tarea depende de dos objetos o mas de igual manera.

### Funcional
- Pattern Matching
- Pureza: trabajo sin efecto, transparencia referencial
- Orden superior: la función como dato

## Patrón Visitor
El visitor rompe el encapsulamiento, ya que muchas veces debemos conocer el estado interno del objeto que está siendo visitado.
La delegación se ve afectada porque no estamos realmente realizando las tareas donde queremos hacerlas, las delegamos al visitor.
Si agrego un nuevo elemento es dificil seguir manteniendo el código porque tengo que agregar a todos los visitors la lógica para visitarlo, va contra el polimorfismo.

## Objetos-Funcional
