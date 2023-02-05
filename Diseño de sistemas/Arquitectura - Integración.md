# Tipos de integración

![[Pasted image 20230205203545.png]]

## Cola de mensajes

Componente *intermedio* entre nuestro sistema y el otro. Tengo que saber que cuando voy por este método, estoy pensando en algo *asíncrono*, ya que cuando dejo un mensaje en la cola el otro sistema puede tomarlo cuando quiera, no instantaneamente.

## API REST

Podría implementarlo mi sistema o el otro sistema. En terminos de *interoperabilidad* es bueno ya que como sistema conozco la estructura que tiene la api rest y se que luego de enviarle un request me devolverá un JSON.

## BD Compartida

En terminos de *mantenibilidad* tengo mas nodos que manterner.