## NoSQL
Concepto de sharding y de replica set para escalar horizontalmente.

## Cache
Para usar una cache tengo que definir bien cual es la `key` por la cual se van a buscar los registros, sino no tiene sentido.

## Buffer
Toma muchos registros y los almacena permitiendo que el cliente pueda accederlos sin necesidad de ir a la base por cada registro.

## Broker
Los interesados se subscriben al tema que les interesa (en el caso de tinder era el dominio). Provee tolerancia a fallos cuando si el tercero se cae y vuelve a levantar unas horas despues, no pierde el mensaje, queda  almacenado en el broker. No tiene sentido un adapter porque hablamos siempre con el broker.

## Ejemplo "catalogo"
![[Pasted image 20230224115920.png]]