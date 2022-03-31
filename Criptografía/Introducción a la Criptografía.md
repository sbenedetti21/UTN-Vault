# La criptografía

Se parte de la base de que un *emisor* y un *receptor* se quieren comunicar. Para eso el emisor envía un *mensaje*. Se asume que el *canal* por donde viaja ese mensaje es **inseguro**.

## CIA
- Confidencialidad
- Integridad
- Disponibilidad (availability): la única que la criptografía no hace.

La criptografía ofrece 
- Confidencialidad: La info solo puede ser leida por las entidades autorizadas
- Integridad: La info solo puede ser modificada por las entidades autorizadas
- Autenticación: mecanismo que permite comprobar la entidad de una entidad
- No repudio: si se usan mecanismos de autenticación criptográficos, se asuma la imposibilidad práctiva de suplantación  de la identidad.

## Criptología
> **Criptología** = Criptografía + Criptoanálisis

**Criptografía**: estudia el diseño y propiedades de algoritmos y mecanismos que ofrecen confidencialidad e intergridad.
**Criptoanálisis**: busca vulnerabilidades y desarrolla ataques a los mecanismos criptográficos.

## Manera de cumplir
Para cada mensaje solo debe haber un y solo un cifrado y lo mismo para el cifrado. Se cifra con una clave *k*. Si eva no conoce la clave no va a poder leer el mensaje. Se asegura la **CONFIDENCIALIDAD**

![[zz_confidencialidad.png]]

Existen mecanismos para garantizar la **INTEGRIDAD** de los mensajes. 

Al igual que para garantizar **AUTENTICACION**.

Y lo mismo con el **NO REPUDIO**

## Link importante
[CryptoTool](https://www.cryptool.org/en/)